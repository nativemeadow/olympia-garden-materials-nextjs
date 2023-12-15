'use client';

import React, { useEffect, useState, Dispatch, SetStateAction } from 'react';
import Image from 'next/image';
import Link from 'next/link';
import { ImCross } from 'react-icons/im';
import useShoppingCart from '@/zustand/shopping-cart';
import { Items } from '@/lib/types';
import NumberInputSpinner from '../form-elements/NumberInputSpinner';
import { get } from 'http';

import classes from './cart.module.css';

type Props = {
	setCartTotal: Dispatch<SetStateAction<number>>;
};

const ShoppingCart = (props: Props) => {
	const state = useShoppingCart.getState();
	const [error, setError] = useState(false);
	console.log('Shopping Cart State:', state);
	const [listItems, setListItems] = useState<Items[] | null>(null);
	const [productQty, setProductQty] = useState(0);
	const [lastDeleted, setLastDeleted] = useState<number>();
	const setCartTotal = props.setCartTotal;

	// call useEffect to sync the server side and client side rendering
	// see: https://react.dev/reference/react/useEffect#fetching-data-with-effects
	useEffect(() => {
		let ignore = false;
		function getCartItems() {
			if (!ignore) {
				setListItems((current) => {
					return state.Items;
				});
			}
		}
		getCartItems();

		setCartTotal(state.cartTotal());

		return () => {
			ignore = true;
		};
	}, [setCartTotal, state]);

	if (!listItems) {
		return <p>Loading Cart.....</p>;
	}

	const imageStyle = {
		height: 'auto',
	};

	const deleteCartItem = (productId: number) => {
		// Call the onDelete function passed in from the parent component
		state.removeItem(productId);
		// Update state to trigger re-render
		setLastDeleted(productId);
	};

	const updateQuantity = (item: Items, newValue: number) => {
		console.log('new value', newValue);
		setProductQty(newValue);
		if (item.product_id) {
			state.updateItem(item.product_id, newValue);
		}
	};

	return (
		<>
			{listItems.map((item: Items, index: number) => {
				return (
					<>
						<div className={classes['order-summary']}>
							<div
								className={classes.store_cart_thumbnail_wrapper}
							>
								<div className={classes.row}>
									<div
										className={`${classes.image_cell} ${classes.image_wrapper}`}
									>
										<Link
											className={
												classes.store_cart_thumbnail_link
											}
											href={`/categories/products/${item.product_slug}`}
										>
											<Image
												width={150}
												height={150}
												src={
													error
														? '/images/default_image.png'
														: `/images/products/${item.image}`
												}
												alt={
													item.title !== undefined
														? item.title
														: ''
												}
												onError={() => setError(true)}
												loading='lazy'
												placeholder='blur'
												blurDataURL='/images/loading.png'
												style={imageStyle}
											/>
										</Link>
									</div>
									<div
										className={`${classes.title_cell}
											${classes.store_cart_description}
										`}
									>
										<div className={classes.title_text}>
											{item.title}
										</div>
										<NumberInputSpinner
											disabled={false}
											value={item.quantity}
											step={1}
											onChange={(newValue) => {
												updateQuantity(item, newValue);
											}}
										/>
									</div>
									<div
										className={`${classes.cost_cell} ${classes.item_cost}`}
									>
										<div
											className={classes.item_cost_detail}
										>
											<div>${item.price}</div>
											<span>/</span>
											<div>{item.unit}</div>
										</div>
										<div className={classes.item_subtotal}>
											Subtotal: $
											{item.price * item.quantity}
										</div>
									</div>
									<div
										className={`${classes.delete_cell}`}
										data-product-id={item.product_id}
										onClick={() =>
											deleteCartItem(item.product_id ?? 0)
										}
									>
										<ImCross />
									</div>
								</div>
							</div>
						</div>
					</>
				);
			})}
		</>
	);
};

export default ShoppingCart;
