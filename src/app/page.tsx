import { Suspense } from 'react';
import CategoriesPage from './categories/page';
import { authOptions } from './api/auth/[...nextauth]/options';

import Users from './users/page';
import { getServerSession } from 'next-auth';
import Loading from '@/app/loading';

export default async function Home() {
	const session = await getServerSession(authOptions);

	return (
		<Suspense fallback={<Loading />}>
			<CategoriesPage />
			{/* <Users /> */}
		</Suspense>
	);
}
