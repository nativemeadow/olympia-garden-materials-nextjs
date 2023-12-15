import React from 'react';
import classes from './TopBar.module.css';

const TopBar = () => {
	return (
		<div className={classes['top-bar']}>
			<ul className={classes['top-bar-items']}>
				<li className={classes['top-bar-item']}>login</li>
			</ul>
		</div>
	);
};

export default TopBar;
