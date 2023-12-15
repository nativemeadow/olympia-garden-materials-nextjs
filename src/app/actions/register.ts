'use server';

import bcrytp from 'bcryptjs';
import { signIn } from 'next-auth/react';
import { v4 as uuidv4 } from 'uuid';
import db from '@/db';
import { registerSchema } from '@/lib/types';
import type { TRegisterSchema } from '@/lib/types';

type user = {
	id: string;
	uuid: string;
	email: string;
	name: string;
	password: string;
};

export type RegisterFormState = {
	user?: user;
	errors: {
		root?: string[];
	};
	success?: boolean;
};

export const registerUser = async (
	formState: TRegisterSchema
): Promise<RegisterFormState> => {
	const { email, name, password, confirmPassword } = formState;

	const parseResult = registerSchema.safeParse(formState);
	if (!parseResult.success) {
		// Handle validation error
		console.error(parseResult.error);
		return {
			errors: { root: parseResult.error.formErrors.formErrors },
			success: false,
		};
	}

	let user = await db.users.findUnique({
		where: { email: email },
	});

	if (user) {
		return {
			errors: { root: ['User already exists'] },
			success: false,
		};
	}

	const hashedPassword = await bcrytp.hash(password, 10);
	user = await db.users.create({
		data: {
			uuid: uuidv4(),
			email: email,
			password: hashedPassword,
			name: name,
			reset_token: '',
		},
	});

	return {
		user: {
			id: user.id,
			uuid: user.uuid,
			email: user.email,
			name: user.name,
			password: user.password,
		},
		errors: {},
		success: true,
	};
};
