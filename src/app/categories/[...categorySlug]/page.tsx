import { getCategoryBySlug } from '@/app/actions';
import parse from 'html-react-parser';
import CategoryDetail from '@/components/categories/detail';

import classes from './detail.module.css';

type Props = {
	params: {
		categorySlug: string[];
	};
};

const CategoryPage = async ({ params }: Props) => {
	const slug = params.categorySlug.join('/');

	const { parentCategory, parsedCategories } = await getCategoryBySlug(slug);

	return (
		<div className={classes.detail}>
			<h1 className={`${classes.detail_heading} ${classes.detail_title}`}>
				{parentCategory?.title}
			</h1>
			<div className={classes.detail_description}>
				{parentCategory &&
					parentCategory?.description?.length! > 0 &&
					parse(parentCategory && parentCategory?.description!)}
			</div>
			<CategoryDetail category={parsedCategories} />
		</div>
	);
};

export default CategoryPage;
