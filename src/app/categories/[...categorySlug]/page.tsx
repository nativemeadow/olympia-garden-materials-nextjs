import React from 'react';
import { db } from '@/db';
import parse from 'html-react-parser';
import { parseCustomJson } from '@/lib/custom-json';
import CategoryDetail from '@/components/categories/detail';

import classes from './detail.module.css';

type Props = {
	params: {
		categorySlug: string[];
	};
};

const CategoryPage = async ({ params }: Props) => {
	console.log('CategoryPage: ', params);
	const slug = params.categorySlug.join('/');
	console.log('slug: ', slug);
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

	console.log('Category: ', finalMerge);

	const parsedCategories = parseCustomJson(finalMerge as any);

	const parentCategory = parsedCategories[0];

	return (
		<div className={classes.detail}>
			<h1 className={`${classes.detail_heading} ${classes.detail_title}`}>
				{parentCategory && parentCategory.title}
			</h1>
			<div className={classes.detail_description}>
				{parentCategory &&
					parentCategory?.description?.length! > 0 &&
					parse(parentCategory && parentCategory?.description!)}
			</div>
			<CategoryDetail category={parsedCategories} />
		</div>
	);
};

export default CategoryPage;
