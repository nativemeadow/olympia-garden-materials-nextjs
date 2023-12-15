'use client';

import { useState } from 'react';
import Image from 'next/image';
import useShoppingCart from '@/zustand/shopping-cart';
import Cart from '@/components/cart';
import classes from './cart.module.css';

const ShoppingCart = () => {
	const state = useShoppingCart.getState();
	const [checkoutOption, setCheckOutOption] = useState('not set');
	// sync the server side and client side rendering for the cart totals.
	// pass setCartTotal to the Cart component where the total is derived.
	// fixes: Text content does not match server-rendered HTML
	const [cartTotal, setCartTotal] = useState(0);

	const setCheckoutOption = (e: React.MouseEvent<HTMLDivElement>) => {
		const el = e.currentTarget;
		console.log(el.getAttribute('data-checkout-option'));
		const data = el.getAttribute('data-checkout-option');
		setCheckOutOption(data ? data : 'not set');
	};

	return (
		<>
			<h1 className={classes['cart-title']}>Shopping Cart</h1>
			<div className={classes['cart-grid']}>
				<div id={classes.leftCart}>
					<h2>Choose Checkout Options:</h2>
					<div className={classes['checkout-options']}>
						<div
							className={classes.options_box}
							data-checkout-option={'store-pickup'}
							onClick={setCheckoutOption}
						>
							<Image
								height={270}
								width={315}
								alt=''
								src='/images/in-store-pickup-icon.png'
							/>
							<div className={classes.options_details}>
								<span className={classes.options_title}>
									In-Store Pickup
								</span>
								<span className={classes.options_meta}>
									Pickup at our location
								</span>
							</div>
						</div>
						<div
							className={classes.options_box}
							data-checkout-option={'delivery'}
							onClick={setCheckoutOption}
						>
							<Image
								height={270}
								width={315}
								alt=''
								src='/images/delivery-icon.png'
							/>
							<div className={classes.options_details}>
								<span className={classes.options_title}>
									Delivery
								</span>
								<span className={classes.options_meta}>
									Have your order delivery to you home
								</span>
							</div>
						</div>
					</div>
					<div className={classes['order-summary']}>
						<Cart setCartTotal={setCartTotal} />
					</div>
				</div>
				<div id={classes.rightCart}>
					<div
						className={`${classes['order-summary']} ${classes.cart_totals}`}
					>
						<h5>Order Summary</h5>
						<div
							className={`${classes.set_instructions} ${classes.under_line}`}
						>
							<span>Checkout Option: </span>
							<span className={classes.checkout_option}>
								{checkoutOption}
							</span>
						</div>
						<div className={classes.set_total}>
							<span className={classes.summary_font}>Total </span>
							<span className={classes.summary_font}>
								{cartTotal ? `$${cartTotal}` : 0}
							</span>
						</div>
					</div>
				</div>
			</div>
		</>
	);
};

export default ShoppingCart;
