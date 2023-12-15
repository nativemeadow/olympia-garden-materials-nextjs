import React from 'react';
import Link from 'next/link';

import classes from './Button.module.css';

type Props = {
	href?: string;
	to?: string;
	inverse?: string;
	size?: string;
	danger?: string;
	type?: 'button' | 'reset' | 'submit';
	onClick?: () => void;
	overRideCssClass?: string;
	disabled?: false;
	children: string;
	override?: string;
};

const Button = (props: Props) => {
	let cssClass = props.overRideCssClass ? props.overRideCssClass : '';
	cssClass = `${cssClass} ${classes.button} button--${
		props.size || 'default'
	}`;

	if (props.href) {
		return (
			<a
				href={props.href}
				className={`${cssClass}
				${props.inverse && 'button--inverse'}
				${props.danger && 'button--danger'}`}
			>
				{props.children}
			</a>
		);
	}
	if (props.to) {
		return (
			<Link
				href={props.to}
				className={`button button--${props.size || 'default'} ${
					props.inverse && 'button--inverse'
				} ${props.danger && 'button--danger'}`}
			>
				{props.children}
			</Link>
		);
	}
	return (
		<button
			className={`${props.overRideCssClass || 'button'} button--${
				props.size || 'default'
			} ${props.inverse && 'button--inverse'} ${
				props.danger && 'button--danger'
			}`}
			type={props.type ? props.type : 'button'}
			onClick={props.onClick}
			disabled={props.disabled}
		>
			{props.children}
		</button>
	);
};

export default Button;
