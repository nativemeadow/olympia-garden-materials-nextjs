'use server';

import db from '@/db';
import { Category } from '@/lib/types';
import { parseCustomJson } from '@/lib/custom-json';
import { TCategoryUpdate } from '@/lib/types';
import { categoryUpdate } from '@/lib/types';

export const getRootCategories = async (): Promise<Category[]> => {
	return (await db.categories.findMany({
		where: {
			parent_category: null,
		},
		orderBy: {
			title: 'asc',
		},
	})) as Category[];
};

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

export const getById = async (id: string) => {
	const catId = Number(id);
	const category = await db.categories.findFirstOrThrow({
		where: {
			id: catId,
		},
	});

	console.log('Category:', category);

	return category;
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

type Categories = {
	id: number;
	title: string;
	slug: string;
	path: string;
	children: Category[];
};

export async function getCategoriesHierarchy() {
	const categories: Categories[] = await db.$queryRaw`
	WITH RECURSIVE category_tree AS (
		SELECT c1.id, c1.title, c1.slug, c1.parent_category, c1.slug AS path
		FROM categories c1
		WHERE c1.parent_category IS NULL
		UNION ALL
		SELECT c2.id, c2.title, c2.slug, c2.parent_category, CONCAT(ct.path, '/', c2.slug)
		FROM categories c2
		INNER JOIN category_tree ct ON c2.parent_category = ct.id
	)
	SELECT ct.*, COUNT(cp.product_id) AS product_count
	FROM category_tree ct
	LEFT JOIN category_product cp ON ct.id = cp.category_id
	GROUP BY ct.id, ct.title, ct.slug, ct.parent_category, ct.path
	ORDER BY path
	`;
	const buildHierarchy = (categories: Categories[], parent: any): any[] => {
		const result: any[] = [];

		categories.forEach((category: any) => {
			if (category.parent_category === parent) {
				const children = buildHierarchy(categories, category.id);
				if (children.length) {
					category.children = children;
				}
				result.push(category);
			}
		});
		return result;
	};

	const result = buildHierarchy(categories, null);

	// console.log(result);

	return result;
}

export type CategoryFormState = {
	errors: {
		_form?: string[];
	};
	success?: boolean;
};

export const update = async (
	id: string,
	formState: TCategoryUpdate
): Promise<CategoryFormState> => {
	const { title, description, slug, image, is_active, category_order } =
		formState;

	const parseResult = categoryUpdate.safeParse(formState);
	if (!parseResult.success) {
		// Handle validation error
		console.error(parseResult.error);
		return {
			errors: { _form: parseResult.error.formErrors.formErrors },
			success: false,
		};
	}
	const categoryId = parseInt(id, 10);

	try {
		await db.categories.update({
			where: { id: categoryId },
			data: {
				title,
				description,
				slug,
				image,
				is_active: Boolean(is_active),
				category_order: parseInt(category_order, 10),
			},
		});
	} catch (error) {
		return {
			errors: { _form: ['a bad thing happened'] }, // Fix: Use the correct property name 'errors' instead of '_form'
			success: false,
		};
	}

	return {
		errors: {},
		success: true,
	};
};
