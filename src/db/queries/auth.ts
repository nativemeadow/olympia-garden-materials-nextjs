import bcrytp from 'bcryptjs';
import jwt from 'jsonwebtoken';
import type { users } from '@prisma/client';
import db from '@/db';

export const findUserByEmail = async (email: string): Promise<users | null> => {
	const user = await db.users.findUnique({
		where: { email },
	});
	return user;
};

export const validPassword = async (
	password: string,
	hashedPassword: string
): Promise<boolean> => {
	const isMatch = await bcrytp.compare(password, hashedPassword);
	return isMatch;
};

export const updateUserTokens = async (
	id: bigint,
	reset_token: string,
	refresh_token: string
): Promise<users> => {
	const user = await db.users.update({
		where: { id },
		data: {
			reset_token,
			refresh_token,
		},
	});
	return user;
};

export const generateToken = async (user: users): Promise<string> => {
	const token = jwt.sign(
		{
			id: user.id,
			email: user.email,
			name: user.name,
		},
		process.env.ACCESS_TOKEN_SECRET!,
		{
			expiresIn: '1h',
		}
	);
	return token;
};

export const generateRefreshToken = async (user: users): Promise<string> => {
	const refreshToken = jwt.sign(
		{
			id: user.id,
			email: user.email,
			name: user.name,
		},
		process.env.REFRESH_TOKEN_SECRET!,
		{
			expiresIn: '1d',
		}
	);
	return refreshToken;
};

export const verifyToken = async (token: string): Promise<string | object> => {
	const payload = jwt.verify(token, process.env.ACCESS_TOKEN_SECRET!);
	return payload;
};

export const verifyRefreshToken = async (
	token: string
): Promise<string | object> => {
	const payload = jwt.verify(token, process.env.REFRESH_TOKEN_SECRET!);
	return payload;
};

export const registerUser = async (
	name: string,
	email: string,
	password: string,
	reset_token: string
): Promise<users> => {
	const hashedPassword = await bcrytp.hash(password, 10);
	const user = await db.users.create({
		data: {
			name,
			email,
			password: hashedPassword,
			reset_token,
		},
	});
	return user;
};
