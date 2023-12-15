'use client';

import React, { useEffect, useLayoutEffect, useState, useRef } from 'react';
import { useRouter } from 'next/navigation';

import Link from 'next/link';
import Hamburger from './ResponsiveMenu';
import { useWindowSize } from '@/shared/hooks/widowSize-hook';
import Backdrop from '../ui-elements/Backdrop';
import Image from 'next/image';
import useShoppingCart from '@/zustand/shopping-cart';
import NavLinks from './NavLinks';
import { CSSTransition } from 'react-transition-group';
import { IoSearchSharp } from 'react-icons/io5';

import classes from './HeaderNav.module.css';

const Header = () => {
	const shoppingCart = useShoppingCart((state) => state);
	const [cartCount, setCartCount] = useState(0);
	const [openResponsive, setOpenResponsive] = useState(false);
	const windowSize = useWindowSize();
	const searchRef = useRef<HTMLInputElement>(null);
	const router = useRouter();

	// call useEffect to sync the server side and client side rendering
	// see: https://react.dev/reference/react/useEffect#fetching-data-with-effects
	useEffect(() => {
		let ignore = false;
		function getCount() {
			if (!ignore) {
				setCartCount((current) => {
					return shoppingCart.cartCount();
				});
			}
		}
		getCount();

		return () => {
			ignore = true;
		};
	}, [shoppingCart]);

	useLayoutEffect(() => {
		windowSize.width! > 1024 && setOpenResponsive(false);
	}, [windowSize.width]);

	const closeResponsiveMenu = () => {
		setOpenResponsive(false);
	};

	const searchHandler = (event: React.FormEvent) => {
		event.preventDefault();

		const searchTerms = searchRef.current?.value;

		console.log('search button clicked, entered:', searchTerms);
		router.push(`/search/${searchTerms}`);
	};

	return (
		<>
			{openResponsive && <Backdrop onClick={closeResponsiveMenu} />}
			<header className={classes['main-header']}>
				<div className={classes['main-header-container']}>
					<div className={classes['site-logo']}>
						<Link href='/'>
							<span className={classes['site-logo-text']}>
								Olympia Garden Materials
							</span>
						</Link>
					</div>
					<nav className={classes['main-nav']}>
						<NavLinks />
						<div id='search-2' className={classes['nav-search']}>
							<form
								name='searchForm'
								onSubmit={searchHandler}
								aria-label='search from - search for products'
								className={classes['nav-search-form']}
							>
								<input
									type='hidden'
									name='mode'
									value='searchStore'
								/>
								<input
									className={classes['nav-search-input']}
									title='Product search...'
									ref={searchRef}
									type='search'
									name='search[searchFor]'
									placeholder='Product search ...'
									required={true}
								/>
								<button
									className={`${classes['nav-search-button']}`}
									type='submit'
									aria-label='Search'
									title='Search'
								>
									<IoSearchSharp />
								</button>
							</form>
						</div>
						<div
							id='shopping-cart'
							className={classes['shopping-cart']}
						>
							<Link
								href='/shopping-cart'
								className={classes['shopping-cart-link']}
							>
								<Image
									src='/images/icon-cart.png'
									alt='shop'
									height={24}
									width={24}
								/>
								<span
									className={classes['shopping-cart-count']}
								>
									{cartCount}
								</span>
							</Link>
						</div>
					</nav>
					<nav className={classes['main-responsive-nav']}>
						<div id='/shopping-cart'>
							<Link
								href='shopping-cart'
								className={classes['shopping-cart-link']}
							>
								<Image
									src='/images/icon-cart.png'
									alt='shop'
									height={24}
									width={24}
								/>
								<span
									className={classes['shopping-cart-count']}
								>
									{cartCount}
								</span>
							</Link>
						</div>
						<Hamburger
							openResponsive={openResponsive}
							setOpenResponsive={setOpenResponsive}
						/>
					</nav>
				</div>
			</header>
			<CSSTransition
				in={openResponsive}
				timeout={200}
				classNames='slide-in-top'
				mountOnEnter
				unmountOnExit
			>
				<div
					onClick={closeResponsiveMenu}
					className={`${
						classes['main-responsive-menu']
						// openResponsive
						// ? classes['main-responsive-menu']
						// : classes['main-responsive-menu-hide']
					}`}
				>
					<NavLinks />
				</div>
			</CSSTransition>
		</>
	);
};

export default Header;
