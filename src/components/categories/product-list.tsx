'use strict';

import React from 'react';
import { usePathname } from 'next/navigation';
import { Product, CategoryProduct } from '@/lib/types';
import ProductCard from './product-card';
import classes from './product-list.module.css';

type Props = {
	categoryProduct: CategoryProduct[];
	categorySlug: string;
};

const ProductList = ({ categoryProduct, categorySlug }: Props) => {
	const paths = usePathname();
	const pathNames = paths?.split('/').filter((path) => path);

	return (
		<div className={classes.products_grid}>
			{categoryProduct?.map((item: CategoryProduct, index) => {
				return (
					<div key={index} className={classes.card_width}>
						<ProductCard
							product={item.products}
							categorySlug={categorySlug}
						/>
					</div>
				);
			})}
		</div>
	);
};

export default ProductList;
