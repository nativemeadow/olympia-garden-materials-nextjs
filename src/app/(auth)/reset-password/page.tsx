'use client';

import React, { useState, useRef } from 'react';
import { changeUserPassword } from '@/app/actions';

import { useSession } from 'next-auth/react';

import { useForm, SubmitHandler } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';

import { resetPasswordSchema } from '@/lib/types';
import type { TResetPasswordSchema } from '@/lib/types';
import type { userType } from '@/lib/types';
import { KeyIcon, EyeIcon, EyeSlashIcon } from '@heroicons/react/16/solid';

import classes from '../login/LoginForm.module.css';

const RestPasswordPage = () => {
	const {
		register,
		handleSubmit,
		formState: { errors, isSubmitting },
		getValues,
		setError,
		reset,
	} = useForm<TResetPasswordSchema>({
		resolver: zodResolver(resetPasswordSchema),
	});
	const { data: session, status } = useSession();
	const user: userType = session?.user || {
		name: '',
		email: '',
		id: '',
		uuid: '',
	};
	const [successMessage, setSuccessMessage] = useState('');
	const formRef = useRef(null);
	const [isVisiblePass, setIsVisiblePass] = useState(false);
	const toggleVisiblePass = () => setIsVisiblePass((prev) => !prev);
	const [isVisibleNewPass, setIsVisibleNewPass] = useState(false);
	const toggleVisibleNewPass = () => setIsVisibleNewPass((prev) => !prev);
	const [isVisibleConfirmPass, setIsVisibleConfirmPass] = useState(false);
	const toggleVisibleConfirmPass = () =>
		setIsVisibleConfirmPass((prev) => !prev);

	const onInvalid = (errors: any) => console.error(errors);

	console.log('defining onSubmit');
	const onSubmit: SubmitHandler<TResetPasswordSchema> = async (
		data: TResetPasswordSchema
	) => {
		console.log('data: ', data);
		const formState = {
			oldPassword: data.oldPassword,
			password: data.password,
			confirmPassword: data.confirmPassword,
		};

		if (user?.id && typeof user.uuid === 'string') {
			try {
				const result = await changeUserPassword(
					user.id,
					user.uuid,
					formState,
					new FormData()
				);
				if (result.success) {
					setSuccessMessage('Your password has been reset.');
					reset();
					setTimeout(() => {
						setSuccessMessage('');
					}, 10000);
				} else {
					// handle error
					for (const [key, value] of Object.entries(result.errors)) {
						setError(
							key as
								| 'oldPassword'
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
		}
	};

	return (
		<div className={`${classes['content-wrapper']} mb-5`}>
			<h2 className='text-3xl mb-4'>Reset Password</h2>
			<div className={classes.login}>
				<form
					onSubmit={handleSubmit(onSubmit, onInvalid)}
					ref={formRef}
				>
					<div className={classes['register-wrapper']}>
						<div className={'flex flex-col w-full'}>
							<div className=''>
								<label
									className={`${classes['form-field-label']} ${classes.label}`}
									htmlFor='oldPassword'
								>
									Current Password:
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
										id='oldPassword'
										type={
											isVisiblePass ? 'text' : 'password'
										}
										style={{ paddingLeft: '35px' }}
										required
										{...register('oldPassword', {
											required:
												'Current Password is required',
										})}
									/>
								</div>
								{errors.oldPassword && (
									<p
										className={classes.error}
									>{`${errors.oldPassword.message}`}</p>
								)}
							</div>
							<div className=''>
								<label
									className={`${classes['form-field-label']} ${classes.label}`}
									htmlFor='password'
								>
									New Password:
								</label>
								<div className='relative'>
									<KeyIcon className='absolute left-2 top-1/2 transform -translate-y-1/2 h-6 w-6' />
									{isVisibleNewPass ? (
										<EyeIcon
											className='absolute right-2 top-1/2 transform -translate-y-1/2 h-6 w-6 cursor-pointer'
											onClick={() =>
												toggleVisibleNewPass()
											}
										/>
									) : (
										<EyeSlashIcon
											className='absolute right-2 top-1/2 transform -translate-y-1/2 h-6 w-6 cursor-pointer'
											onClick={() =>
												toggleVisibleNewPass()
											}
										/>
									)}
									<input
										className={`${classes['form-field']} ${classes['password']}`}
										id='password'
										type={
											isVisibleNewPass
												? 'text'
												: 'password'
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
							<div className=''>
								<label
									className={`${classes['form-field-label']} ${classes.label}`}
									htmlFor='confirmPassword'
								>
									Confirm Password:
								</label>
								<div className='relative'>
									<KeyIcon className='absolute left-2 top-1/2 transform -translate-y-1/2 h-6 w-6' />
									{isVisibleConfirmPass ? (
										<EyeIcon
											className='absolute right-2 top-1/2 transform -translate-y-1/2 h-6 w-6 cursor-pointer'
											onClick={() =>
												toggleVisibleConfirmPass()
											}
										/>
									) : (
										<EyeSlashIcon
											className='absolute right-2 top-1/2 transform -translate-y-1/2 h-6 w-6 cursor-pointer'
											onClick={() =>
												toggleVisibleConfirmPass()
											}
										/>
									)}
									<input
										className={`${classes['form-field']} ${classes['password']}`}
										id='confirmPassword'
										type={
											isVisibleConfirmPass
												? 'text'
												: 'password'
										}
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
								</div>
								{errors.confirmPassword && (
									<p
										className={classes.error}
									>{`${errors.confirmPassword.message}`}</p>
								)}
							</div>
							{successMessage && (
								<div className='text-xl text-center font-bold bg-green-100 rounded m-1.5 p-3'>
									<span>{successMessage}</span>
								</div>
							)}
							<div className=''>
								<button
									type='submit'
									className={classes['login__button']}
									disabled={isSubmitting}
								>
									Rest Password
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	);
};

export default RestPasswordPage;
