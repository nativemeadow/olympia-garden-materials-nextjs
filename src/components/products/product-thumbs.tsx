'use client';

import React, { Dispatch, SetStateAction } from 'react';
import Image from 'next/image';
import { Pricing } from '@/lib/types';

import classes from './product.module.css';

type Props = {
	productThumbs: Pricing[] | undefined;
	selectedThumb: string | undefined;
	setSelectedThumb: Dispatch<SetStateAction<string | undefined>>;
	setProductImage: Dispatch<SetStateAction<string | undefined>>;
	setProductSku: Dispatch<SetStateAction<string>>;
	setProductOptions: Dispatch<SetStateAction<string>>;
	setSelectedPrice: Dispatch<SetStateAction<string>>;
	productUnit: (units: string) => string;
	updateSelectedUnit: (unit: string) => void;
	updateThumbsImage: (unit: string) => void;
	productThumbNailHandler: (selected: string) => void;
};

const ProductThumbs = (props: Props) => {
	const selectThumb = (
		event: React.MouseEvent<HTMLImageElement, MouseEvent>
	) => {
		const id = event.currentTarget.id.substring(6);
		if (props.productThumbs) {
			const selectedOption =
				props.productThumbs[+id].description +
				props.productThumbs[+id].units;
			props.updateSelectedUnit(props.productThumbs[+id].units);
			props.setSelectedThumb(props.productThumbs[+id].image);
			props.setProductImage(props.productThumbs[+id].image);
			props.setProductSku(props.productThumbs[+id].sku);
			props.setSelectedPrice(selectedOption);
			const title = props.productUnit(selectedOption);
			props.setProductOptions(title);
			props.updateThumbsImage(props.productThumbs[+id].image);
			props.productThumbNailHandler(selectedOption);
			console.log('thumbs image:', props.productThumbs[+id].image);
		}
	};

	return (
		<div className={classes['detail_variations_grid']}>
			{props.productThumbs?.map((price: Pricing, index: number) => {
				return (
					// <div key={index}>
					<Image
						key={index}
						width={100}
						height={70}
						id={`thumb-${index}`}
						className={`
                                ${classes['detail_variations_image']} ${
							props.selectedThumb === price.image &&
							classes['detail_variations_image_selected']
						}
                            `}
						src={`/images/products/${price.image}`}
						alt={`${price.title}`}
						onClick={selectThumb}
					/>
					// </div>
				);
			})}
		</div>
	);
};

export default ProductThumbs;
