import React from 'react';
import Link from 'next/link';

const ResetMessagePage = () => {
	return (
		<>
			<h2>Your password has been reset</h2>
			<div className='text-xl mt-4'>
				Please <Link href={'/login'}>login</Link> with your new password
			</div>
		</>
	);
};

export default ResetMessagePage;
