import { getRootCategories } from '@/app/actions';
import { Category } from '@/lib/types';
import CategoryList from '@/components/categories/list';

const CategoriesPage = async () => {
	const categories: Category[] = await getRootCategories();

	return <CategoryList categories={categories} />;
};

export default CategoriesPage;
