import { getProductBySlug } from '@/app/actions';
import ProductDetail from '@/components/products';

type Props = {
	params: {
		productSlug: string;
	};
};

const ProductPage = async ({ params }: Props) => {
	const slug = params.productSlug;
	const parsedProduct = await getProductBySlug(slug);

	return <ProductDetail product={parsedProduct} sku={parsedProduct.sku} />;
};

export default ProductPage;
