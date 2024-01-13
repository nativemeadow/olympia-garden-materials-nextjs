const paths = {
	home() {
		return '/';
	},
	categoryShow(categorySlug: string) {
		return `/categories/${categorySlug}`;
	},
	postCreate(categorySlug: string) {
		return `/categories/${categorySlug}/posts/new`;
	},
	postShow(categorySlug: string, productSlug: string) {
		return `/categories/products/${productSlug}`;
	},
	logout() {
		return '/logout';
	},
};

export default paths;
