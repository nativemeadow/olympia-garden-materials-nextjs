'use client';

import React from 'react';
import Link from 'next/link';
import Dropdown from '../ui-elements/Dropdown';
import Button from '../ui-elements/Button';
import { useSession } from 'next-auth/react';
import { signOut } from 'next-auth/react';
import classes from './TopBar.module.css';

type userType =
	| {
			name?: string | null;
			email?: string | null;
			id?: string | null;
	  }
	| undefined;

const TopBar = () => {
	const { data: session } = useSession();
	const user: userType = session?.user || { name: '', email: '', id: '' };

	const logoutHandler = () => {
		signOut({ callbackUrl: '/loggedout' });
	};

	return (
		<div className={classes['top-bar']}>
			<div className={classes['container']}>
				<ul className={classes['top-bar-items']}>
					<li className={classes['top-bar-item']}>
						{!session && (
							<Dropdown user={`Login`}>
								<Link href={`/login`}>Account Login</Link>
								<Link href={`/register`}>
									Create Your Account
								</Link>
							</Dropdown>
						)}
						{session && (
							<Dropdown user={`Hi ${session.user?.name}`}>
								<Link href={`/profile`}>Profile</Link>
								<Link href={`/reset-password`}>
									Change password
								</Link>
								<Button
									overRideCssClass={classes['button-default']}
									size='small'
									type='button'
									onClick={logoutHandler}
								>
									Logout
								</Button>
							</Dropdown>
						)}
					</li>
				</ul>
			</div>
		</div>
	);
};

export default TopBar;
