import { redirect } from 'next/navigation';

const ProductsPage = () => {
	redirect('/categories');
	return <div>ProductsPage</div>;
};

export default ProductsPage;
