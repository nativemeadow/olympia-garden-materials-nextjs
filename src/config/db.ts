import mysql from 'mysql2/promise';

export const connection = async () => {
	try {
		return await mysql.createConnection({
			host: process.env.HOST,
			user: process.env.USER,
			password: process.env.PASSWORD,
			database: process.env.DATABASE,
			port: Number(process.env.DB_PORT),
		});
	} catch (error) {
		throw new Error(error as string);
	}
};
