import React from 'react';
import { TProducts } from '@/lib/types';
import Card from '@/components/ui-elements/card';

import classes from './results.module.css';

type Props = {
	term: string;
	count: number;
	results: TProducts[];
};

const ResultsPage = ({ term, count, results }: Props) => {
	// remove hyphens
	term = term.replace(/-/g, ' ');
	// escaped spaces
	term = term.replace(/%20/g, ' ');
	// capitalize first letter of each word
	const itemLinkArray = term.split(' ');
	term = itemLinkArray
		.map((word) => {
			return word[0]?.toUpperCase() + word.slice(1, word.length);
		})
		.join(' ');

	return (
		<div>
			<h1>
				Search Page: {term} - {count} Results
			</h1>
			<div className={classes['product-galley']}>
				{results.map(
					(
						result: TProducts,
						index: number // Map over the results
					) => (
						<Card key={index} results={result} />
					)
				)}
			</div>
		</div>
	);
};

export default ResultsPage;
