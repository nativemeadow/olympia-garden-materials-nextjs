'use server';

import db from '@/db';
import jwt from 'jsonwebtoken';
import { jwtDecode } from 'jwt-decode';
import bcrytp from 'bcryptjs';
import { forgotPassword as forgot } from '@/lib/templates/forgot-password';
import { sendMail, compileTemplate } from '@/components/email/email-sender';
import { resetPassword } from './resetPassword';
import { string } from 'zod';

export const forgotPassword = async (email: string) => {
	const user = await db.users.findUnique({
		where: { email },
	});

	if (!user) {
		return {
			success: false,
			message: 'Email not found. could not send reset password link',
		};
	}

	// Send email with link to reset password

	// Generate reset token
	const resetToken = jwt.sign(
		{ email: user.email },
		process.env.RESET_TOKEN_SECRET || '',
		{ expiresIn: '1h' }
	);

	// Update user with reset token
	const updateInfo = await db.users.update({
		where: { email },
		data: {
			reset_token: resetToken,
		},
	});

	// Send email with link to reset password
	const resetUrl = `${process.env.NEXTAUTH_URL}/forgot-password/${resetToken}`;
	const resetLinkName = 'Reset Password Here';

	// Send email
	await sendMail({
		to: email,
		name: user.name,
		subject: 'Reset Password',
		body: compileTemplate(forgot, { resetLinkName, resetUrl }),
	});

	return {
		success: true,
		message: 'Email sent',
	};
};

export const verifyResetToken = async (token: string) => {
	console.log('Verifying token', token);

	let decoded: any;
	// Decode token
	try {
		decoded = jwtDecode(token);
		console.log('Decoded:', decoded);
	} catch (error) {
		console.error('Error verifying token:', error);
		return {
			success: false,
			message: 'Error verifying token',
		};
	}

	console.log('email decoded:', decoded.email);

	const user = await db.users.findUnique({
		where: { email: decoded.email },
	});

	if (!user) {
		console.log('Email not found. could not reset password');
		return {
			success: false,
			message: 'Email not found. could not reset password',
		};
	}

	// Verify token
	try {
		const verified = jwt.verify(
			token,
			process.env.RESET_TOKEN_SECRET || ''
		);
		if (!verified) {
			console.log('Token is not valid');
			return {
				success: false,
				message: 'Token is not valid',
			};
		}
	} catch (error) {
		console.log('Error verifying token', error);
		return {
			success: false,
			message: 'Token expired',
		};
	}

	try {
		const user = await db.users.findFirst({
			where: { reset_token: token },
		});
		if (!user) {
			console.log('User not found');
			return {
				success: false,
				message: 'User not found',
			};
		}
	} catch (error) {
		console.error('Error finding user:', error);
		return {
			success: false,
			message: 'Error finding user',
		};
	}

	console.log('Token is valid');

	return {
		success: true,
		message: 'Token is valid',
	};
};
