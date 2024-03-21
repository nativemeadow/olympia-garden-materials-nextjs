'use server';

import db from '@/db';
import { contactUsSchema, TContactUsSchema } from '@/lib/types';

export type ContactFormState = {
	errors: {
		root?: string[];
	};
	success?: boolean;
};

export const contactUs = async (
	formState: TContactUsSchema
): Promise<ContactFormState> => {
	const { name, email, subject, phone, message } = formState;

	const parseResult = contactUsSchema.safeParse(formState);
	if (!parseResult.success) {
		// Handle validation error
		console.error(parseResult.error);
		return {
			errors: { root: parseResult.error.formErrors.formErrors },
			success: false,
		};
	}

	console.log('formState: ', formState);

	const contact = await db.contact_us.create({
		data: {
			name,
			email,
			subject,
			phone,
			comment: message,
			updated_at: new Date(), // Add the missing updated_at property
		},
	});

	return {
		errors: {},
		success: true,
	};
};
