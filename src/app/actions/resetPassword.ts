'use server';

import db from '@/db';
import jwt from 'jsonwebtoken';
import { jwtDecode } from 'jwt-decode';
import bcrytp from 'bcryptjs';

export const resetPassword = async (
	password: string,
	confirmPassword: string,
	token: string
) => {
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

	const user = await db.users.findUnique({
		where: { email: decoded.email },
	});

	if (!user) {
		return {
			success: false,
			message: 'Email not found. could not reset password',
		};
	}

	console.log('User found');

	// Verify token
	const verified = jwt.verify(token, process.env.RESET_TOKEN_SECRET || '');
	if (!verified) {
		return {
			success: false,
			message: 'Token is not valid',
		};
	}

	console.log('Token is valid');

	if (password !== confirmPassword) {
		return {
			success: false,
			message: 'Passwords do not match',
		};
	}

	console.log('Passwords match');

	const hashedPassword = await bcrytp.hash(password, 10);

	// Update user with new password
	const updateInfo = await db.users.update({
		where: { email: decoded.email },
		data: {
			password: hashedPassword,
			reset_token: '',
		},
	});

	return {
		success: true,
		message: 'Password reset',
	};
};
