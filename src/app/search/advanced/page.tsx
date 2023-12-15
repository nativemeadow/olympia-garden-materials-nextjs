'use client';
import React, { useEffect } from 'react';
import { useRouter } from 'next/navigation';

const AdvanceSearchPage = () => {
	const router = useRouter();

	useEffect(() => {
		router.push(`/search`);
	}, []);

	return <div>Advanced Search page</div>;
};

export default AdvanceSearchPage;
