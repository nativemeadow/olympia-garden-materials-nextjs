'use client';

import React from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { contactUsSchema, TContactUsSchema } from '@/lib/types';
import { contactUs } from '@/app/actions';

import classes from './contact-us.module.css';

const overrideStyle = `
body {
	background-image: url('/images/assets/Redwoods-One-4.jpeg');
	background-repeat: no-repeat;
	background-size: cover;
}
`;

const ContactUsPage = () => {
	const {
		register,
		handleSubmit,
		formState: { errors, isSubmitting },
		getValues,
	} = useForm<TContactUsSchema>({ resolver: zodResolver(contactUsSchema) });
	const [success, setSuccess] = React.useState(false);

	const onSubmit = async (data: TContactUsSchema) => {
		console.log('data: ', data);

		const result = (await contactUs(data)) as any;
		console.log('result: ', result);
		if (result.success) {
			setSuccess(true);
		} else {
			console.error('error: ', result.error);
		}
	};

	if (success) {
		return (
			<>
				<style jsx global>
					{overrideStyle}
				</style>
				<div className={classes['content-wrapper']}>
					<h2 className='text-3xl mb-4 text-white'>
						Thank you for contacting us
					</h2>
					<p className='text-white'>
						We will get back to you as soon as possible
					</p>
				</div>
			</>
		);
	}

	return (
		<>
			<style jsx global>
				{overrideStyle}
			</style>
			<div className={`${classes['content-wrapper']} `}>
				<h2 className='text-3xl mb-4'>Contact Us</h2>
				<form
					method='post'
					onSubmit={handleSubmit(onSubmit)}
					className={classes['form-control']}
				>
					<div className='grid grid-cols-2 gap-4'>
						<div className=''>
							<label
								className={`${classes['form-field-label']} ${classes.label}`}
								htmlFor='name'
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
								htmlFor='email'
							>
								Email:
							</label>
							<input
								className={`${classes['form-field']} ${classes.email}`}
								id='email'
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
								htmlFor='phone'
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
								htmlFor='subject'
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
						<div className='col-span-2'>
							<button
								type='submit'
								className={classes.contact_button}
								disabled={isSubmitting}
							>
								Send Message
							</button>
						</div>
					</div>
				</form>
			</div>
		</>
	);
};

export default ContactUsPage;
