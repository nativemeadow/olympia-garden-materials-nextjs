'use client';

import React, { useState, useEffect, useRef } from 'react';
import { useForm } from 'react-hook-form';
import Image from 'next/image';
import { zodResolver } from '@hookform/resolvers/zod';
import { getById } from '@/app/actions/categories';
import { Category, categoryUpdate, TCategoryUpdate } from '@/lib/types';
import * as actions from '@/app/actions/categories';
import EditorComponent from '@/components/text-editor/editor';

import { useSearchParams } from 'next/navigation';

import classes from './edit.module.css';

const EditPage = () => {
	const {
		register,
		handleSubmit,
		formState: { errors, isSubmitting },
		setValue,
		setError,
	} = useForm<TCategoryUpdate>({
		resolver: zodResolver(categoryUpdate),
	});
	const [successMessage, setSuccessMessage] = useState('');
	const searchParams = useSearchParams();
	const id = searchParams.get('id');
	const [category, setCategory] = useState<Category>();
	//const form = useRef(null);
	const ref = React.createRef();
	const editorRef = useRef(null);

	useEffect(() => {
		async function getCategory(id: string) {
			const result = await getById(id);
			console.log('result:', result);
			setCategory(result);
			setValue('description', result.description || '');
		}

		if (id) {
			getCategory(id);
		}
	}, []);

	const onSubmit = async (data: TCategoryUpdate) => {
		console.log(data);
		let result;
		if (id) {
			result = await actions.update(id, data);
			console.log('update result: ', result);
			if (result.success) {
				setSuccessMessage('Category Updated');
				setTimeout(() => {
					setSuccessMessage('');
				}, 10000);
			}
		}
	};

	const handleEditorChange = (content: string, editor: any) => {
		console.log('descr content:', content);
		setValue('description', content); // Update the form value
	};

	const onEditorChange = (Event: any) => {
		console.log('onEditorChange:', Event);
	};

	if (!category) {
		return (
			<>
				<h1>Edit Page</h1>
				<h2>... loading</h2>
			</>
		);
	}

	if (!id) {
		return (
			<>
				<h1>Edit Page</h1>
				<h2>Error: category id not provided</h2>
			</>
		);
	}

	return (
		<>
			<div className={`${classes['content-wrapper']} mb-5`}>
				<h2 className='text-3xl mb-4'>{category.title}</h2>
				{successMessage && (
					<div className='text-xl text-center font-bold bg-green-100 rounded m-1.5 p-3'>
						<span>{successMessage}</span>
					</div>
				)}
				<div className={classes.profile}>
					<form onSubmit={handleSubmit(onSubmit)}>
						<div className={classes['wrapper']}>
							<div className={'flex flex-col w-full'}>
								<div>
									<label
										className={`${classes['form-field-label']} ${classes.label}`}
										htmlFor='title'
									>
										Title:
									</label>
									<input
										className={`${classes['form-field']}`}
										{...register('title')}
										defaultValue={category?.title || ''}
										placeholder='Title'
									/>
									{errors.title && (
										<p className={classes.error}>
											{errors.title?.message}
										</p>
									)}
								</div>
								<div>
									<label
										className={`${classes['form-field-label']} ${classes.label}`}
										htmlFor='slug'
									>
										Slug:
									</label>
									<input
										className={`${classes['form-field']}`}
										{...register('slug')}
										defaultValue={category?.slug || ''}
										placeholder='Slug'
									/>
									{errors.slug && (
										<p className={classes.error}>
											{errors.slug?.message}
										</p>
									)}
								</div>
								<div>
									<label
										className={`${classes['form-field-label']} ${classes.label}`}
										htmlFor='description'
									>
										Description:
									</label>
									<EditorComponent
										id='description'
										initialValue={
											category?.description || ''
										}
										handleEditorChange={handleEditorChange}
										register={register('description')}
										ref={ref}
									/>
									{errors.description && (
										<p className={classes.error}>
											{errors.description?.message}
										</p>
									)}
								</div>
								<div>
									<Image
										width={600}
										height={600}
										className={classes.image}
										alt={category.title}
										src={`/images/product-categories/${category.image}`}
									/>
								</div>
								<div>
									<label
										className={`${classes['form-field-label']} ${classes.label}`}
										htmlFor='image'
									>
										Image:
									</label>
									<input
										className={`${classes['form-field']}`}
										{...register('image')}
										placeholder='Image URL'
										defaultValue={category?.image || ''}
									/>
									{errors.image && (
										<p className={classes.error}>
											{errors.image?.message}
										</p>
									)}
								</div>
								<div>
									<label>
										Active&nbsp;
										<input
											type='checkbox'
											{...register('is_active')}
											checked={category?.is_active}
											defaultValue={
												category?.is_active
													? 'true'
													: ''
											}
										/>
									</label>
									{errors.is_active && (
										<p>{errors.is_active?.message}</p>
									)}
								</div>
								<div>
									<input
										className={`${classes.number_input} ${classes['form-field']} `}
										type='number'
										{...register('category_order')}
										placeholder='Category Order'
										defaultValue={
											category?.category_order.toString() ||
											'0'
										}
									/>
									{errors.category_order && (
										<p className={classes.error}>
											{errors.category_order?.message}
										</p>
									)}
								</div>
								<div className=''>
									<button
										type='submit'
										className={classes['button']}
									>
										Update Category
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</>
	);
};

export default EditPage;
