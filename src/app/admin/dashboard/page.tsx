import React from 'react';
import Link from 'next/link';
import classes from './dashboard.module.css';

const DashboardPage = () => {
	return (
		<div>
			<h1 className={classes.main}>Dashboard</h1>

			<ul>
				<li className={classes.list_item}>
					<Link href={`/admin/dashboard/categories`}>Categories</Link>
				</li>
				<li className={classes.list_item}>
					<Link href={`/admin/dashboard/products`}>Products</Link>
				</li>
			</ul>
		</div>
	);
};

export default DashboardPage;
