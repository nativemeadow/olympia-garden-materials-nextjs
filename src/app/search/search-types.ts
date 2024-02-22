import z from 'zod';

export const advanceSearchSchema = z.object({
	partNumber: z.string().optional(),
	nameOrDescription: z.string().optional(),
	category: z.string().optional(),
});

export type TAdvanceSearchSchemaSchema = z.infer<typeof advanceSearchSchema>;
