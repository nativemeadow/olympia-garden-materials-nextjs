/* eslint-disable @next/next/no-img-element */
'use client';

import React, { useState, useRef, useEffect, useCallback } from 'react';
import { CSSTransition } from 'react-transition-group';
import Image from 'next/image';
import parse from 'html-react-parser';
import parser from 'html-react-parser';
import { SelectListOptions, Items, selectListOptions } from '@/lib/types';
import { Product, Pricing } from '@/lib/types';
import useStore from '../../zustand/store';
import useShoppingCart from '../../zustand/shopping-cart';
import Modal from '@/components/ui-elements/Modal';
import Button from '@/components/form-elements/Button';
import ProductPriceLIst from './product-price-list';
import ProductThumbs from './product-thumbs';
import Calculator from './calculator';
import { useRouter } from 'next/navigation';

import classes from './product.module.css';
import styles from './calculator.module.css';
import addStyle from './addModel.module.css';

const productLabelMessage = 'Please Select Product Options';

type Props = {
	product: Product;
	sku?: string;
};

const ProductDetail = ({ product, sku }: Props) => {
	console.log('product: ', product);
	const [selectList, setSelectList] = useState<SelectListOptions[]>([]);
	const [productSize, setProductSize] = useState('');
	const [productSku, setProductSku] = useState('');
	const [productOptions, setProductOptions] =
		useState<string>(productLabelMessage);
	const [selectedPrice, setSelectedPrice] = useState(String);
	const [productSizeMessage, setProductSizeMessage] =
		useState<string>(productLabelMessage);
	const [productQty, setProductQty] = useState<number>(1);
	const [productImage, setProductImage] = useState<string>();
	const [selectedThumb, setSelectedThumb] = useState<string>();
	const [productThumbs, setProductThumbs] = useState<Pricing[] | undefined>(
		[]
	);
	const [showCalculator, setShowCalculator] = useState(false);
	const [showAddToCart, setShowAddToCart] = useState(false);
	// ref for selected price
	const selectedPriceRef = useRef(0);
	const selectedUnitRef = useRef('');
	const productImageRef = useRef('');
	const coverageValueRef = useRef(0);
	const router = useRouter();

	const nodeRef = useRef<HTMLDivElement | null>(null);

	const {
		extendedValue,
		extendedRules,
		removeExtendedValue,
		removeExtendedRule,
	} = useStore();

	const { addItem, showCart } = useShoppingCart();

	const selectProductBySku = useCallback(
		(productOptions: selectListOptions[]) => {
			if (sku) {
				for (const item of productOptions) {
					if (item.sku === sku) {
						setSelectedThumb(item.image);
						setProductSku(item.sku);
						updateSelectedUnit(item.units);
						if (item.image && item.image.length > 0) {
							setProductImage(item.image);
						}
					}
				}
			}
		},
		[sku]
	);

	const coverageValue = product.prices[0]?.coverage_value;

	const displayCalculator = () => {
		if (coverageValue && coverageValue > 0) {
			return true;
		}
		return false;
	};

	useEffect(() => {
		console.log('showCalculator: ', showCalculator);
	}, [showCalculator]);

	useEffect(() => {
		const pricing: Pricing[] = product.prices;
		pricing.forEach((price) => {
			coverageValueRef.current = price.coverage_value;
		});
		let productOptions: selectListOptions[] = [];
		productOptions = product.prices.map((item) => {
			return {
				sku: item.sku,
				units: item.units,
				price: item.price,
				description: item.description,
				image: item.image,
				coverage: item.coverage,
				coverage_value: item.coverage_value,
				online_minimum: item.online_minimum,
			};
		});

		setProductImage(product.image);
		selectProductBySku(productOptions);

		// only one unit price
		if (product && product.prices.length === 1) {
			setProductSize(product.prices[0].units);
		}

		productImageRef.current = product?.image;

		// get thumbnail images if any
		const thumbs = product.prices.filter((price) => {
			return price.image && price.image.length > 0;
		});
		setProductThumbs(thumbs);

		if (product.prices.length === 1) {
			setProductSizeMessage(
				product?.prices[0].title +
					`<span className=${classes['detail_pricing_usd_selected']}>$` +
					Number(product?.prices[0].price).toFixed(2) +
					'<span>'
			);
		}

		setSelectList(productOptions);
	}, [product, selectProductBySku]);

	const productUnit = (units: string) => {
		let priceTitle = productLabelMessage;
		setProductSize(units);

		product?.prices.forEach((price) => {
			if (price.description + price.units === units) {
				selectedPriceRef.current = price.price;
				return (priceTitle =
					price.title +
					`<span className=${classes['detail_pricing_usd_selected']}>$` +
					Number(price.price).toFixed(2) +
					'</span>');
			}
		});
		return priceTitle;
	};

	const productSelectHandler = (
		event: React.ChangeEvent<HTMLSelectElement>
	) => {
		const selected = event.target.value;
		setSelectedPrice(selected);
		const title = productUnit(selected);
		// set the message describing the product size and price
		setProductSizeMessage(title);
		// if there is thumb highlighted in the drop down select list.
		if (productThumbs) {
			selectList.forEach((item) => {
				if (item.description + item.units !== selected) {
					return;
				}
				setSelectedThumb(item.image);
				setProductSku(item.sku);
				updateSelectedUnit(item.units);
				if (item.image && item.image.length > 0) {
					setProductImage(item.image);
				}
			});
		}
	};

	const productThumbNailHandler = (selectedProduct: string) => {
		if (productThumbs) {
			const title = productUnit(selectedProduct);
			setProductSizeMessage(title);
		}
	};

	const filterPricing = () => {
		const filterPrices =
			product &&
			product.prices.filter((value, index, array) => {
				return (
					index === array.findIndex((t) => t.price === value.price)
				);
			});

		return filterPrices?.map((price, key) => {
			return (
				<li
					key={key}
					id={`price-${price.key}`}
					className={classes.options_item}
				>
					<span>${Number(price.price).toFixed(2)}</span>
					&nbsp;/&nbsp;
					{parser(price.units)}
				</li>
			);
		});
	};

	/**
	 * Used here and in product-thumbs component to set the value of
	 * the selectedUnit ref variable.
	 * @param unit
	 */
	const updateSelectedUnit = (unit: string) => {
		selectedUnitRef.current = unit;
	};

	const addToCartHandler = (event: React.FormEvent<HTMLFormElement>) => {
		event.preventDefault();
		console.log('add to cart');
		const productJson: Items = {
			category_id: product?.categoryId,
			product_id: product?.id,
			category_slug: product?.category_slug,
			product_slug: product?.slug,
			// if the product does not have multiple pricing, then the sku comes for the parent product not from pricing
			sku: productSku ? productSku : product?.sku,
			title: product?.title,
			image: productImageRef.current,
			// if the product does not have multiple pricing, then the price comes for the first pricing element
			price: selectedPriceRef.current
				? selectedPriceRef.current
				: product?.prices[0].price!,
			quantity: productQty,
			// if the product does not have multiple pricing, then the units comes for the first pricing element
			unit: selectedUnitRef.current
				? selectedUnitRef.current
				: product?.prices[0].units,
			color: extendedValue,
		};
		console.log('productJson', productJson);
		addItem(productJson);
		console.log(showCart());
		openAddToCartHandler();
	};

	const updateThumbsImage = (image: string) => {
		if (image && image.length > 0) {
			productImageRef.current = image;
			setProductImage(image);
		}
	};

	const closeAddToCartHandler = () => {
		setShowAddToCart(false);
	};

	const openAddToCartHandler = () => {
		setShowAddToCart(true);
	};

	const viewShoppingCartHandler = () => {
		setShowAddToCart(false);
		router.push('/shopping-cart');
	};

	return (
		<>
			<Modal
				show={showAddToCart}
				onCancel={closeAddToCartHandler}
				header={'Add to Cart'}
				headerClass={addStyle['item-modal-header']}
				contentClass={addStyle['addToCart-item-modal-content']}
				footerClass={addStyle['addToCart-item-modal-actions']}
				footer={
					<>
						<Button
							overRideCssClass={addStyle['addToCartButton']}
							onClick={viewShoppingCartHandler}
						>
							View Cart
						</Button>
						<Button
							overRideCssClass={addStyle['addToCartButton']}
							onClick={closeAddToCartHandler}
						>
							Continue Shopping
						</Button>
					</>
				}
			>
				<div className={classes['addToCart-dialog']}>
					<p>1 Item(s) Consolidated into cart.</p>
				</div>
			</Modal>
			<div className={classes.detail_container}>
				<div className={classes.detail_image_wrapper}>
					<Image
						width={500}
						height={500}
						className={classes.detail_image}
						src={`/images/products/${productImage}`}
						placeholder='blur'
						blurDataURL='/images/loading.png'
						alt={product.title}
					/>

					<ProductThumbs
						productThumbs={productThumbs}
						selectedThumb={selectedThumb}
						setSelectedThumb={setSelectedThumb}
						setProductImage={setProductImage}
						setProductSku={setProductSku}
						setSelectedPrice={setSelectedPrice}
						productUnit={productUnit}
						setProductOptions={setProductOptions}
						updateSelectedUnit={updateSelectedUnit}
						updateThumbsImage={updateThumbsImage}
						productThumbNailHandler={productThumbNailHandler}
					/>
				</div>
				<div className={classes.detail}>
					<h1>{product.title}</h1>
					<ul className={classes.detail_pricing}>
						{filterPricing()}
					</ul>
					<ProductPriceLIst
						products={product}
						productSize={productSize}
						productQty={productQty}
						setSelectedPrice={selectedPrice}
						selectList={selectList}
						productThumbs={productThumbs}
						productOptions={productSizeMessage}
						setProductQty={setProductQty}
						addToCartHandler={addToCartHandler}
						productSelectHandler={productSelectHandler}
					/>
					{displayCalculator() && (
						<div>
							<h5>
								<button
									className={classes.detail_calculator_button}
									onClick={() =>
										setShowCalculator(
											(currentValue) => !currentValue
										)
									}
								>
									<span className={classes.button_text}>
										View Calculator
									</span>
									{!showCalculator && (
										<span className={classes.button_icon}>
											+
										</span>
									)}
									{showCalculator && (
										<span className={classes.button_icon}>
											-
										</span>
									)}
								</button>
							</h5>
							<CSSTransition
								in={showCalculator} // Replace with your actual condition
								nodeRef={nodeRef}
								timeout={1000}
								classNames={{
									enter: styles.calculatorEnter,
									enterActive: styles.calculatorEnterActive,
									exit: styles.calculatorExit,
									exitActive: styles.calculatorExitActive,
									exitDone: styles.calculatorExitDone,
								}}
								unmountOnExit
							>
								<Calculator
									nodeRef={nodeRef}
									units={productSize}
									selectList={selectList}
								/>
							</CSSTransition>
						</div>
					)}
				</div>
			</div>
			<div
				className={`${classes.detail_description} ${classes.detail_description_row}`}
			>
				<div className={classes.title}>
					<h2 className={classes.info_title}>Product Information</h2>
				</div>
				<div className={classes.descr}>
					{parse(product.description)}
				</div>
			</div>
		</>
	);
};

export default ProductDetail;
