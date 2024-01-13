import React from 'react';
import { db } from '@/db';
import { parseCustomJson } from '@/lib/custom-json';
import ProductDetail from '@/components/products';

type Props = {
	params: {
		productSlug: string;
	};
};

const ProductPage = async ({ params }: Props) => {
	const slug = params.productSlug;
	const prod = await db.products.findFirstOrThrow({
		where: {
			slug,
		},
		include: {
			prices: true,
		},
	});

	console.log('ProductPage: ', prod);

	const parsedProduct = parseCustomJson(prod as any);

	return <ProductDetail product={parsedProduct} sku={parsedProduct.sku} />;
};

export default ProductPage;
