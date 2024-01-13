'use client';

import React, { useState, useRef, FormEvent, useEffect } from 'react';
import {
	Product,
	Pricing,
	SelectListOptions,
	Items,
	selectListOptions,
} from '@/lib/types';

import classes from './calculator.module.css';

type Props = {
	nodeRef: React.MutableRefObject<HTMLDivElement | null>;
	units: string;
	selectList: SelectListOptions[];
};

type UnitsNeededType = {
	ton: { '1': string; '12': string; '13': string };
	yd: { '1': string; '12': string; '13': string };
	sk: { '1': string; '12': string; '13': string };
	[key: string]: { '1': string; '12': string; '13': string };
};

const unitsNeeded: UnitsNeededType = {
	ton: {
		'1': 'Tons Needed',
		'12': 'U-sacks Needed',
		'13': 'cost/ton',
	},
	yd: {
		'1': 'Yards Needed',
		'12': 'U-sacks Needed',
		'13': 'cost/yd',
	},
	sk: {
		'1': 'Sacks Needed',
		'12': 'U-sacks Needed',
		'13': 'cost/sack',
	},
};

const Calculator = (props: Props) => {
	const { units, selectList } = props;

	const lengthRef = useRef<HTMLInputElement>(null);
	const widthRef = useRef<HTMLInputElement>(null);
	const sqrFootRef = useRef<HTMLInputElement>(null);
	const depthRef = useRef<HTMLInputElement>(null);
	const resultsRef = useRef<HTMLInputElement>(null);
	const adjustedRef = useRef<HTMLInputElement>(null);
	const costRef = useRef<HTMLInputElement>(null);
	const subTotalRef = useRef<HTMLInputElement>(null);
	const depthMeasureRef = useRef<string>('12');
	const [depthMeasure, setDepthMeasure] = useState<string>('12');
	let calcUnits = 'ton';

	let qtyNeededLabel = 'Tons Needed';
	let costPerAreaLabel = 'cost/ton';

	if (selectList.length > 0 && adjustedRef.current) {
		adjustedRef.current!.value =
			selectList.length > 1
				? selectList[1]?.online_minimum.toString()
				: selectList[0]?.online_minimum.toString();
		selectList.length > 1 &&
			selectList.forEach((item, index) => {
				qtyNeededLabel = item?.units && unitsNeeded[item?.units]['1'];
				costPerAreaLabel =
					item?.units && unitsNeeded[item?.units]['13'];
				calcUnits = item?.units;
				console.log('qtyNeededLabel: ', qtyNeededLabel);
			});
	}

	console.log('props: ', props);

	const depthMessagedByChangeHandler = (
		event: React.ChangeEvent<HTMLInputElement>
	) => {
		const depthBy = event.target.value;
		console.log('depthBy: ', depthBy);
		setDepthMeasure(depthBy);
	};

	const handleCalculate = (
		event:
			| React.FormEvent<HTMLFormElement>
			| React.MouseEvent<HTMLButtonElement>
	) => {
		event!.preventDefault();
		console.log('handleCalculate');
		console.log('depthMeasure: ', depthMeasure, 'calcUnits: ', calcUnits);

		const length = lengthRef.current?.value;
		const width = widthRef.current?.value;
		const sqrFoot = sqrFootRef.current?.value;
		const depth = depthRef.current?.value;
		const selectedDepthMeasure = depthMeasureRef?.current;
		let qtyNeeded = resultsRef.current?.value as unknown as number;

		if (depthMeasure === '12') {
			if (calcUnits === 'yd') {
				qtyNeeded =
					(Number(length) *
						Number(width) *
						(Number(depth) / Number(selectedDepthMeasure))) /
					27;
				// if (!isNaN(qtyNeeded)) {
				// 	resultsRef.current!.value = qtyNeeded.toFixed(2);
				// 	adjustedRef.current!.value = Math.max(
				// 		1,
				// 		Math.ceil(qtyNeeded * 2) / 2
				// 	).toFixed(2);
				// }
			} else if (calcUnits === 'ton') {
				console.log('calcUnits: ', calcUnits);
				const qtyNeeded =
					(Number(length) *
						Number(width) *
						(Number(depth) / Number(selectedDepthMeasure))) /
					27;
				// if (!isNaN(qtyNeeded)) {
				// 	resultsRef.current!.value = qtyNeeded.toFixed(2);
				// 	adjustedRef.current!.value = Math.max(
				// 		1,
				// 		Math.ceil(qtyNeeded * 2) / 2
				// 	).toFixed(2);
				// }
			}
		}
		console.log(
			'width: ',
			width,
			'length: ',
			length,
			'depth: ',
			depth,
			'qtyNeeded: ',
			qtyNeeded
		);
		resultsRef.current!.value = qtyNeeded.toString();
		console.log('resultsRef.current!.value: ', resultsRef.current!.value);
	};

	const handleReset = (event: React.MouseEvent<HTMLButtonElement>) => {
		if (lengthRef.current) {
			lengthRef.current.value = '';
		}
		if (widthRef.current) {
			widthRef.current.value = '';
		}
		if (sqrFootRef.current) {
			sqrFootRef.current.value = '';
		}
		if (depthRef.current) {
			depthRef.current.value = '';
		}
		if (resultsRef.current) {
			resultsRef.current.value = '';
		}
		if (adjustedRef.current) {
			adjustedRef.current.value = '';
		}
		if (costRef.current) {
			costRef.current.value = '';
		}
		if (subTotalRef.current) {
			subTotalRef.current.value = '';
		}
	};

	return (
		<div ref={props.nodeRef} className={classes.container}>
			<form className={classes.form_control} onSubmit={handleCalculate}>
				<div className={classes.wrapper}>
					<div
						className={`${classes.text_center} ${classes.calc_group}`}
					>
						<input
							id='calc-length'
							type='text'
							name='length'
							size={5}
							maxLength={5}
							ref={lengthRef}
							className={`calc_input form_control ${classes.calc_input} ${classes.form_control}`}
						/>
						<span className={classes.calc_label}>Length (ft)</span>
					</div>
					<span className={classes.mod}>X</span>
					<div
						className={`${classes.text_center} ${classes.calc_group}`}
					>
						<input
							id='calc-width'
							type='text'
							name='width'
							size={5}
							maxLength={5}
							ref={widthRef}
							className={`calc_input form_control  ${classes.calc_input} ${classes.form_control}`}
						/>
						<span className={classes.calc_label}>width (ft)</span>
					</div>
					<span className={classes.mod}>or</span>
					<div
						className={`${classes.text_center} ${classes.calc_group}`}
					>
						<input
							id='calc-sqfoot'
							type='text'
							name='sqrft'
							size={5}
							maxLength={5}
							ref={sqrFootRef}
							className={`calc_input form_control  ${classes.calc_input} ${classes.form_control}`}
						/>
						<span className={classes.calc_label}>sqft (ft2)</span>
					</div>
					<span className={classes.mod}>X</span>
					<div
						className={`${classes.text_center} ${classes.calc_group}`}
					>
						<input
							id='calc-depth'
							type='text'
							name='depth'
							size={5}
							maxLength={5}
							ref={depthRef}
							className={`calc_input form_control  ${classes.calc_input} ${classes.form_control}`}
						/>
						<span className={classes.calc_label}>Depth</span>
					</div>
				</div>

				<div className={classes.calc_buttons}>
					<div className={classes.calc_button_group}>
						<button
							className={classes.calc_button_item}
							onClick={handleCalculate}
						>
							Calculate
						</button>
						<button
							className={classes.calc_button_item}
							onClick={handleReset}
						>
							Reset
						</button>
					</div>
					<div className={classes.calc_button_group}>
						<span className={classes.calc_button_text}>Depth</span>

						<span
							className={`${classes.calc_button_group} ${classes.calc_radios}`}
						>
							<div>
								<input
									id='calc-inch'
									name='depthMeasure'
									type='radio'
									value='12'
									defaultChecked={depthMeasure === '12'}
									onChange={depthMessagedByChangeHandler}
								/>
								<label htmlFor={'calc-inch'}>Inches</label>
							</div>
							<div>
								<input
									id='calc-feet'
									name='depthMeasure'
									type='radio'
									value='1'
									defaultChecked={depthMeasure === '1'}
									onChange={depthMessagedByChangeHandler}
								/>
								<label htmlFor={'calc-feet'}>Feet</label>
							</div>
						</span>
					</div>
				</div>
				<div className={`${classes.wrapper}`}>
					<div className={classes.calc_qty_needed}>
						<span>U-sacks Needed:</span>
						<span></span>
					</div>
					<div className={classes.calc_qty_needed}>
						<span>{qtyNeededLabel}:</span>
						<span></span>
					</div>
				</div>
				<div className={`${classes.results} ${classes.wrapper}`}>
					<div
						className={`${classes.text_center} ${classes.calc_group}`}
					>
						<input
							id='calc-results'
							type='number'
							name='length'
							size={5}
							maxLength={5}
							readOnly={true}
							ref={resultsRef}
							className={`calc_input form_control ${classes.calc_input} ${classes.form_control}`}
						/>
						<span className={classes.calc_label}>
							{qtyNeededLabel}
						</span>
					</div>
					<span className={classes.mod}>X</span>
					<div
						className={`${classes.text_center} ${classes.calc_group}`}
					>
						<input
							id='calc-adjusted'
							type='number'
							name='width'
							size={5}
							maxLength={5}
							readOnly={true}
							ref={adjustedRef}
							className={`calc_input form_control ${classes.calc_input} ${classes.form_control}`}
						/>
						<span className={classes.calc_label}>
							Online Minimum
						</span>
					</div>
					<span className={classes.mod}>or</span>
					<div
						className={`${classes.text_center} ${classes.calc_group}`}
					>
						<input
							id='calc-cost'
							type='text'
							name='sqrft'
							size={5}
							maxLength={5}
							readOnly={true}
							ref={costRef}
							className={`calc_input form_control ${classes.calc_input} ${classes.form_control}`}
						/>
						<span className={classes.calc_label}>
							{costPerAreaLabel}
						</span>
					</div>
					<span className={classes.mod}>=</span>
					<div
						className={`${classes.text_center} ${classes.calc_group}`}
					>
						<input
							id='calc-subtotal'
							type='text'
							name='subtotal'
							size={5}
							maxLength={5}
							readOnly={true}
							ref={subTotalRef}
							className={`calc_input form_control ${classes.calc_input} ${classes.form_control}`}
						/>
						<span className={classes.calc_label}>Subtotal</span>
					</div>
				</div>
			</form>
		</div>
	);
};

export default Calculator;
