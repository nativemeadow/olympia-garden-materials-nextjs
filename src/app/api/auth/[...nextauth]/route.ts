import NextAuth from 'next-auth';
//import { NextApiRequest, NextApiResponse } from 'next';
import { authOptions } from './options';

// const handler = (req: NextApiRequest, res: NextApiResponse) => {
// 	return NextAuth(req, res, authOptions);
// };

const handler = NextAuth(authOptions);

export { handler as GET, handler as POST };
