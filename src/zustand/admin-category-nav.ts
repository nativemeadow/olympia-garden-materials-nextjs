import { create } from 'zustand';
import { persist, createJSONStorage } from 'zustand/middleware';

// Define your Store type
type Store = {
	categoryId: string | null;
	setCategoryId: (categoryId: string) => void;
};

const useStore = create<Store, [['zustand/persist', unknown]]>(
	persist(
		(set) => ({
			categoryId: null,
			setCategoryId: (categoryId: string) => set(() => ({ categoryId })),
		}),
		{
			name: 'product-nav-storage',
			storage: createJSONStorage(() => localStorage),
		}
	)
);

export default useStore;
