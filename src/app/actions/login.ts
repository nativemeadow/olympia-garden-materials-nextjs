'use server';

import * as login from '@/db/queries/auth';
import type { users } from '@prisma/client';
import { cookies } from 'next/headers';
import { redirect } from 'next/navigation';

type loginType = {
	email: string;
	password: string;
};

type loginFormState = {
	errors?: {
		content?: string[];
		_form?: string[];
	};
	success?: boolean;
	refreshToken?: string | null;
	resetToken?: string | null;
};

export const loginHandler = async (
	data: loginType
): Promise<loginFormState | null> => {
	const { email, password } = data;
	const user = (await login.findUserByEmail(email)) as users;
	if (!user) {
		return {
			errors: {
				_form: ['Sorry, the email provided could not be found.'],
			},
		};
	}
	const isMatch = await login.validPassword(password, user!.password);

	if (!isMatch) {
		return {
			errors: {
				_form: ['Sorry, the provided password is not valid.'],
			},
		};
	}

	user.refresh_token = await login.generateRefreshToken(user);
	user.reset_token = await login.generateToken(user);
	login.updateUserTokens(user.id, user.refresh_token, user.reset_token);
	cookies().set('refresh_token', user.refresh_token, {
		path: '/',
		maxAge: 60 * 60 * 24,
		httpOnly: true,
	});

	redirect('/categories');
};
