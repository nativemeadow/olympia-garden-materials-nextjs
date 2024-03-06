'use server';

import { NextResponse } from 'next/server';
import type { NextRequest } from 'next/server';

export async function middleware(request: NextRequest) {
	const cookieName = 'next-auth.session-token';
	const cookieValue = request.cookies.get(cookieName);

	if (cookieValue && request.nextUrl.pathname === '/login') {
		console.log(`Value of ${cookieName} cookie:`, cookieValue);
		return NextResponse.redirect(new URL('/', request.url));
	}

	if (cookieValue && request.nextUrl.pathname === '/register') {
		console.log(`Value of ${cookieName} cookie:`, cookieValue);
		return NextResponse.redirect(new URL('/profile', request.url));
	}

	if (
		!cookieValue &&
		(request.nextUrl.pathname === '/admin' ||
			request.nextUrl.pathname === '/admin/dashboard' ||
			request.nextUrl.pathname === '/admin/dashboard/categories' ||
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
		'/admin/',
		'/admin/dashboard',
		'/admin/dashboard/categories',
		'/admin/dashboard/products',
		'/admin/dashboard/users',
		'/admin/dashboard/orders',
		'/admin/dashboard/reviews',
		'/admin/dashboard/settings',
		'/admin/dashboard/notifications',
		'/admin/dashboard/transactions',
	],
};
