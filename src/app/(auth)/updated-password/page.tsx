import Link from 'next/link';

const PasswordReset = () => {
	return (
		<>
			<h1 className='mr-auto'>Your password has been reset.</h1>
			<h2 className='mt-5'>
				Please <Link href={`/login`}> Login</Link>
			</h2>
		</>
	);
};

export default PasswordReset;
