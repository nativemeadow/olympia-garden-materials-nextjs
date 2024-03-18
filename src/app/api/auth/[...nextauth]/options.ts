import { NextAuthOptions } from 'next-auth';
import CredentialsProvider from 'next-auth/providers/credentials';
import { cookies } from 'next/headers';
import bcrytp from 'bcryptjs';
import crypto from 'crypto';
import { v4 as uuidv4 } from 'uuid';
import type { users } from '@prisma/client';

import db from '@/db';

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
				remember_me: { label: 'Remember Me', type: 'checkbox' },
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
					user = await db.users.create({
						data: {
							uuid: uuidv4(),
							email: credentials.email,
							password: hashedPassword,
							name: credentials.name,
							reset_token: resetToken,
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
					remember_me: credentials.remember_me ? true : false,
					resetToken: user.reset_token,
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
					},
				};
			}
			//console.log('Session Callback', { session });
			return session;
		},
		jwt: async ({ token, user }) => {
			const userSignIn = user as users;
			if (user) {
				console.log('User remember', userSignIn);
				token.maxAge = userSignIn.remember_me
					? 7 * 24 * 60 * 60
					: 60 * 60; // 1 week or 1 hour
				// user is in the session callback (above) is set here in the JWT callback
				token.user = userSignIn;
				return {
					...token,
					id: userSignIn.id,
					uuid: userSignIn.uuid,
				};
			}
			//console.log('JWT Callback', { token });
			return token;
		},
	},
	pages: {
		signIn: '/login',
		newUser: '/register',
	},
};

//function refreshAccessToken() {
// Function to refresh access token
//}
