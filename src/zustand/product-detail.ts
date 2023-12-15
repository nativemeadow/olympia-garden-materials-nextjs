import { Dispatch, SetStateAction } from 'react';
import { create } from 'zustand';
import { Product, Pricing, SelectListOptions } from '@/lib/types';

type DetailStore = {
	product: Product;
	setProduct: (product: Product) => void;
	productSize: string;
	productQty: number | undefined;
	selectedValue: string;
	selectList: SelectListOptions[];
	productThumbs: Pricing[] | undefined;
	productOptions: string;
	//setProductQty: Dispatch<SetStateAction<number>>;
	addToCartHandler: (event: React.FormEvent<HTMLFormElement>) => void;
	productSelectHandler: (event: React.ChangeEvent<HTMLSelectElement>) => void;
};

export const useDetailStore = create<DetailStore>((set) => ({
	product: {} as Product,
	setProduct: (product) => set({ product }),
	productSize: '',
	productQty: 0,
	selectedValue: '',
	selectList: [],
	productThumbs: [],
	productOptions: '',
	//setProductQty: (productQty) => set({ productQty }),
	addToCartHandler: (event) => {
		event.preventDefault();
	},
	productSelectHandler: (event) => {
		event.preventDefault();
	},
	// setProductOptions: (productOptions: string) => set({ productOptions }),
}));
