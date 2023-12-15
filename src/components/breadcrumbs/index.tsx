'use client';

import React, { ReactNode } from 'react';
import { usePathname } from 'next/navigation';
import Link from 'next/link';

type TBreadCrumbProps = {
	homeElement: ReactNode;
	separator: ReactNode;
	containerClasses?: string;
	listClasses?: string;
	activeClasses?: string;
	capitalizeLinks?: boolean;
};

const NextBreadcrumb = ({
	homeElement,
	separator,
	containerClasses,
	listClasses,
	activeClasses,
	capitalizeLinks,
}: TBreadCrumbProps) => {
	const paths = usePathname();
	console.log('breadcrumb paths: ', paths);

	const pathNames = paths?.split('/').filter((path) => path);
	if (pathNames && pathNames[0] === 'category') {
		pathNames[0] = 'categories';
	}

	if (pathNames && pathNames[0] === 'forgot-password') {
		return (
			<ul className={containerClasses}>
				<li className={listClasses}>
					<Link href={'/'}>{homeElement}</Link>
				</li>
			</ul>
		);
	}

	return (
		<ul className={containerClasses}>
			<li className={listClasses}>
				<Link href={'/'}>{homeElement}</Link>
			</li>
			{pathNames?.length > 0 && separator}
			{pathNames?.map((link, index) => {
				const href = `/${pathNames.slice(0, index + 1).join('/')}`;
				const itemClasses =
					paths === href
						? `${listClasses} ${activeClasses}`
						: listClasses;
				let itemLink = capitalizeLinks
					? link[0].toUpperCase() + link.slice(1, link.length)
					: link;
				// replace all dashes with spaces
				itemLink = itemLink.replace(/-/g, ' ');
				itemLink = itemLink.replace(/%20/g, ' ');
				// capitalize first letter of each word
				const itemLinkArray = itemLink.split(' ');
				itemLink = itemLinkArray
					.map((word) => {
						return (
							word[0]?.toUpperCase() + word.slice(1, word.length)
						);
					})
					.join(' ');
				return (
					<React.Fragment key={index}>
						<li className={itemClasses}>
							{index === pathNames.length - 1 ? (
								itemLink
							) : (
								<Link href={href}>{itemLink}</Link>
							)}
						</li>
						{pathNames.length !== index + 1 && separator}
					</React.Fragment>
				);
			})}
		</ul>
	);
};

export default NextBreadcrumb;
