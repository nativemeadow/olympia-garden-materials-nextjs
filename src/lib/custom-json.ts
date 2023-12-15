// prisma doesn't support bigint, so we need to convert it to string
export const customJson = (obj: any) =>
	JSON.stringify(
		obj,
		(key, value) => (typeof value === 'bigint' ? value.toString() : value) // return everything else unchanged
	);

// turn string created by customJson back to json
export const parseCustomJson = (json: string) => {
	return JSON.parse(customJson(json));
};
