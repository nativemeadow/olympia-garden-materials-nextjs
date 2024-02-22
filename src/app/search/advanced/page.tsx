'use client';
import React from 'react';
import { useRouter } from 'next/navigation';

const AdvanceSearchPage = () => {
	const router = useRouter();
	router.push(`/search`);

	return <div>Advanced Search page</div>;
};

export default AdvanceSearchPage;
