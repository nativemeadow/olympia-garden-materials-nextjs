import NextAuth from 'next-auth';
import { NextAuthOptions } from 'next-auth';
import CredentialsProvider from 'next-auth/providers/credentials';
import bcrytp from 'bcryptjs';
import crypto from 'crypto';
import { v4 as uuidv4 } from 'uuid';
import type { users } from '@prisma/client';

import db from '@/db';

type extendedToken = {
	id: string;
	uuid: string;
	email: string;
};

export const authOptions: NextAuthOptions = {
	session: {
		strategy: 'jwt',
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
			},
			async authorize(credentials, req) {
				if (!credentials?.email || !credentials?.password) {
					return null;
				}

				let user = await db.users.findUnique({
					where: { email: credentials.email },
				});

				if (!user) {
					// User does not exist, create new user
					const hashedPassword = await bcrytp.hash(
						credentials.password,
						10
					);
					const resetToken = crypto.randomBytes(35).toString('hex');
					const refresh_token = crypto
						.randomBytes(35)
						.toString('hex');
					user = await db.users.create({
						data: {
							uuid: uuidv4(),
							email: credentials.email,
							password: hashedPassword,
							name: credentials.name,
							reset_token: resetToken,
							refresh_token,
							created_at: new Date(),
							// Add other necessary fields here
						},
					});
				} else {
					const isMatch = await bcrytp.compare(
						credentials.password,
						user.password
					);

					if (!isMatch) {
						return null;
					}
				}

				return {
					id: user.id + '',
					uuid: user.uuid,
					name: user.name,
					email: user.email,
					resetToken: user.reset_token,
					token: user.refresh_token,
				};
			},
		}),
	],
	callbacks: {
		session: async ({ session, token }) => {
			let userSession;
			if (token && token.sub && typeof token.uuid === 'string') {
				session = {
					...session,
					user: {
						...session.user,
						id: token.sub,
						uuid: token.uuid,
					},
				};
			}
			console.log('Session Callback', { session });
			return session;
		},
		jwt: async ({ token, user }) => {
			const userSignIn = user as unknown as users;
			if (user) {
				// user is in the session callback (above) is set here in the JWT callback
				token.user = userSignIn;
				return {
					...token,
					id: userSignIn.id,
					uuid: userSignIn.uuid,
				};
			}
			console.log('JWT Callback', { token });
			return token;
		},
	},
};

const handler = NextAuth(authOptions);
export { handler as GET, handler as POST };
