'use client';

import { useSession } from 'next-auth/react';
import { LoginButton, LogoutButton } from '../auth';

const UsersPage = () => {
	const { data: session } = useSession();

	return (
		<div>
			<pre>{JSON.stringify(session)}</pre>
			{/* <LoginButton />
			<LogoutButton /> */}
		</div>
	);
};

export default UsersPage;
