import React from 'react';
import { PrismaClient } from '@prisma/client';
import parse from 'html-react-parser';
import { parseCustomJson } from '@/lib/custom-json';
import ProductDetail from '@/components/products';

type Props = {
	params: {
		productSlug: string;
	};
};

const db = new PrismaClient();

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
