import { NextRequest, NextResponse } from 'next/server';

export function GET(req: NextRequest, res: NextResponse) {
	console.log(typeof res); // Should log 'object'
	console.log(res); // Should log the res object

	const terms = req.url?.split('/').pop();
	const searchTerms = terms as string;

	return Response.json({ message: 'Hello, world!', term: { searchTerms } });
}
