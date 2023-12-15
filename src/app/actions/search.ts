'use server';

import db from '@/db';
import { Pricing, TProducts } from '@/lib/types';
import { connection } from '@/config/db';

const buildSearchResults = (result: TProducts[]) => {
	const productArray: TProducts[] = [];
	let productObject: TProducts;
	let pricingObject: Pricing;

	result.forEach((prod: TProducts, index, prodArray) => {
		if (index === 0 || prod.id !== prodArray[index - 1].id) {
			productObject = {
				...prod,
				prices: [],
			};

			productArray.push(productObject);
		}
		pricingObject = {
			key: prod.priceKey,
			sku: prod.priceSku,
			title: prod.priceTitle,
			description: prod.priceDescr,
			image: prod.priceImage,
			price: prod.price,
			size: prod.size,
			units: prod.units,
			coverage: prod.coverage,
			coverage_value: prod.coverage_value,
			online_minimum: prod.online_minimum,
		};
		productObject.prices.push(pricingObject);
	});

	return productArray;
};

const mergeResults = (arrayOne: any, arrayTwo: any) => {
	const mergedArray = [];

	for (const item of arrayOne) {
		let shared = false;
		for (const item2 of arrayTwo) {
			if (item.id === item2.id) {
				mergedArray.push(item);
				shared = true;
				break;
			}
		}
		if (!shared) {
			mergedArray.push(item);
		}
	}
	return mergedArray;
};

const hasSearchResult = (results: any) => {
	if (
		Array.isArray(results) &&
		results.every(
			(item) =>
				'id' in item &&
				'title' in item &&
				'slug' in item &&
				'description' in item &&
				'image' in item &&
				'price' in item &&
				'units' in item
		)
	) {
		return buildSearchResults(results as TProducts[]);
	} else {
		console.error('Unexpected result format from database query');
	}
};

let searchCount = 0;

export const setSearchCount = (count: number) => {
	searchCount = count;
};

export const getSearchCount = (): number => {
	return searchCount;
};

export const search = async (
	searchTerm: string,
	partNumber?: '',
	category?: '',
	sorted: string = ' order by `relevance`+0 DESC',
	relevance?: string
) => {
	if (searchTerm?.trim().length === 0) {
		return { message: `no results found` };
	}
	const sortOrder = sorted;
	const query = `SELECT categories.id as categoryId, categories.slug as category_slug ,categories.title as categoryTitle,
    products.id, products.slug, products.title, products.description, products.image, products.image_lens_size, products.extended, products.sku, prices.id as priceKey,
    prices.title as priceTile, prices.description as priceDescr, prices.price,
    prices.size, prices.units, prices.coverage, prices.coverage_value, prices.image as priceImage, prices.sku as priceSku, prices.online_minimum,
    MATCH(products.title, products.description) AGAINST (? IN BOOLEAN MODE) as relevance
        FROM products
        JOIN category_product ON category_product.product_id = products.id
        JOIN categories ON category_product.category_id = categories.id
        JOIN prices ON products.id = prices.product_id where `;
	const prodFocus = `MATCH(products.title, products.description) AGAINST (? IN BOOLEAN MODE)`;
	const priceFocus = `MATCH(prices.title, prices.description) AGAINST (? IN BOOLEAN MODE)`;
	const whereCategory = `category_slug = ${category} `;
	const wherePartName = `products.sku = ${partNumber} `;

	let focusedQuery = '';

	focusedQuery += `${query} ${prodFocus} ${sortOrder};`;

	let productArray: TProducts[] = [];
	let priceViewProductArray: TProducts[] = [];
	let mergedArray: TProducts[] = [];

	console.log('query1:', focusedQuery);

	try {
		const conn = await connection();

		const [results, fields] = await conn.execute(focusedQuery, [
			searchTerm,
			searchTerm,
		]);
		focusedQuery = `${query} ${priceFocus} ${sortOrder};`;
		const [results2, field2] = await conn.execute(focusedQuery, [
			searchTerm,
			searchTerm,
		]);

		let searchResults = hasSearchResult(results);
		productArray = searchResults !== undefined ? searchResults : [];

		searchResults = hasSearchResult(results2);
		priceViewProductArray =
			searchResults !== undefined ? searchResults : [];

		mergedArray = mergeResults(productArray, priceViewProductArray);

		setSearchCount(mergedArray.length);
		console.log('count:', getSearchCount());

		return mergedArray;
	} catch (error) {
		console.error(error);
	}
};

export const advancedSearch = async (
	searchTerm: string = '',
	sku: string = '',
	categorySlug: string = '',
	sorted: string = ' order by `relevance`+0 DESC'
) => {
	if (searchTerm?.trim().length === 0) {
		return { message: `no results found` };
	}

	try {
		const prisma = db;

		const results = await prisma.products.findMany({});
	} catch (error) {
		console.error(error);
	}
};
