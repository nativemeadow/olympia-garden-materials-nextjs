import { TProducts } from '@/lib/types';
import Image from 'next/image';

import classes from './card.module.css';

type Props = {
	results: TProducts;
};

const ProductCard = ({ results }: Props) => {
	return (
		<div className={classes['card-container']}>
			<div className={classes.card}>
				<a href={`/categories/products/${results.slug}`}>
					<Image
						width={200}
						height={200}
						src={`/images/products/${results.image}`}
						alt={'test'}
						className={classes['product-image']}
					/>
				</a>
			</div>
			<p className={classes.title}>{results.title}</p>
			<p
				className={classes.price}
			>{`Starting from ${results.prices[0].price}`}</p>
		</div>
	);
};

export default ProductCard;
