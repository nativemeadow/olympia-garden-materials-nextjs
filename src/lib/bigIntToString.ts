import { Decimal } from 'decimal.js';

export function bigIntToString(obj: any, seen = new WeakSet()): any {
	if (obj === null) {
		return obj;
	}

	if (typeof obj === 'bigint') {
		return obj.toString();
	}

	if (typeof obj === 'object' && 'toFixed' in obj) {
		return `$${obj.toFixed(2)}`;
	}

	if (Array.isArray(obj)) {
		seen.add(obj);
		return obj.map((item) => bigIntToString(item, seen));
	}

	if (obj instanceof Map) {
		seen.add(obj);
		return new Map(
			Array.from(obj, ([key, value]) => [
				key,
				bigIntToString(value, seen),
			])
		);
	}

	if (typeof obj === 'object') {
		seen.add(obj);
		return Object.fromEntries(
			Object.entries(obj).map(([key, value]) => [
				key,
				bigIntToString(value, seen),
			])
		);
	}

	return obj;
}
