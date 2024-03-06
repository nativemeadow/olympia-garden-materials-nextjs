'use client';
import { useEffect } from 'react';
import { signIn } from 'next-auth/react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';

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

	const onSubmit = async (data: TLoginSchema) => {
		console.log('data: ', data);

		signIn('credentials', {
			email: data.email,
			password: data.password,
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
								<input
									className={`${classes['form-field']} ${classes['email']}`}
									id='Email'
									type='email'
									placeholder='Your email address'
									{...register('email')}
								/>
								{errors.email && (
									<p
										className={classes.error}
									>{`${errors.email.message}`}</p>
								)}
							</div>
							<div className=''>
								<label
									className={`${classes['form-field-label']} ${classes['abel']}`}
									htmlFor='password'
								>
									Password:
								</label>
								<input
									className={`${classes['form-field']} ${classes['password']}`}
									id='password'
									type='password'
									placeholder='Password'
									{...register('password')}
								/>
								{errors.password && (
									<p
										className={classes.error}
									>{`${errors.password.message}`}</p>
								)}
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
