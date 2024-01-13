'use client';

import React from 'react';
import { usePathname } from 'next/navigation';
import Link from 'next/link';
import Image from 'next/image';
import { Category } from '@/lib/types';
import classes from './list.module.css';

type Props = {
	categories: Category[];
};

const CategoryList = (props: Props) => {
	const { categories } = props;
	const paths = usePathname();
	const pathNames = paths?.split('/').filter((path) => path);
	//console.log('pathname: ', pathNames);
	const homePath = pathNames?.length === 1 ? pathNames[0] : 'categories';

	if (!categories) {
		return <div>Loading...</div>;
	}

	return (
		<div className={classes.gallery_grid}>
			{categories.map((category) => {
				return (
					<div
						className={classes[`gallery_${category.slug}`]}
						key={category.id}
					>
						<Link href={`/${homePath}/${category.slug}`}>
							<div className={classes.gallery_item}>
								<Image
									fill
									alt={category.title}
									src={`/images/product-categories/${category.image}`}
								/>
								<span className={`${classes.gallery_card}`}>
									{category.title}
								</span>
							</div>
						</Link>
					</div>
				);
			})}
		</div>
	);
};

export default CategoryList;
