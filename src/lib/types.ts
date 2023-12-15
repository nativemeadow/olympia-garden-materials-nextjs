export type Category = {
	id: bigint;
	uuid: string | null;
	title: string;
	slug: string;
	description: string;
	image: string;
	is_active: boolean;
	category_order: bigint;
	category_product: CategoryProduct[] | null;
	parent_category: bigint | null;
	created_at: Date | null;
	updated_at: Date | null;
};

export type CategoryProduct = {
	products: Product;
};

export type Pricing = {
	key: number;
	sku: string;
	title: string;
	description: string;
	image: string;
	price: number;
	size?: string;
	units: string;
	coverage: string;
	coverage_value: number;
	online_minimum: number;
};

export type Product = {
	categoryId?: string;
	categoryUrlKey?: string;
	category_slug?: string;
	id: number;
	sku: string;
	// url_key?: string;
	slug: string;
	title: string;
	description: string;
	image: string;
	imageLensSize: string;
	extended: string;
	relevance?: number;
	prices: Pricing[];
};

export type SelectListOptions = {
	sku: string;
	price: number;
	units: string;
	description: string;
	image: string;
	coverage: string;
	coverage_value: number;
	online_minimum: number;
};

// export type category_product = {
// 	products: Product[];
// };

export type Items = {
	category_id: string | undefined;
	category_slug?: string | undefined;
	product_id: number | undefined;
	product_url_key?: string | undefined;
	product_slug?: string | undefined;
	cart_id?: number | undefined;
	item_id?: number | undefined;
	sku: string | undefined;
	title: string | undefined;
	image: string | undefined;
	price: number;
	quantity: number;
	unit: string | undefined;
	color?: string | undefined;
};

export type JSON = {
	width: string;
	height: string;
};

type actionType = 'append' | 'prepend' | 'replace' | 'add' | 'remove';
type field = {
	field: string;
	action: actionType;
	hyphen?: boolean;
};

type output = {
	fields: Array<field>;
};

export type rule = {
	output: Array<output>;
};

export type ProductExtensions = {
	name: string;
	title: string;
	input: { type: string };
	labels: Array<string>;
	values: Array<string>;
	rules: Array<rule>;
};

export type selectListOptions = {
	sku: string;
	price: number;
	units: string;
	description: string;
	image: string;
	coverage: string;
	coverage_value: number;
	online_minimum: number;
};
