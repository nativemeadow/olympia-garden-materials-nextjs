'use client';

import React, { useState, useEffect } from 'react';
import Link from 'next/link';
import { getCategoriesHierarchy } from '@/app/actions/categories';

import classes from './categories.module.css';

type Category = {
	id: number;
	title: string;
	slug: string;
	path: string;
	children: Category[];
};

function CategoryTree({ categories }: { categories: Category[] }) {
	return (
		<ul className={classes.list}>
			{categories.map((category) => (
				<li key={category.id} className={classes.list_item}>
					<Link
						href={`/admin/dashboard/categories/edit?id=${category.id}`}
					>
						{category.title}
					</Link>
					{category.children && category.children.length > 0 && (
						<CategoryTree categories={category.children} />
					)}
				</li>
			))}
		</ul>
	);
}

const CategoriesPage = () => {
	const [categories, setCategories] = useState<Category[]>([]);

	useEffect(() => {
		let result;
		async function getCategories() {
			result = await getCategoriesHierarchy();
			setCategories(result as Category[]);
			console.log('category hierarchy', result);
		}

		getCategories();
	}, []);

	return (
		<div>
			<h1 className={classes.title}>Categories</h1>
			<CategoryTree categories={categories} />
		</div>
	);
};

export default CategoriesPage;
