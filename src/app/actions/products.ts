'use server';

import db from '@/db';
import { parseCustomJson } from '@/lib/custom-json';
import { Product } from '@/lib/types';

export const getBySlug = async (slug: string): Promise<Product> => {
	const prod = await db.products.findFirstOrThrow({
		where: {
			slug,
		},
		include: {
			prices: true,
		},
	});

	return parseCustomJson(prod as any);
};

export const getProductsByCategory = async (id: string): Promise<any[]> => {
	// get products for a category
	const categoryProducts = await db.category_product.findMany({
		where: {
			category_id: +id,
		},
		include: {
			products: {
				include: {
					prices: true,
				},
			},
		},
	});

	return categoryProducts;
};
