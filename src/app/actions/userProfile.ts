'use server';

import db from '@/db';
import { userAddressSchema } from '@/lib/types';
import { TUserAddressSchema } from '@/lib/types';

import { revalidatePath } from 'next/cache';

export type UserAddressFormState = {
	errors: {
		_form?: string[];
	};
	success?: boolean;
};

export const updateUserAddress = async (
	id: string,
	formState: TUserAddressSchema
): Promise<UserAddressFormState> => {
	console.log('updateUserAddress', id, formState);
	const { phone, address, city, stateProvince, postalCode } = formState;

	const parseResult = userAddressSchema.safeParse(formState);
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

	if (user) {
		// If the user exists, find their address
		const userAddress = await db.user_address.findUnique({
			where: { user_uuid: user.uuid! },
		});

		if (userAddress) {
			// If the address exists, update it
			await db.user_address.update({
				where: { user_uuid: user.uuid! },
				data: {
					type: 'Shipping',
					phone,
					address,
					city,
					state_province: stateProvince,
					postal_code: postalCode,
				},
			});
		} else {
			// If the address does not exist, create it
			await db.user_address.create({
				data: {
					type: 'Shipping',
					phone,
					address,
					city,
					state_province: stateProvince,
					postal_code: postalCode,
					user_uuid: user.uuid, // associate the address with the user
				},
			});
		}
	}

	revalidatePath(`/profile/${id}`);
	return {
		errors: {},
		success: true,
	};
};
