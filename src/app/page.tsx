import Image from 'next/image';
import CategoriesPage from './categories/page';
import { authOptions } from './api/auth/[...nextauth]/route';

import Users from './users/page';
import { getServerSession } from 'next-auth';

export default async function Home() {
	const session = await getServerSession(authOptions);

	//console.log('session: ', JSON.stringify(session));
	return (
		<>
			<CategoriesPage />
			<Users />
		</>
	);
}
