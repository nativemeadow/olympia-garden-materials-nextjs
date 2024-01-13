import React from 'react';
import { db } from '@/db';
import { parseCustomJson } from '@/lib/custom-json';
import { Category } from '@/lib/types';
import CategoryList from '@/components/categories/list';

const CategoriesPage = async () => {
	//let categories: Omit<Category[], 'category_product' | 'parent_category'>;
	let categories: Category[];
	categories = (await db.categories.findMany({
		where: {
			parent_category: null,
		},
	})) as Category[];

	//console.log('categories: ', categories);

	return <CategoryList categories={categories} />;
};

export default CategoriesPage;
