'use client';

import React, { useState } from 'react';
import { usePathname } from 'next/navigation';
import Link from 'next/link';
import Image from 'next/image';
import { Product } from '@/lib/types';
import { parser } from '@/utils/html-parse';
import { round } from '@/utils/math-utilities';

import classes from './product-card.module.css';
const categoryPath = 'categories';

const filterPricing = (
	product: Product,
	pathNames: string,
	categoryId: string | undefined
) => {
	const filterPrices = product?.prices.filter((value, index, array) => {
		return index === array.findIndex((t) => t.price === value.price);
	});

	return filterPrices?.map((price, key) => {
		return (
			<Link
				key={`link-${Math.random()}-${product.sku}`}
				href={`/${pathNames}/products/${product.slug}`}
			>
				<li key={key} id={`price-${price.key}`}>
					<span className={classes['product-card-pricing-usd']}>
						{Number(price.price).toFixed(2)}
					</span>
					&nbsp;/
					{parser(price.units)}
				</li>
			</Link>
		);
	});
};

type Props = {
	product: Product;
	categorySlug: string;
};

const ProductCard = (props: Props) => {
	const { product, categorySlug } = props;
	const [error, setError] = useState(false);

	return (
		<div className={classes.card}>
			<div className={classes.card_container}>
				<div className={classes.card_image}>
					<Link href={`/${categoryPath}/products/${product.slug}`}>
						<Image
							width={200}
							height={200}
							src={
								error
									? '/images/default_image.png'
									: `/images/products/${product.image}`
							}
							loading='lazy'
							placeholder='blur'
							blurDataURL='/images/loading.png'
							alt={
								product.title !== undefined ? product.title : ''
							}
							onError={() => setError(true)}
						/>
					</Link>
				</div>
				<div className={classes.card_content}>
					<h2 className={classes.card_title}>
						<Link
							href={`/${categoryPath}/products/${product.slug}`}
						>
							{parser(product.title.toUpperCase())}
						</Link>
					</h2>
					<div className={classes.card_price_info}>
						<ul className={classes.card_pricing}>
							{filterPricing(product, categoryPath, categorySlug)}
							{product.relevance !== undefined ? (
								<li className={classes.card_relevance}>
									Relevance: {round(product.relevance)}
								</li>
							) : (
								''
							)}
						</ul>
					</div>
				</div>
			</div>
		</div>
	);
};

export default ProductCard;
