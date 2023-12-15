'use client';

import React, { useState, useEffect } from 'react';
import { getProductsByCategory } from '@/app/actions';
import { Product } from '@/lib/types';
import useStore from '@/zustand/admin-category-nav';

import classes from './products.module.css';
import { set } from 'zod';

type Props = {
	id: string;
};

const ProductsPage = ({ id }: Props) => {
	//const products: Product[] = await getProductsByCategory(id);
	const [categoryId, setCategoryId] = useState<string | null>(null);
	const navState = useStore.getState();

	// useEffect(() => {
	// 	setCategoryId(navState.categoryId);
	// }, [navState]);

	// if (!id || id.length === 0) {
	// 	return null;
	// }

	return (
		<div>
			<h3 className={classes.title}>Products</h3>
			{/* <div>
				{id}
				{products.map((product) => (
					<div key={product.id}>{product.title}</div>
				))}
			 </div> */}
		</div>
	);
};

export default ProductsPage;
