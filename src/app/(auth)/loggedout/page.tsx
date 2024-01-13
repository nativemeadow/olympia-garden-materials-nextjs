import Link from 'next/link';

const LogoutPage = () => {
	return (
		<>
			<div>Your are logged out</div>
			<div>
				You can login <Link href='/login'>here</Link>
			</div>
		</>
	);
};

export default LogoutPage;
