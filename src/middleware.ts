'use server';

import { jwtDecode } from 'jwt-decode';
import { decode } from 'next-auth/jwt';
import { NextResponse } from 'next/server';
import type { NextRequest } from 'next/server';
import { users } from '@/lib/types';

type TypeSession = {
	name: string;
	value: string;
};

export async function middleware(request: NextRequest) {
	const cookieName = 'next-auth.session-token';
	const token: TypeSession = request.cookies.get(
		'next-auth.session-token'
	) as unknown as TypeSession;
	const cookieValue = request.cookies.get(cookieName);

	console.log('cookieValue:', cookieValue);

	console.log('token:', typeof token, token);

	if (token && typeof token.value === 'string') {
		const secret = process.env.NEXTAUTH_SECRET || ' ';
		const decodedToken: users = (await decode({
			token: token.value,
			secret,
		})) as users;

		const roles = decodedToken.users_accounts.map(
			(account) => account.account.role
		);

		// Use the decodedToken...
		console.log('decoded token from middleware', roles);
		if (!roles.includes('Administrator')) {
			return NextResponse.redirect(new URL('/', request.url));
		}
	}

	if (cookieValue && request.nextUrl.pathname === '/login') {
		console.log(`Value of ${cookieName} cookie:`, cookieValue);
		return NextResponse.redirect(new URL('/', request.url));
	}

	if (cookieValue && request.nextUrl.pathname === '/register') {
		console.log(`Value of ${cookieName} cookie:`, cookieValue);
		return NextResponse.redirect(new URL('/profile', request.url));
	}

	if (!cookieValue && request.nextUrl.pathname === '/profile') {
		console.log(`Value of ${cookieName} cookie:`, cookieValue);
		return NextResponse.redirect(new URL('/login', request.url));
	}

	if (
		!cookieValue &&
		(request.nextUrl.pathname === '/admin' ||
			request.nextUrl.pathname === '/admin/dashboard' ||
			request.nextUrl.pathname === '/admin/dashboard/categories' ||
			request.nextUrl.pathname === '/admin/dashboard/categories/edit' ||
			request.nextUrl.pathname === '/admin/dashboard/products')
	) {
		return NextResponse.redirect(new URL('/login', request.url));
	}

	return NextResponse.next();
}

export const config = {
	matcher: [
		'/login',
		'/register',
		'/profile',
		'/admin/',
		'/admin/dashboard',
		'/admin/dashboard/(.*)',
		'/admin/dashboard/(.*)/:path?',
	],
};
