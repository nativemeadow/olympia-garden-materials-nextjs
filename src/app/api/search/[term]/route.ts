'use server';

import { NextRequest, NextResponse } from 'next/server';
import db from '@/db';
import { bigIntToString } from '@/lib/bigIntToString';

export async function GET(req: NextRequest, res: NextResponse) {
	const terms = req.url?.split('/').pop();
	const searchTerms = terms as string;
	console.log('Term:', searchTerms);

	const result = await db.products.findMany({
		where: {
			OR: [
				{
					title: {
						contains: searchTerms,
					},
				},
				{
					description: {
						contains: searchTerms,
					},
				},
				{
					prices: {
						some: {
							title: {
								contains: searchTerms,
							},
							description: {
								contains: searchTerms,
							},
						},
					},
				},
				{
					category_product: {
						some: {
							categories: {
								title: {
									contains: searchTerms,
								},
								description: {
									contains: searchTerms,
								},
							},
						},
					},
				},
			],
		},
		include: {
			prices: {
				select: {
					title: true,
					description: true,
					image: true,
					price: true,
					size: true,
					units: true,
				},
			},
			category_product: {
				select: {
					categories: {
						select: {
							// Specify the fields you want to include from the categories table
							id: true,
							title: true,
							description: true,
							// Add more fields as needed...
						},
					},
				},
			},
		},
	});

	const resultWithBigIntAsString = bigIntToString(result);
	return Response.json(resultWithBigIntAsString);
}
