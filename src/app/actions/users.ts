'use server';

import type {
	users,
	users_customer_type,
	users_accounts,
	account,
} from '@prisma/client';

import db from '@/db';

export const user = async (email: string) => {
	console.log('email: ', email);
	const results = await db.users.findUnique({
		where: { email },
		include: {
			users_accounts: {
				include: {
					account: true,
				},
			},
		},
	});

	return results;
};
