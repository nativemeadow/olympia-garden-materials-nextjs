'use client';

import React, { useState, useEffect } from 'react';

import searchParams from '@/zustand/search';
import { TProducts } from '@/lib/types';
import { search as searchProducts, getSearchCount } from '@/app/actions/search';
import ResultsPage from '@/app/search/results';

type TSearchParams = {
	partNumber: string;
	nameOrDescription: string;
	category: string;
};

type Props = {
	params: {
		terms?: string | null;
		partNumber?: string | null;
		category?: string | null;
	};
};

const AdvancedResultsPage = ({ params }: Props) => {
	console.log('advanced search:', params.terms);
	const [error, setError] = useState<string | null>(null);
	const [results, setResults] = useState<TProducts[]>([]);
	const [count, setCount] = useState(0);
	const searchTerms = searchParams();
	let searchInput = params.terms ? `${params.terms} ` : '';
	searchInput += params.partNumber ? `${params.partNumber} ` : '';
	searchInput += params.category ? `${params.category} ` : '';

	const searchProd = async (term: string) => {
		const searchResult = await searchProducts(term);
		if (
			Array.isArray(searchResult) &&
			searchResult.every((item) => item.slug)
		) {
			console.log('search results:', searchResult);
			setResults(searchResult);
		} else {
			console.error('Unexpected search result format');
			setError('Unable to complete the search.');
		}
	};

	useEffect(() => {
		searchProd(searchTerms.nameOrDescription || '');
		setCount(getSearchCount());
	}, [searchTerms]);

	return (
		<div>
			{error ? (
				<div>Error: {error}</div>
			) : (
				<ResultsPage
					count={count}
					term={searchInput}
					results={results}
				/>
			)}
		</div>
	);
};

export default AdvancedResultsPage;
