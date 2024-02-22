import { NextApiRequest, NextApiResponse } from 'next';

export function GET(req: NextApiRequest, res: NextApiResponse) {
	console.log(typeof res); // Should log 'object'
	console.log(res); // Should log the res object

	const terms = req.url?.split('/').pop();
	const searchTerms = terms as string;

	return Response.json({ message: 'Hello, world!', term: { searchTerms } });
}
