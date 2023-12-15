import { NextAuthOptions } from 'next-auth';
import CredentialsProvider from 'next-auth/providers/credentials';
import { cookies } from 'next/headers';
import bcrytp from 'bcryptjs';
import crypto from 'crypto';
import { v4 as uuidv4 } from 'uuid';
import type {
	users,
	users_customer_type,
	users_accounts,
	account,
} from '@prisma/client';
import { users as usersType } from '@/lib/types';

import db from '@/db';

export const authOptions: NextAuthOptions = {
	session: {
		strategy: 'jwt',
		maxAge: 60 * 60, // 1 hour
	},
	providers: [
		CredentialsProvider({
			name: 'Credentials',
			credentials: {
				name: {
					label: 'Name',
					type: 'text',
					placeholder: 'Your name',
				},
				email: {
					label: 'Email',
					type: 'text',
					placeholder: 'test.@example.com',
				},
				password: { label: 'Password', type: 'password' },
				confirmPassword: {
					label: 'Confirm Password',
					type: 'password',
				},
				remember_me: { label: 'Remember Me', type: 'checkbox' },
			},
			async authorize(credentials, req) {
				if (!credentials?.email || !credentials?.password) {
					return null;
				}

				let user: any = await db.users.findUnique({
					where: { email: credentials.email },
					include: {
						users_accounts: {
							include: {
								account: true,
							},
						},
					},
				});

				if (!user) {
					return null;
				}

				console.log('User', user);

				if (!user) {
					// User does not exist, create new user
					const hashedPassword = await bcrytp.hash(
						credentials.password,
						10
					);
					const resetToken = crypto.randomBytes(35).toString('hex');
					user = await db.users.create({
						data: {
							uuid: uuidv4(),
							email: credentials.email,
							password: hashedPassword,
							name: credentials.name,
							reset_token: resetToken,
							created_at: new Date(),
						},
					});
				} else {
					// User exists, check password
					const isMatch = await bcrytp.compare(
						credentials.password,
						user.password
					);

					if (!isMatch) {
						return null;
					}

					// get user accounts
					const users_accounts = user.users_accounts;
				}

				console.log(
					'User',
					user,
					'remember me:',
					credentials.remember_me
				);
				return {
					id: user.id + '',
					uuid: user.uuid,
					name: user.name,
					email: user.email,
					remember_me:
						credentials.remember_me === 'true' ? true : false,
					users_accounts: user.users_accounts,
				};
			},
		}),
	],
	callbacks: {
		session: async ({ session, token }) => {
			if (token && token.sub && typeof token.uuid === 'string') {
				session = {
					...session,
					user: {
						...session.user,
						id: token.sub,
						uuid: token.uuid,
						users_accounts: token.users_accounts,
					},
				};
				console.log('session callback', session);
				const expires = token.maxAge
					? new Date(Date.now() + Number(token.maxAge) * 1000)
					: new Date(Date.now() + Number(token.maxAge) * 1000);
				session.expires = expires.toISOString();
			}
			return session;
		},
		jwt: async ({ token, user }) => {
			interface loginUser extends users {
				remember_me: boolean;
				users_accounts: any[];
			}

			const userSignIn = user as unknown as loginUser;
			if (user) {
				const trueRM = userSignIn.remember_me ? true : false;
				token.maxAge = trueRM ? 7 * 24 * 60 * 60 : 60 * 60; // 1 week or 1 hour
				token.user = userSignIn;
				console.log('userSignIn', userSignIn);
				return {
					...token,
					id: userSignIn.id,
					uuid: userSignIn.uuid,
					users_accounts: userSignIn.users_accounts,
				};
			}
			return token;
		},
	},
	pages: {
		signIn: '/login',
		newUser: '/register',
	},
};
