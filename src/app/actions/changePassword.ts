'use server';

import db from '@/db';
import bcrytp from 'bcryptjs';
import { resetPasswordSchema } from '@/lib/types';
import { TResetPasswordSchema } from '@/lib/types';

import { revalidatePath } from 'next/cache';

type FormErrors = {
	_form?: string[];
	oldPassword?: string[];
	confirmPassword?: string[];
};

export type ChangePasswordFormState = {
	errors: FormErrors;
	success?: boolean;
};

export const changeUserPassword = async (
	id: string,
	uuid: string,
	formState: TResetPasswordSchema,
	formData: FormData
): Promise<ChangePasswordFormState> => {
	const { oldPassword, password, confirmPassword } = formState;
	console.log('changeUserPassword', id, formState);

	const parseResult = resetPasswordSchema.safeParse(formState);
	if (!parseResult.success) {
		// Handle validation error
		console.error(parseResult.error);
		return {
			errors: { _form: parseResult.error.formErrors.formErrors },
			success: false,
		};
	}
	const userId = parseInt(id, 10);

	// Find the user
	const user = await db.users.findUnique({
		where: { id: userId },
	});

	type FormErrors = {
		_form?: string[];
		oldPassword?: string[];
		confirmPassword?: string[];
	};

	if (password !== confirmPassword) {
		return {
			errors: {
				confirmPassword: ['confirm password does not match!'],
			},
			success: false,
		};
	}

	if (user) {
		const isMatch = await bcrytp.compare(oldPassword, user.password);

		if (!isMatch) {
			return {
				errors: {
					oldPassword: ['Current password does not match.'],
				},
				success: false,
			};
		}

		// User does not exist, create new user
		const hashedPassword = await bcrytp.hash(password, 10);
		await db.users.update({
			where: {
				id: user.id,
			},
			data: {
				password: hashedPassword,
			},
		});
	}

	revalidatePath(`/reset-password/${id}`);
	return {
		errors: {},
		success: true,
	};
};
