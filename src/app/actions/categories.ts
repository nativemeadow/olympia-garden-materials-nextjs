'use server';

import db from '@/db';
import { Category } from '@/lib/types';
import { parseCustomJson } from '@/lib/custom-json';

export const getAll = async (): Promise<Category[]> => {
	return (await db.categories.findMany({
		where: {
			// parent_category: null,
		},
		orderBy: {
			title: 'asc',
		},
	})) as Category[];
};

export const getTopLevel = async (): Promise<Category[]> => {
	return (await db.categories.findMany({
		where: {
			parent_category: null,
		},
	})) as Category[];
};

export const getBySlug = async (slug: string) => {
	const category = await db.categories.findFirstOrThrow({
		where: {
			slug,
		},
		include: {
			category_product: {
				include: {
					products: {
						include: {
							prices: true,
						},
					},
				},
			},
		},
	});
	const subCategories = await db.categories.findMany({
		where: {
			parent_category: category.id,
		},
	});

	const finalMerge = [category, ...subCategories];

	const parsedCategories = parseCustomJson(finalMerge as any);

	const parentCategory = parsedCategories[0];

	return { parsedCategories, parentCategory };
};
