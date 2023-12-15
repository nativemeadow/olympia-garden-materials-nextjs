'use client';

import React, { useEffect, useState } from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { z } from 'zod';
import {
	resetForgotPasswordSchema,
	TResetForgotPasswordSchema,
} from '@/lib/types';
import { verifyResetToken } from '@/app/actions';
import { resetPassword } from '@/app/actions/';
import ResetPassword from '@/components/change-password/reset-success';

import classes from '../../login/LoginForm.module.css';

const ResetForgotPassword = () => {
	const {
		register,
		handleSubmit,
		formState: { errors },
		setError,
	} = useForm<TResetForgotPasswordSchema>({
		resolver: zodResolver(resetForgotPasswordSchema),
	});
	const [token, setToken] = useState('');
	const [tokenVerified, setTokenVerified] = useState(true);
	const [success, setSuccess] = useState(false);

	useEffect(() => {
		const pathSegments = window.location.pathname.split('/');
		const token = pathSegments.pop() as string;
		setToken(token);
		const verifyToken = async () => {
			try {
				const response = await verifyResetToken(token);
				if (response.success) {
					setTokenVerified(true);
				} else {
					setTokenVerified(false);
					setError('newPassword', { message: response.message });
				}
			} catch (error) {
				console.error('Error verifying token:', error);
				setTokenVerified(false);
			}
		};
		verifyToken();
	}, []);

	const onSubmit = async (data: TResetForgotPasswordSchema) => {
		console.log('Form data:', data, 'Token:', token);
		try {
			const response = await resetPassword(
				data.newPassword,
				data.confirmPassword,
				token
			);
			if (response.success) {
				console.log('Password reset');
				setSuccess(true);
			} else {
				console.log('Password reset failed');
				setError('newPassword', { message: response.message });
			}
		} catch (error) {
			console.error('Error resetting password:', error);
			setError('newPassword', { message: 'Error resetting password' });
		}
	};

	return (
		<div className={`${classes['content-wrapper']} mb-5`}>
			{!tokenVerified ? (
				<h2>Rest Password token is invalid</h2>
			) : success ? (
				<ResetPassword />
			) : (
				<>
					<h2 className='text-3xl mb-4'>Forgot My Password</h2>
					<div className={classes['login']}>
						<form onSubmit={handleSubmit(onSubmit)}>
							<input type='hidden' value='token' />
							<div className={classes['login-wrapper']}>
								<div className={'flex flex-col w-full'}>
									<div className=''>
										<label
											className={`${classes['form-field-label']} ${classes.label}`}
											htmlFor='password'
										>
											New Password
										</label>
										<input
											className={`${classes['form-field']} ${classes['password']}`}
											id='password'
											type='password'
											placeholder='New Password'
											{...register('newPassword')}
										/>
										{errors.newPassword && (
											<p className={classes.error}>
												{errors.newPassword.message}
											</p>
										)}
									</div>
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
										{...register('confirmPassword')}
									/>
									{errors.confirmPassword && (
										<p
											className={classes.error}
										>{`${errors.confirmPassword.message}`}</p>
									)}
								</div>
								<div className=''>
									<button
										className={classes['login__button']}
										type='submit'
										value='Reset Password'
									>
										Reset Password
									</button>
								</div>
							</div>
						</form>
					</div>
				</>
			)}
		</div>
	);
};

export default ResetForgotPassword;
