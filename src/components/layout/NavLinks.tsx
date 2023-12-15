import React, { useRef, useState } from 'react';
import Link from 'next/link';
import { usePathname } from 'next/navigation';

import { MainNavData, NavData } from './NavLinksData';

import classes from './HeaderNav.module.css';

const NavLinks = () => {
	const pathname = usePathname();
	return (
		<ul className={classes['main-nav-items']}>
			{MainNavData().map((data: NavData, index: number) => {
				return (
					<li key={index} className={classes['main-nav-item']}>
						<Link
							href={data.route}
							className={`${
								pathname === data.route ? classes['active'] : ''
							}`}
						>
							{data.title}
						</Link>
					</li>
				);
			})}
		</ul>
	);
};

export default NavLinks;
