'use client';
import React, { useState } from 'react';
import { usePathname } from 'next/navigation';
import Link from 'next/link';
import Image from 'next/image';
import { Category } from '@/lib/types';
import ProductList from './product-list';
import classes from './detail.module.css';

type CategoryProps = {
	category: Category[];
};

const CategoryDetail = ({ category }: CategoryProps) => {
	const [error, setError] = useState(false);
	const paths = usePathname();
	const pathNames = paths?.split('/').filter((path) => path);
	const categories = category.slice(1);
	const parentCategory = category[0];

	console.log('parentCategory: ', parentCategory);
	console.log('child categories: ', categories);

	if (!parentCategory) {
		return null;
	}

	const homePath = pathNames?.length > 0 ? pathNames[0] : 'categories';

	return (
		<>
			<div className={classes.grid}>
				{categories?.map((category) => (
					<div
						key={category.slug}
						className={`${classes.grid_cell} ${classes.image_container}`}
					>
						<Link href={`/${homePath}/${category.slug}`}>
							<Image
								width={200}
								height={200}
								src={
									error
										? '/images/default_image.png'
										: `/images/product-categories/${category.image}`
								}
								alt={category.title}
								onError={() => setError(true)}
							/>
						</Link>
						<h2 className={classes.detail_title}>
							<Link href={`/categories/${category.slug}`}>
								{category.title}
							</Link>
						</h2>
					</div>
				))}
			</div>
			{parentCategory?.category_product && (
				<ProductList
					categoryProduct={parentCategory.category_product}
					categorySlug={parentCategory.slug}
				/>
			)}
		</>
	);
};

export default CategoryDetail;
