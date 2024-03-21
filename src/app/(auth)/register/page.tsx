'use client';

import React, { useEffect, useState } from 'react';
import Link from 'next/link';
import { registerUser, RegisterFormState } from '@/app/actions';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { useRouter } from 'next/navigation';

import { registerSchema, TRegisterSchema } from '@/lib/types';
import { useSession } from 'next-auth/react';
import { userType } from '@/lib/types';
import {
	EnvelopeIcon,
	UserIcon,
	KeyIcon,
	EyeIcon,
	EyeSlashIcon,
} from '@heroicons/react/16/solid';

import classes from './Register.module.css';

const RegisterPage = () => {
	const {
		register,
		handleSubmit,
		formState: { errors, isSubmitting },
		getValues,
		setError,
	} = useForm<TRegisterSchema>({ resolver: zodResolver(registerSchema) });
	const router = useRouter();
	const { data: session } = useSession();
	const user: userType = session?.user || { name: '', email: '', id: '' };
	const [success, setSuccess] = useState(false);
	const [isVisiblePass, setIsVisiblePass] = useState(false);
	const toggleVisiblePass = () => setIsVisiblePass((prev) => !prev);

	useEffect(() => {
		if (session) {
			router.push('/profile');
		}
	}, [session, router]);

	const onSubmit = async (data: TRegisterSchema) => {
		console.log('data: ', data);

		try {
			const result = (await registerUser(data)) as RegisterFormState;
			if (result.success) {
				setSuccess(true);
			} else {
				// handle error
				for (const [key, value] of Object.entries(result.errors)) {
					setError(
						key as
							| 'name'
							| 'email'
							| 'password'
							| 'confirmPassword'
							| 'root'
							| `root.${string}`,
						{
							type: 'manual',
							message: value.join(', '),
						}
					);
				}
			}
		} catch (error) {
			console.log('error: ', error);
		}

		// signIn('credentials', {
		// 	email: data.email,
		// 	password: data.password,
		// 	name: data.name,
		// 	callbackUrl: '/',
		// });
	};

	if (success) {
		return (
			<div className={`${classes['content-wrapper']} mb-5`}>
				<h2 className='text-3xl mb-4'>Registration Successful</h2>
				<div className={classes.register}>
					<div className={classes['register-wrapper']}>
						<div className={'flex flex-col w-full'}>
							<div className=''>
								<h3 className='bg-green-100 text-green-600 text-center p-2'>
									Please&nbsp;
									<Link
										className='font-bold underline'
										href={'/login'}
									>
										login
									</Link>
									&nbsp; using your new account.
								</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		);
	}

	return (
		<div className={`${classes['content-wrapper']} mb-5`}>
			<h2 className='text-3xl mb-4'>Register</h2>
			<div className={classes.register}>
				<form method='post' onSubmit={handleSubmit(onSubmit)}>
					<div className={classes['register-wrapper']}>
						<div className={'flex flex-col w-full'}>
							{errors.root && (
								<div className=''>
									<div>
										<p className='bg-red-100 text-red-600 text-center p-2'>
											Registration Failed:{' '}
											{errors.root.message}
										</p>
									</div>
								</div>
							)}
							<div className=''>
								<label
									className={`${classes['form-field-label']} ${classes.label}`}
									htmlFor='Name'
								>
									Name:
								</label>
								<div className='relative'>
									<UserIcon className='absolute left-2 top-1/2 transform -translate-y-1/2 h-6 w-6' />
									<input
										className={`${classes['form-field']} ${classes.name}`}
										id='name'
										type='text'
										style={{ paddingLeft: '35px' }}
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
								</div>
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
								<div className='relative'>
									<EnvelopeIcon className='absolute left-2 top-1/2 transform -translate-y-1/2 h-6 w-6' />
									<input
										className={`${classes['form-field']} ${classes.email}`}
										id='Email'
										type='email'
										style={{ paddingLeft: '35px' }}
										{...register('email', {
											required: 'Email is required',
										})}
									/>
								</div>
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
								<div className='relative'>
									<KeyIcon className='absolute left-2 top-1/2 transform -translate-y-1/2 h-6 w-6' />
									{isVisiblePass ? (
										<EyeIcon
											className='absolute right-2 top-1/2 transform -translate-y-1/2 h-6 w-6 cursor-pointer'
											onClick={() => toggleVisiblePass()}
										/>
									) : (
										<EyeSlashIcon
											className='absolute right-2 top-1/2 transform -translate-y-1/2 h-6 w-6 cursor-pointer'
											onClick={() => toggleVisiblePass()}
										/>
									)}
									<input
										className={`${classes['form-field']} ${classes['password']}`}
										id='password'
										type={
											isVisiblePass ? 'text' : 'password'
										}
										style={{ paddingLeft: '35px' }}
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
								</div>
								{errors.password && (
									<p
										className={classes.error}
									>{`${errors.password.message}`}</p>
								)}
							</div>
							<div className='relative'>
								<KeyIcon className='absolute left-2 top-1/2 transform -translate-y-1/2 h-6 w-6' />

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
										style={{ paddingLeft: '35px' }}
										required
										{...register('confirmPassword', {
											required:
												'Password confirmation is required',
											validate: (value) => {
												const { password } =
													getValues();
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
