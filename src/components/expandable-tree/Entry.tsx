'use client';

import { FC, useState, useEffect, use } from 'react';
import Link from 'next/link';
import { CategoryTreeType } from '@/lib/types';
import {
	FolderIcon,
	FolderOpenIcon,
	PlusIcon,
	MinusIcon,
} from '@heroicons/react/24/outline';
import useStore from '@/zustand/admin-category-nav';

import classes from './Entry.module.css';

const overrideStyle = `
*,
*::after,
*::before {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}


li, ol {
	list-style-type: none;
}

a {
	text-decoration: none;
}

button {
	text-align: left;
	border: none;
	padding: 0;
	margin: 0;
	transitions: 0;
	background: none;
	border: none;
	cursor: pointer;
}

.name {
	font-size: 1rem;
}
`;

type EntryProps = {
	entry: CategoryTreeType;
	depth: number;
	productCount: string;
};

export default function Entry({
	entry,
	depth,
	productCount,
}: EntryProps): ReturnType<FC> {
	const [isExpanded, setIsExpanded] = useState<boolean>(false);
	const [productsExpanded, setProductsExpanded] = useState<boolean>(false);
	const categoryProductsCount = String(productCount).replace('n', '');
	const setCategoryId = useStore((state) => state.setCategoryId);
	const categoryId = useStore((state) => state.categoryId);

	useEffect(() => {
		console.log('state of categoryId:', categoryId);
	}, [categoryId]);

	return (
		<>
			<style jsx global>
				{overrideStyle}
			</style>
			<div className={classes.tree}>
				<div className={classes.item_wrapper}>
					<button onClick={() => setIsExpanded((prev) => !prev)}>
						{entry.children && (
							<div
								style={{
									paddingRight: '6px',
									width: '20px',
									color: 'var(--anchor-color)',
								}}
							>
								{isExpanded ? (
									<MinusIcon className='h-4 w-4 forced-color-adjust-auto' />
								) : (
									<PlusIcon className='h-4 w-4 forced-color-adjust-auto' />
								)}
							</div>
						)}
					</button>
					<span
						className={classes.name}
						style={{ paddingLeft: entry.children ? '' : '20px' }}
					>
						<Link
							href={`/admin/dashboard/categories/edit?id=${entry.id}`}
						>
							{entry.title}
						</Link>
					</span>
					{Number(categoryProductsCount) > 0 && (
						<span className={classes.icon}>
							<button
								onClick={(e) => {
									setProductsExpanded((prev) => !prev);
									setCategoryId(String(entry.id));
								}}
							>
								{productsExpanded ? (
									<FolderOpenIcon className='h-6 w-6 forced-color-adjust-auto ml-4' />
								) : (
									<FolderIcon className='h-6 w-6 forced-color-adjust-auto ml-4' />
								)}
							</button>
						</span>
					)}
				</div>
				<div style={{ margin: '5px 5px' }}>
					{isExpanded && (
						<div style={{ paddingLeft: `5px` }}>
							{entry.children?.map((entry, idx) => (
								<Entry
									key={String(entry.id).replace('n', '')}
									entry={entry}
									depth={depth + 1}
									productCount={entry.product_count}
								/>
							))}
						</div>
					)}
				</div>
			</div>
		</>
	);
}
