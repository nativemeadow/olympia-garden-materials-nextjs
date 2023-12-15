'use client';

import React, { useState, useEffect, useRef } from 'react';
import Link from 'next/link';
import { getCategoriesHierarchy } from '@/app/actions';
import Entry from '@/components/expandable-tree/Entry';
import { CategoryTreeType } from '@/lib/types';
import ProductsPage from '../products/page';
import useStore from '@/zustand/admin-category-nav';

import classes from './categories.module.css';

function CategoryTree({ categories }: { categories: CategoryTreeType[] }) {
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
	const [categories, setCategories] = useState<CategoryTreeType[]>([]);
	const navState = useStore.getState();

	useEffect(() => {
		let result;
		async function getCategories() {
			result = await getCategoriesHierarchy();
			setCategories(result as CategoryTreeType[]);
			console.log('category hierarchy', result);
		}

		getCategories();
	}, []);

	return (
		<div>
			<h1 className={classes.title}>Categories</h1>
			<div className='flex mt-4'>
				{/* <CategoryTree categories={categories} /> */}
				<div className='block'>
					{categories.map((category) => (
						<Entry
							key={String(category.id).replace('n', '')}
							entry={category}
							depth={1}
							productCount={category.product_count}
						/>
					))}
				</div>
				{/* <ProductsPage id={navState.categoryId!} /> */}
			</div>
		</div>
	);
};

export default CategoriesPage;
