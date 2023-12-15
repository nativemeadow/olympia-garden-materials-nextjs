'use client';
import React, { useState, useEffect } from 'react';
import { useSession } from 'next-auth/react';
import { user } from '@/app/actions/users';
import { LoginButton, LogoutButton } from '../auth';

declare global {
	interface BigInt {
		toJSON(): string;
	}
}

BigInt.prototype.toJSON = function () {
	return this.toString();
};

const UsersPage = () => {
	const { data: session } = useSession();
	const [userData, setUserData] = useState<any>(null);

	useEffect(() => {
		const getUser = async (email: string) => {
			const result = await user(email);
			console.log('result: ', result);
			setUserData(result);
		};

		getUser(session?.user?.email ?? 'joseph@nativemeadow.com');
		console.log('userData: ', userData);
	}, []);

	return (
		<div className='flex flex-col gap-6 w-10'>
			<p>{JSON.stringify(session)}</p>
			<div className='max-w-7xl'>
				{userData ? (
					<>
						<p>{userData.name}</p>
						<p>{userData.email}</p>
						{userData.users_accounts.map((account: any) => (
							<div key={account.id}>
								<p>{account.account.name}</p>
							</div>
						))}
					</>
				) : (
					<p>Loading...</p>
				)}
			</div>
			{/* <LoginButton />
			<LogoutButton /> */}
		</div>
	);
};

export default UsersPage;
