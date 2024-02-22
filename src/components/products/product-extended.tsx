import React, { useState, useEffect } from 'react';
import { Product, ProductExtensions } from '@/lib/types';
import useStore from '../../zustand/store';

import classes from './product.module.css';

type Props = {
	products: Product;
};

const ProductExtended = (props: Props) => {
	const [extended, setExtended] = useState<ProductExtensions[] | null>(
		[] || null
	);
	const [selected, setSelected] = useState('');
	const { extendedValue, extendedRules, setExtendedValue, setExtendedRules } =
		useStore();
	const extendedInfo = extended && extended[0];

	useEffect(() => {
		if (props.products.extended) {
			setExtended([props.products.extended]);
		} else {
			setExtended(null);
		}
	}, [props.products.extended]);

	const updateExtendedHandler = (
		event: React.ChangeEvent<HTMLSelectElement>
	) => {
		setSelected(event.target.value);
		setExtendedValue(event.target.value);
		extendedInfo && setExtendedRules(extendedInfo.rules);
	};

	const createExtendedInput = () => {
		if (!extendedInfo) {
			return <></>;
		}

		// console.log(`JSON :`, extendedInfo);
		// console.log('Labels:', extendedInfo.labels);

		return (
			<select
				name={`product_${extendedInfo.name}`}
				value={selected}
				onChange={updateExtendedHandler}
				className={`${classes['detail_pricing_select']}`}
			>
				{extendedInfo.labels.map((item, index) => {
					return (
						<option key={index} value={item}>
							{item}
						</option>
					);
				})}
			</select>
		);
	};

	return <div className='mb-2'>{createExtendedInput()}</div>;
};

export default ProductExtended;
