import z from 'zod';

export const loginSchema = z.object({
	email: z.string().email(),
	password: z.string().max(100),
	remember_me: z.boolean().default(false).optional(),
});

export type TLoginSchema = z.infer<typeof loginSchema>;

// export const changePasswordSchema = z.object({
// 	currentPassword: z.string(),
// 	newPassword: z.string(),
// 	confirmPassword: z.string(),
// });

// export type TChangePassword = z.infer<typeof changePasswordSchema>;

export const registerSchema = z.object({
	name: z.string().min(3, { message: 'please enter you name.' }).max(100),
	email: z.string().email({ message: 'email does not appear to be valid' }),
	password: z
		.string()
		.min(6, { message: 'password must be at least 6 characters' })
		.max(100),
	confirmPassword: z
		.string()
		.min(6, { message: 'confirmation password is required' })
		.max(100),
});

export type TRegisterSchema = z.infer<typeof registerSchema>;

export const forgotPasswordSchema = z.object({
	email: z.string().email(),
});

export type TForgotPasswordSchema = z.infer<typeof forgotPasswordSchema>;

export const resetPasswordSchema = z
	.object({
		oldPassword: z
			.string()
			.min(5, { message: 'current password required' }),
		password: z
			.string()
			.min(6, {
				message: 'new password required, must be at least 6 character',
			})
			.max(100),
		confirmPassword: z
			.string()
			.min(6, { message: 'confirm your new password' })
			.max(100),
	})
	.refine((data) => data.confirmPassword === data.password, {
		message: `Passwords don't match`,
		path: ['confirm'],
	});

export type TResetPasswordSchema = z.infer<typeof resetPasswordSchema>;

export const resetForgotPasswordSchema = z
	.object({
		newPassword: z
			.string()
			.min(6, {
				message: 'new password required, must be at least 6 character',
			})
			.max(100),

		confirmPassword: z
			.string()
			.min(6, { message: 'confirm your new password' })
			.max(100),
	})
	.refine((data) => data.newPassword === data.confirmPassword, {
		message: `Passwords don't match`,
		path: ['confirmPassword'],
	});

export type TResetForgotPasswordSchema = z.infer<
	typeof resetForgotPasswordSchema
>;

export const addressSchema = z.object({
	phone: z
		.string()
		.min(10, { message: 'please enter a 10 digit phone number' }),
	address: z.string().min(3, { message: 'please enter your address' }),
	city: z.string().min(3, { message: 'please enter your city' }),
	stateProvince: z.string().min(1, { message: 'please select your state' }),
	postalCode: z.string().min(3, { message: 'please enter your postal code' }),
});

export type TAddressSchema = z.infer<typeof addressSchema>;

export const userAddressSchema = z.object({
	phone: z.string().min(10, { message: 'phone number is required' }),
	address: z.string().min(5, { message: 'address is required' }),
	city: z.string().min(3, { message: 'city is required' }),
	stateProvince: z.string().min(2, { message: 'state/province is required' }),
	postalCode: z.string().min(5, { message: 'postal code is required' }),
});

export type TUserAddressSchema = z.infer<typeof userAddressSchema>;

export type userType =
	| {
			name?: string | null;
			email?: string | null;
			id?: string | null;
			uuid?: string | null;
	  }
	| undefined;

export type tokenType = {
	token: string;
};

export type loginType = {
	email: string;
	password: string;
};

export const advancedSearch = z
	.object({
		partNumber: z.string().min(1).optional(),
		nameOrDescription: z.string().min(1).optional(),
		category: z.string().optional(),
	})
	.refine(
		(data) => {
			if (data.partNumber) {
				// If partNumber is not empty, the object is valid
				return true;
			} else {
				// If partNumber is empty, nameOrDescription must not be empty
				return !!data.nameOrDescription;
			}
		},
		{
			path: [], // This error belongs to the entire object
			message: 'When part # is empty, please enter name / Description',
		}
	);

export type TAdvancedSearch = z.infer<typeof advancedSearch>;

export type loginResponseType = {
	errors?: {
		content?: string[];
		_form?: string[];
	};
	success?: boolean;
	token?: string;
	refreshToken?: string;
};

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

const FileSchema = z.object({
	name: z.string(),
	type: z.string(),
	size: z.number(),
});

const FormSchema = z.object({
	file: FileSchema.optional(),
});

export const categoryUpdate = z.object({
	title: z.string().min(2),
	slug: z.string().min(6),
	description: z
		.string()
		.min(6, { message: 'please enter an description for this category' }),
	image: z.string().min(6, { message: 'please enter image' }),
	is_active: z
		.string()
		.min(1, { message: 'please check category status, active or not' }),
	category_order: z
		.string()
		.min(1, { message: 'please select the order of the category' }),
});

export type TCategoryUpdate = z.infer<typeof categoryUpdate>;

export type CategoryProduct = {
	products: Product;
};

export const contactUsSchema = z.object({
	name: z.string().min(3, { message: 'please enter you name.' }),
	email: z
		.string()
		.email({ message: 'email does not appear to be valid' })
		.optional(),
	phone: z
		.string()
		.min(10, { message: 'please enter a 10 digit phone number' })
		.optional(),
	subject: z.string().min(3, { message: 'please enter a subject' }),
	message: z.string().min(3, { message: 'please enter a message' }),
});

export type TContactUsSchema = z.infer<typeof contactUsSchema>;

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
	// categoryUrlKey?: string;
	category_slug?: string;
	id: number;
	sku: string;
	slug: string;
	title: string;
	description: string;
	image: string;
	imageLensSize: string;
	extended: ProductExtensions | null;
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

export type CartItem = {
	product_id: number;
	product_slug: string;
	sku: string;
	title: string;
	image: string;
	price: number;
	quantity: number;
	unit: string;
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

export type searchResults = {
	id: string;
	uuid: string;
	sku: string;
	slug: string;
	title: string;
	description: string;
	image: string;
	image_lens_size: { width: string; height: string };
	extended: string | null;
	status: string;
	created_at: string | null;
	updated_at: string | null;
	relevance?: number | undefined;
	prices: [
		{
			title: string;
			description: string;
			image: string | null;
			price: string;
			size: string;
			units: string;
		}
	];
	category_product: [
		{
			categories: {
				id: string;
				title: string;
				description: string | null;
			};
		}
	];
};

export type TCatagories = {
	categoryTitle: string;
};

export type TPrice = {
	priceKey: number;
	priceSku: string;
	priceTitle: string;
	priceDescr: string;
	priceImage: string;
	price: number;
	size: string;
	units: string;
	coverage: string;
	coverage_value: number;
	online_minimum: number;
};

export type TProducts = Product & TCatagories & TPrice;

export type users = {
	id: bigint;
	uuid: string | null;
	customer_type: 'Registered' | 'Guest';
	username: string | null;
	name: string;
	password: string;
	email: string;
	email_verified_at: Date | null;
	reset_token: string;
	refresh_token: string | null;
	created_at: Date | null;
	updated_at: Date | null;
	users_accounts: {
		account: {
			id: number;
			uuid: string | null;
			name: string;
			type: string; // Replace this with the actual type of the account type
			role: string; // Replace this with the actual type of the account role
			created_at: Date;
			updated_at: Date;
		};
		id: number;
		users_uuid: string;
		account_uuid: string;
		created_at: Date;
	}[];
};

export type CategoryTreeType = {
	id: number;
	title: string;
	slug: string;
	path: string;
	product_count: string;
	children: CategoryTreeType[];
};
