'use client';

import React from 'react';
import { signIn } from 'next-auth/react';
import { FieldValues, useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';

import { registerSchema } from '@/lib/types';
import type { TRegisterSchema } from '@/lib/types';

import classes from './Register.module.css';

const RegisterPage = () => {
	const {
		register,
		handleSubmit,
		formState: { errors, isSubmitting },
		reset,
		getValues,
	} = useForm<TRegisterSchema>({ resolver: zodResolver(registerSchema) });

	const onSubmit = async (data: TRegisterSchema) => {
		console.log('data: ', data);
		//let user: any = null;
		signIn('credentials', {
			email: data.email,
			password: data.password,
			name: data.name,
			callbackUrl: '/',
		});
	};

	return (
		<div className={`${classes['content-wrapper']} mb-5`}>
			<h2 className='text-3xl mb-4'>Register</h2>
			<div className={classes.register}>
				<form method='post' onSubmit={handleSubmit(onSubmit)}>
					<div className={classes['register-wrapper']}>
						<div className={'flex flex-col w-full'}>
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
									htmlFor='password'
								>
									Password:
								</label>
								<input
									className={`${classes['form-field']} ${classes['password']}`}
									id='password'
									type='password'
									placeholder='Password'
									required
									{...register('password', {
										required: 'Password is required',
										minLength: {
											value: 6,
											message:
												'Password must be at least 6 characters long',
										},
									})}
								/>
								{errors.password && (
									<p
										className={classes.error}
									>{`${errors.password.message}`}</p>
								)}
							</div>
							<div className=''>
								<label
									className={`${classes['form-field-label']} ${classes.label}`}
									htmlFor='confirmPassword'
								>
									Confirm Password:
								</label>
								<input
									className={`${classes['form-field']} ${classes['password']}`}
									id='confirmPassword'
									type='password'
									placeholder='Confirm Password'
									required
									{...register('confirmPassword', {
										required:
											'Password confirmation is required',
										validate: (value) => {
											const { password } = getValues();
											return (
												password === value ||
												'Passwords must match'
											);
										},
									})}
								/>
								{errors.confirmPassword && (
									<p
										className={classes.error}
									>{`${errors.confirmPassword.message}`}</p>
								)}
							</div>

							<div className=''>
								<button
									type='submit'
									className={classes['register-button']}
									disabled={isSubmitting}
								>
									Register
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	);
};

export default RegisterPage;
