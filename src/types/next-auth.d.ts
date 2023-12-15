import 'next-auth';

declare module 'next-auth' {
	interface Session {
		user: {
			name: string | null;
			email: string | null;
			image: string | null;
			id: string; // Add the id property here
			uuid: string;
			users_accounts: any[] | unknown | null;
		};
	}
}
