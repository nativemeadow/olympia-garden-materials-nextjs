'use client';

import React, { useState, useEffect, Dispatch, SetStateAction } from 'react';
import { Product, Pricing, SelectListOptions } from '@/lib/types';
import parse from 'html-react-parser';
import useStore from '../../zustand/store';
import ProductExtended from './product-extended';
import NumberInputSpinner from '../form-elements/NumberInputSpinner';

import classes from './product.module.css';

type Props = {
	products: Product;
	productSize: string;
	productQty: number;
	setSelectedPrice: string;
	selectList: SelectListOptions[];
	productThumbs: Pricing[] | undefined;
	productOptions: string;
	setProductQty: Dispatch<SetStateAction<number>>;
	addToCartHandler: (event: React.FormEvent<HTMLFormElement>) => void;
	productSelectHandler: (event: React.ChangeEvent<HTMLSelectElement>) => void;
};

const ProductPriceLIst = (props: Props) => {
	const {
		products,
		productSize,
		productQty,
		setSelectedPrice,
		selectList,
		productThumbs,
		productOptions,
		setProductQty,
		addToCartHandler,
		productSelectHandler,
	} = props;
	const [selectDetails, setSelectDetails] = useState(<></>);
	const { extendedValue, extendedRules } = useStore();

	useEffect(() => {
		let selection = <></>;

		// selection = productSize.includes('sk') ? (
		// 	<div className={classes['quantity_selection_message']}>
		// 		<p>
		// 			Currently this product is not available for purchase online
		// 			in the selected quantity. Please select a different option
		// 			or visit our store to purchase this quantity.
		// 		</p>
		// 	</div>
		// ) :
		selection = (
			<div className={classes.detail_quantity_selection}>
				<NumberInputSpinner
					disabled={productSize.length <= 0}
					value={productQty}
					step={1}
					onChange={(newValue) => setProductQty(newValue)}
				/>

				<div className={classes['quantity_selection_units']}>
					{/* {!productThumbs
						? productSize
						: removeDuplicateCharacters(productSize)} */}
				</div>
				<div className={classes['quantity_selection_button']}>
					<button type='submit' disabled={productSize.length <= 0}>
						Add to Cart
					</button>
				</div>
			</div>
		);
		setSelectDetails(selection);
	}, [productSize, productQty, productThumbs, setProductQty]);

	return (
		<form name='addToCart' onSubmit={addToCartHandler}>
			<div className={classes['detail_selection']}>
				<h4>Please Select Product Options</h4>
				{/* {products?.prices.length! > 0 && (
					<p className={classes['detail_select_options']}>
						{parse(productOptions)}
					</p>
				)} */}
				{products.extended && <ProductExtended products={products} />}
				{products?.prices.length! > 1 && (
					<>
						<label
							className={classes.detail_select_label}
							htmlFor='product_select'
						>
							Select size
						</label>
						<select
							id='product_select'
							name='product_select'
							value={setSelectedPrice}
							onChange={productSelectHandler}
							className={` form-control ${classes['detail_pricing_select']} form-select `}
							disabled={
								!!products.extended &&
								extendedValue.length === 0
							}
						>
							<option value=''>Select size</option>
							{selectList.map((price, key) => {
								return (
									<option
										key={key}
										value={price.description + price.units}
									>
										{price.description}
									</option>
								);
							})}
						</select>
					</>
				)}
				{products?.prices.length! === 1 && (
					<input
						type='hidden'
						name='product_select'
						value={setSelectedPrice}
					/>
				)}
			</div>
			<div>
				{products?.prices.length! > 0 && (
					<p className={classes.detail_select_options}>
						{parse(productOptions)}
					</p>
				)}
			</div>
			{selectDetails}
		</form>
	);
};

export default ProductPriceLIst;
