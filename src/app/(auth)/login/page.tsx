'use client';
import { useEffect, useState } from 'react';
import { signIn } from 'next-auth/react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import {
	EnvelopeIcon,
	KeyIcon,
	EyeIcon,
	EyeSlashIcon,
} from '@heroicons/react/16/solid';

import { loginSchema } from '@/lib/types';
import type { TLoginSchema } from '@/lib/types';

import classes from './LoginForm.module.css';

type Props = {
	searchParams?: Record<'callbackUrl' | 'error', string>;
};

const LoginFormPage = (props: Props) => {
	const {
		register,
		handleSubmit,
		formState: { errors, isSubmitting },
	} = useForm<TLoginSchema>({ resolver: zodResolver(loginSchema) });
	const [isVisiblePass, setIsVisiblePass] = useState(false);
	const toggleVisiblePass = () => setIsVisiblePass((prev) => !prev);

	const onSubmit = async (data: TLoginSchema) => {
		console.log('data: ', data);

		signIn('credentials', {
			email: data.email,
			password: data.password,
			remember_me: data.remember_me ? 'true' : 'false',
			callbackUrl: '/',
		});
	};

	return (
		<div className={`${classes['content-wrapper']} mb-5`}>
			<div className={classes['login']}>
				<form method='post' onSubmit={handleSubmit(onSubmit)}>
					<div className={classes['login-wrapper']}>
						<div className={'flex flex-col w-full'}>
							{props.searchParams?.error && (
								<div>
									<p className='bg-red-100 text-red-600 text-center p-2'>
										Login Failed
									</p>
								</div>
							)}
							<div className=''>
								<label
									className={`${classes['form-field-label']} ${classes['label']}`}
									htmlFor='Email'
								>
									Email:
								</label>
								<div className='relative'>
									<EnvelopeIcon className='absolute left-2 top-1/2 transform -translate-y-1/2 h-6 w-6' />
									<input
										className={`${classes['form-field']} ${classes['email']}`}
										id='Email'
										type='email'
										style={{ paddingLeft: '35px' }}
										{...register('email')}
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
									className={`${classes['form-field-label']} ${classes['label']}`}
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
										{...register('password')}
									/>
								</div>
								{errors.password && (
									<p
										className={classes.error}
									>{`${errors.password.message}`}</p>
								)}
							</div>
							<div className='inline-flex'>
								<label htmlFor='remember-me'>Remember Me</label>
								<input
									className={`${classes['checkbox']}`}
									type='checkbox'
									{...register('remember_me')}
									id='remember-me'
								/>
							</div>

							<div className=''>
								<button
									type='submit'
									className={classes['login__button']}
									disabled={isSubmitting}
								>
									Login
								</button>
								<div>
									<p className='mb-6'>
										Don&apos;t have an account:{' '}
										<Link href='/register'>
											Register Here
										</Link>
									</p>
								</div>
								<h4>Forgot your password</h4>
								[+]&nbsp;
								<a
									className={classes['create-account__link']}
									href='/forgot-password'
								>
									Click here to reset you password.
								</a>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	);
};

export default LoginFormPage;
