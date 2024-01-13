import { PrismaClient } from '@prisma/client';

// let prisma: PrismaClient;

// export const db = () => {
// 	if (!prisma) {
// 		prisma = new PrismaClient();
// 	}

// 	return prisma;
// };

export const db = new PrismaClient();
