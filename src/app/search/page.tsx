'use client';

import React, { useState, useEffect, useRef } from 'react';
import { useForm, SubmitHandler } from 'react-hook-form';
import { useRouter } from 'next/navigation';
import { zodResolver } from '@hookform/resolvers/zod';
import {
	advanceSearchSchema,
	TAdvanceSearchSchemaSchema,
} from './search-types';
import { getAll } from '../actions/categories';
import searchParams from '@/zustand/search';

import classes from './search.module.css';

type TCategoriesList = {
	id: number;
	slug: string;
	title: string;
};

const AdvancedSearchPage = () => {
	const router = useRouter();
	const searchTerms = searchParams();

	const {
		register,
		handleSubmit,
		formState: { errors, isSubmitting },
		setError,
	} = useForm<TAdvanceSearchSchemaSchema>({
		resolver: zodResolver(advanceSearchSchema),
	});
	const [categories, setCategories] = useState<TCategoriesList[]>([]);

	const form = useRef(null);

	console.log('defining onSubmit');
	const onSubmit: SubmitHandler<TAdvanceSearchSchemaSchema> = async (
		data: TAdvanceSearchSchemaSchema
	) => {
		console.log('advance search');
		let resultUrl = '/search/advanced/';
		searchTerms.clearParams();

		if (
			!data.partNumber &&
			!data.nameOrDescription &&
			data.category === 'All Categories'
		) {
			setError('category', {
				type: 'manual',
				message:
					'Either a Part # or a Name / Description or select Category',
			});
			return;
		} else {
			console.log('data: ', data);
		}

		if (data.partNumber) {
			resultUrl += `${data.partNumber}`;
			searchTerms.setPartNumber(data.partNumber);
		}

		if (data.nameOrDescription) {
			resultUrl += `/${data.nameOrDescription}`;
			searchTerms.setNameOrDescription(data.nameOrDescription);
		}

		if (data.category) {
			resultUrl += `/${data.category}`;
			searchTerms.setCategory(data.category as string);
		}

		router.push(resultUrl);
	};

	useEffect(() => {
		const fetchCategories = async () => {
			const allCategories = await getAll();
			const mappedCategories: TCategoriesList[] = allCategories.map(
				(category) => {
					return {
						id: Number(category.id), // Convert bigint to number
						slug: category.slug,
						title: category.title,
					};
				}
			);
			setCategories(mappedCategories);
		};
		fetchCategories();
	}, []);

	return (
		<div className={`${classes['content-wrapper']} mb-5`}>
			<h1>Advanced Search</h1>
			<div className={classes.register}>
				<form onSubmit={handleSubmit(onSubmit)} ref={form}>
					<div className={classes['form-wrapper']}>
						<div className={`${classes['form-grid']}`}>
							<label
								className={`${classes['form-field-label']} ${classes['label']}`}
								htmlFor='partiId'
							>
								Part #:
							</label>
							<div>
								<input
									className={`${classes['form-control']}`}
									id='partId'
									type='text'
									placeholder='Part #'
									{...register('partNumber')}
								/>
								{errors.partNumber && (
									<p
										className={classes.error}
									>{`${errors.partNumber.message}`}</p>
								)}
							</div>
						</div>

						<div className={`${classes['form-grid']}`}>
							<label
								className={`${classes['form-field-label']} ${classes['label']}`}
								htmlFor='nameOrDescription'
							>
								Name / Description
							</label>
							<div>
								<input
									className={`${classes['form-control']}`}
									id='nameOrDescription'
									type='text'
									placeholder='Name or Description'
									{...register('nameOrDescription')}
								/>
								{errors.nameOrDescription && (
									<p
										className={classes.error}
									>{`${errors.nameOrDescription.message}`}</p>
								)}
							</div>
						</div>

						<div className={`${classes['form-grid']}`}>
							<label
								className={`${classes['form-field-label']} ${classes['label']}`}
								htmlFor='categories'
							>
								Categories:
							</label>
							<div>
								<select
									className={`${classes['form-control']}`}
									id='categories'
									{...register('category')}
								>
									<option value=''>All Categories</option>
									{categories.map((category) => (
										<option
											key={category.id}
											value={category.slug}
										>
											{category.title}
										</option>
									))}
								</select>
								{errors.category && (
									<p
										className={classes.error}
									>{`${errors.category.message}`}</p>
								)}
							</div>
						</div>
						<div className={`${classes['form-grid']}`}>
							<div className=''></div>
							<div>
								<button
									type='submit'
									className={classes['search_button']}
									disabled={isSubmitting}
								>
									Search
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	);
};

export default AdvancedSearchPage;
