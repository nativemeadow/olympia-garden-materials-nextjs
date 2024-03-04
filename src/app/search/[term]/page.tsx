'use client';

import React, { useState, useEffect } from 'react';
import { TProducts } from '@/lib/types';
import ResultsPage from '@/app/search/results';
import { search as searchProducts, getSearchCount } from '@/app/actions/search';

type Props = {
	params: {
		term: string;
	};
};

const SearchPage = ({ params }: Props) => {
	const [error, setError] = useState<string | null>(null);
	const [results, setResults] = useState<TProducts[]>([]);
	const [count, setCount] = useState(0);

	// const search = async (term: string) => {
	// 	try {
	// 		const response = await fetch(`/api/search/${term}`, {
	// 			method: 'GET',
	// 		});
	// 		if (!response.ok) {
	// 			throw new Error(`HTTP error! status: ${response.status}`);
	// 		}

	// 		const searchResult: searchResults[] = await response.json(); // Parse the response as JSON
	// 		console.log('results:', searchResult);
	// 		setResults(searchResult);
	// 	} catch (error) {
	// 		setError('An error occurred while searching.');
	// 		console.error(error);
	// 	}
	// };

	const searchProd = async (term: string) => {
		if (term.trim().length === 0) {
			setError('Unable to complete the search.');
			return;
		}
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
		searchProd(params.term);
		setCount(getSearchCount());
	}, [params.term]);

	return (
		<div>
			{error ? (
				<div>Error: {error}</div>
			) : (
				<ResultsPage
					count={count}
					term={params.term}
					results={results}
				/>
			)}
		</div>
	);
};

export default SearchPage;
