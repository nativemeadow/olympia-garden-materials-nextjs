'use client';

import React, { useState, useEffect, useCallback, useRef } from 'react';
// import { useFormState } from 'react-dom';
import * as actions from '../../actions/userProfile';

import { FieldValues, useForm, SubmitHandler } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';

import { addressSchema } from '@/lib/types';
import type { TAddressSchema } from '@/lib/types';
import { states } from '@/utils/counties-locals/states';
import type { users, user_address } from '@prisma/client';
import { PhoneIcon } from '@heroicons/react/16/solid';

import { useSession } from 'next-auth/react';

import classes from './Profile.module.css';

type userType =
	| {
			name?: string | null;
			email?: string | null;
			id?: string | null;
			uuid?: string | null;
	  }
	| undefined;

const ProfilePage = () => {
	const {
		register,
		handleSubmit,
		formState: { errors, isSubmitting },
		getValues,
		setValue,
		setError,
	} = useForm<TAddressSchema>({ resolver: zodResolver(addressSchema) });
	const { data: session, status } = useSession();
	const user: userType = session?.user || {
		name: '',
		email: '',
		id: '',
		uuid: '',
	};
	const form = useRef(null);
	const [successMessage, setSuccessMessage] = useState('');

	const [userAddress, setUserAddress] = useState<user_address | null>(null);
	const stateLookup = { value: 'Select State / Province' };

	console.log('defining onSubmit');
	const onSubmit: SubmitHandler<TAddressSchema> = async (
		data: TAddressSchema
	) => {
		console.log('data: ', data);
		if (user?.id && typeof user.uuid === 'string') {
			const formState = {
				phone: data.phone,
				address: data.address,
				city: data.city,
				stateProvince: data.stateProvince,
				postalCode: data.postalCode,
			};
			try {
				const result = await actions.updateUserAddress(
					user.id,
					formState
				);

				console.log('update result: ', result);
				if (result.success) {
					setSuccessMessage('Your Address Updated');
					setTimeout(() => {
						setSuccessMessage('');
					}, 10000);
				} else {
					// handle error
					for (const [key, value] of Object.entries(result.errors)) {
						setError(
							key as
								| 'address'
								| 'phone'
								| 'city'
								| 'stateProvince'
								| 'postalCode'
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

	const getProfile = useCallback(async () => {
		console.log('getProfile ran');
		if (!user?.id) {
			return;
		}
		const response = await fetch(`/api/profile/${user?.id || ''}`, {
			method: 'GET',
		});
		const userAddress = await response.json();
		console.log('userAddress: ', userAddress);
		if (userAddress) {
			setUserAddress(userAddress);
		}
	}, [user?.id]);

	useEffect(() => {
		console.log('useEffect ran');
		console.log('status:', status);
		console.log('user?.id:', user?.id);

		if (status === 'authenticated' && user?.id) {
			console.log('calling getProfile');
			getProfile();
		}
	}, [status, user?.id, getProfile]);

	useEffect(() => {
		console.log('useEffect ran');
		console.log('userAddress: ', userAddress);
		if (userAddress) {
			setValue('phone', userAddress.phone || '');
			setValue('address', userAddress.address || '');
			setValue('city', userAddress.city || '');
			setValue('stateProvince', userAddress.state_province || '');
			setValue('postalCode', userAddress.postal_code || '');
		}
	}, [userAddress, setValue]);

	if (status === 'loading') {
		return <div>Loading...</div>;
	}

	return (
		<div className={`${classes['content-wrapper']} mb-5`}>
			<h2 className='text-3xl mb-4'>Your Profile</h2>
			<div className={classes.profile}>
				<form onSubmit={handleSubmit(onSubmit)} ref={form}>
					<div className={classes['profile-wrapper']}>
						<div className={'flex flex-col w-full'}>
							<div className=''>
								<input
									className='w-full rounded'
									type='text'
									disabled
									value={session?.user?.name || ''}
								/>
							</div>
							<div className=''>
								<input
									className='w-full rounded'
									type='text'
									disabled
									value={session?.user?.email || ''}
								/>
							</div>
							<h3 className='mb-2 font-bold'>Delivery Address</h3>
							<div className=''>
								<label
									className={`${classes['form-field-label']} ${classes.label}`}
									htmlFor='Phone'
								>
									Phone Number:
								</label>
								<div className='relative'>
									<PhoneIcon className='absolute left-2 top-1/2 transform -translate-y-1/2 h-6 w-6' />

									<input
										className={`${classes['form-field']} ${classes.name}`}
										id='phone'
										type='text'
										style={{ paddingLeft: '35px' }}
										required
										{...register('phone', {
											required: 'phone is required',
										})}
										defaultValue={userAddress?.phone || ''}
									/>
								</div>
								{errors.phone && (
									<p
										className={classes.error}
									>{`${errors.phone.message}`}</p>
								)}
							</div>
							<div className=''>
								<label
									className={`${classes['form-field-label']} ${classes.label}`}
									htmlFor='address'
								>
									Address:
								</label>
								<input
									className={`${classes['form-field']} ${classes.name}`}
									id='address'
									type='text'
									placeholder='Delivery Address'
									required
									{...register('address', {
										required: 'address is required',
									})}
									defaultValue={userAddress?.address || ''}
								/>
								{errors.address && (
									<p
										className={classes.error}
									>{`${errors.address.message}`}</p>
								)}
							</div>
							<div className=''>
								<label
									className={`${classes['form-field-label']} ${classes.label}`}
									htmlFor='city'
								>
									City:
								</label>
								<input
									className={`${classes['form-field']} ${classes.name}`}
									id='city'
									type='text'
									placeholder='Delivery city'
									required
									{...register('city', {
										required: 'city is required',
									})}
									defaultValue={userAddress?.city || ''}
								/>
								{errors.city && (
									<p
										className={classes.error}
									>{`${errors.city.message}`}</p>
								)}
							</div>
							<div className=''>
								<label
									className={classes['form-field-label']}
									htmlFor='state_province'
								>
									State
								</label>
								<select
									className={`${classes['form-field']} ${classes['state_province']}`}
									id='state_province'
									{...register('stateProvince', {
										required: 'state province is required',
									})}
									//value={stateLookup.value}
								>
									<option value={stateLookup.value}>
										{stateLookup.value}
									</option>
									{states.map((state) => (
										<option
											key={state.abbreviation}
											value={state.abbreviation}
											selected={
												state.abbreviation ===
												userAddress?.state_province
											}
										>
											{state.name}
										</option>
									))}
								</select>
								{errors.stateProvince && (
									<p
										className={classes.error}
									>{`${errors.stateProvince.message}`}</p>
								)}
							</div>
							<div className=''>
								<label
									className={`${classes['form-field-label']} ${classes.label}`}
									htmlFor='zip_code'
								>
									Postal Code:
								</label>
								<input
									className={`${classes['form-field']} ${classes.name}`}
									id='zip_code'
									type='text'
									placeholder='Postal Code'
									required
									{...register('postalCode', {
										required: 'postal code is required',
									})}
									defaultValue={
										userAddress?.postal_code || ''
									}
								/>
								{errors.postalCode && (
									<p
										className={classes.error}
									>{`${errors.postalCode.message}`}</p>
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
									className={classes['profile-button']}
									disabled={isSubmitting}
								>
									Update Address
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	);
};

export default ProfilePage;
