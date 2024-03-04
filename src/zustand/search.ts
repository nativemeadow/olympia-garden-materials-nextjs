import { create } from 'zustand';
import { persist, createJSONStorage } from 'zustand/middleware';

// Define your Store type
type Store = {
	partNumber: string | null;
	nameOrDescription: string | null;
	category: string | null;
	setPartNumber: (partNumber: string) => void;
	setNameOrDescription: (nameOrDescription: string) => void;
	setCategory: (category: string) => void;
	clearParams: () => void;
};

// Create your store
const useStore = create<Store, [['zustand/persist', unknown]]>(
	persist(
		(set) => ({
			partNumber: null,
			nameOrDescription: null,
			category: null,
			setPartNumber: (partNumber: string) => set(() => ({ partNumber })),
			setNameOrDescription: (nameOrDescription: string) =>
				set(() => ({ nameOrDescription })),
			setCategory: (category: string) => set(() => ({ category })),
			clearParams: () =>
				set((state) => ({
					nameOrDescription: null,
					partNumber: null,
					category: null,
				})),
		}),
		{
			name: 'searchParams-storage',
			storage: createJSONStorage(() => localStorage),
		}
	)
);

export default useStore;
