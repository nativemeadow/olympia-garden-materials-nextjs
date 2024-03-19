'use client';

import React from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { contactUsSchema, TContactUsSchema } from '@/lib/types';

import classes from './contact-us.module.css';

const ContactUsPage = () => {
	const {
		register,
		handleSubmit,
		formState: { errors, isSubmitting },
		getValues,
	} = useForm<TContactUsSchema>({ resolver: zodResolver(contactUsSchema) });

	const onSubmit = async (data: TContactUsSchema) => {
		console.log('data: ', data);
	};

	return (
		<div className={`${classes['content-wrapper']}}  mb-5`}>
			<h2 className='text-3xl mb-4'>Contact Us</h2>
			<form method='post' onSubmit={handleSubmit(onSubmit)}>
				<div className='grid grid-cols-2 gap-4'>
					<div className=''>
						<label
							className={`${classes['form-field-label']} ${classes.label}`}
							htmlFor='Name'
						>
							Name:
						</label>
						<input
							className={`${classes['form-field']} ${classes.name}`}
							id='name'
							type='text'
							placeholder='Your name'
							required
							{...register('name', {
								required: 'Name is required',
								minLength: {
									value: 8,
									message:
										'Name must be at least 8 characters long',
								},
							})}
						/>
						{errors.name && (
							<p
								className={classes.error}
							>{`${errors.name.message}`}</p>
						)}
					</div>
					<div className=''>
						<label
							className={`${classes['form-field-label']} ${classes.label}`}
							htmlFor='Email'
						>
							Email:
						</label>
						<input
							className={`${classes['form-field']} ${classes.email}`}
							id='Email'
							type='email'
							placeholder='Your email address'
							{...register('email', {
								required: 'Email is required',
							})}
						/>
						{errors.email && (
							<p
								className={classes.error}
							>{`${errors.email.message}`}</p>
						)}
					</div>
					<div className=''>
						<label
							className={`${classes['form-field-label']} ${classes.label}`}
							htmlFor='Phone'
						>
							Phone:
						</label>
						<input
							className={`${classes['form-field']} ${classes.name}`}
							id='phone'
							type='text'
							placeholder='Phone'
							{...register('name', {
								minLength: {
									value: 8,
									message:
										'Name must be at least 8 characters long',
								},
							})}
						/>
						{errors.phone && (
							<p
								className={classes.error}
							>{`${errors.phone.message}`}</p>
						)}
					</div>
					<div className=''>
						<label
							className={`${classes['form-field-label']} ${classes.label}`}
							htmlFor='Subject'
						>
							Subject:
						</label>
						<input
							className={`${classes['form-field']} ${classes.email}`}
							id='subject'
							type='text'
							placeholder='Subject'
							{...register('subject', {
								required: 'Subject is required',
							})}
						/>
						{errors.subject && (
							<p
								className={classes.error}
							>{`${errors.subject.message}`}</p>
						)}
					</div>
					<div className='col-span-2'>
						<label
							className={`${classes['form-field-label']} ${classes.label}`}
							htmlFor='message'
						>
							Message:
						</label>
						<textarea
							className={`${classes['form-field']} ${classes.email}`}
							cols={40}
							rows={10}
							id='message'
							placeholder='Message'
							{...register('message', {
								required: 'message is required',
							})}
						/>
						{errors.message && (
							<p
								className={classes.error}
							>{`${errors.message.message}`}</p>
						)}
					</div>
				</div>
			</form>
		</div>
	);
};

export default ContactUsPage;
