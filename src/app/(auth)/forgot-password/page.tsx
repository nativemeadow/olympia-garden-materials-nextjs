'use client';

import React, { useState, useRef } from 'react';

import { useForm, SubmitHandler } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { forgotPasswordSchema } from '@/lib/types';
import type { TForgotPasswordSchema } from '@/lib/types';
import * as actions from '@/app/actions';
import { useSession } from 'next-auth/react';
import MessageSent from '@/components/change-password/reset-sent';

import classes from '../login/LoginForm.module.css';

const ForgotPasswordPage = () => {
	const {
		register,
		handleSubmit,
		formState: { errors, isSubmitting },
	} = useForm<TForgotPasswordSchema>({
		resolver: zodResolver(forgotPasswordSchema),
	});
	const { data: session, status } = useSession();

	const form = useRef(null);
	const [successMessage, setSuccessMessage] = useState('');
	const [emailSent, setEmailSent] = useState(false);

	const onSubmit: SubmitHandler<TForgotPasswordSchema> = async (
		data: TForgotPasswordSchema
	) => {
		console.log('data: ', data);
		const result = await actions.forgotPassword(data.email);
		console.log('result: ', result);
		if (result) {
			setSuccessMessage('An email has been sent to you');
			setEmailSent(true);
		}
	};

	return (
		<div className={`${classes['content-wrapper']} mb-5`}>
			{emailSent ? (
				<MessageSent />
			) : (
				<>
					<h2 className='text-3xl mb-4'>Forgot My Password</h2>
					<div className={classes['login']}>
						<form method='post' onSubmit={handleSubmit(onSubmit)}>
							<div className={classes['login-wrapper']}>
								<div className={'flex flex-col w-full'}>
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
											<p className='text-red-500'>{`${errors.email.message}`}</p>
										)}
									</div>
									<div className=''>
										<button
											type='submit'
											className={classes['login__button']}
											disabled={isSubmitting}
										>
											Send Reset Password
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</>
			)}
		</div>
	);
};

export default ForgotPasswordPage;
