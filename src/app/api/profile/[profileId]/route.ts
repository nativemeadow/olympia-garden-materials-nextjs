import { NextRequest, NextResponse } from 'next/server';
import db from '@/db';

export async function GET(req: NextRequest, res: NextResponse) {
	const profileId = req.url?.split('/').pop();
	const userId = parseInt(profileId!, 10);
	console.log('input profileId:', profileId);

	if (isNaN(userId)) {
		Response.json({ status: 400, message: 'Invalid profileId' });
		return;
	}

	if (!profileId) {
		Response.json({ status: 400, message: 'Missing query parameters' });
		return;
	}

	try {
		const userProfile = await db.users.findFirstOrThrow({
			where: { id: userId },
			include: {
				user_address: true,
			},
		});

		if (!userProfile) {
			Response.json({ status: 404, message: 'User not found' });
			return; // Add return here to stop execution if user is not found
		}

		return Response.json({
			id: userId,
			uuid: userProfile.uuid,
			name: userProfile.name,
			email: userProfile.email,
			phone: userProfile?.user_address?.phone,
			address: userProfile.user_address?.address,
			city: userProfile.user_address?.city,
			state_province: userProfile.user_address?.state_province,
			postal_code: userProfile.user_address?.postal_code,
		});
	} catch (error) {
		Response.json({ status: 500, message: 'Error getting user profile' });
		console.log({ 'serve get profile error': error });
		return;
	}
}
