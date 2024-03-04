import { create } from 'zustand';
import { Items } from '@/lib/items';
import { initialAddressInfo, manualAddress } from '@/lib/customerInfo';
import { Store } from './orderType';
import { mountStoreDevtool } from 'simple-zustand-devtools';
import { persist, createJSONStorage } from 'zustand/middleware';

const initialState = {
	id: 0,
	orderDate: new Date(),
	Items: [],
	taxRate: 0,
	deliveryInstructions: '',
	purchaseOrder: '',
	requestedDeliveryDate: '',
	isPaid: false,
	isDelivered: false,
	paymentMethod: '',
	createdAt: new Date(),
	updatedAt: new Date(),
	deliveryAddressId: '',
	manualAddress: initialAddressInfo.manualAddress,
	billingAddress: initialAddressInfo.manualAddress,
	deliveryAddress: initialAddressInfo.manualAddress,
	deliveryDistance: 0,
	deliveryDuration: 0,
	isDelivery: false,
	isManualAddress: false,
	isPickup: false,
	pickupDate: initialAddressInfo.pickup.date,
	pickupTime: initialAddressInfo.pickup.time,
	confirmOrder: false,
};

const useOrders = create<Store>()(
	persist(
		(set, get) => ({
			...initialState,
			loadFromCart: (items: Items[]) => {
				set((state) => ({
					Items: items,
				}));
			},
			clearOrders: () => {
				set((state) => ({
					Items: [],
				}));
			},
			orderCount: () => {
				return get().Items.length;
			},
			orderTotal: () => {
				return get().Items.reduce(
					(acc, item) => acc + item.price * item.quantity,
					0
				);
			},
			setOrderDate: (orderDate: Date) => {
				set((state) => ({
					orderDate,
				}));
			},
			setItems: (items: Items[]) => {
				set((state) => ({
					Items: items,
				}));
			},
			setTaxRate: (taxRate: number) => {
				set((state) => ({
					taxRate,
				}));
			},
			setDeliveryInstructions: (deliveryInstructions: string) => {
				set((state) => ({
					deliveryInstructions,
				}));
			},
			setPurchaseOrder: (purchaseOrder: string) => {
				set((state) => ({
					purchaseOrder,
				}));
			},
			setRequestedDeliveryDate: (deliveryDate: string) => {
				set((state) => ({
					requestedDeliveryDate: deliveryDate,
				}));
			},
			setIsPaid: (isPaid: boolean) => {
				set((state) => ({
					isPaid,
				}));
			},
			setIsDelivered: (isDelivered: boolean) => {
				set((state) => ({
					isDelivered,
				}));
			},
			setPaymentMethod: (paymentMethod: string) => {
				set((state) => ({
					paymentMethod,
				}));
			},
			setCreatedAt: (createdAt: Date) => {
				set((state) => ({
					createdAt,
				}));
			},
			setUpdatedAt: (updatedAt: Date) => {
				set((state) => ({
					updatedAt,
				}));
			},
			setDeliveryAddressId: (deliveryAddressId: string) => {
				set((state) => ({
					deliveryAddressId,
				}));
			},
			setDeliveryDistance: (deliveryDistance: number) => {
				set((state) => ({
					deliveryDistance,
				}));
			},
			setDeliveryDuration: (deliveryDuration: number) => {
				set((state) => ({
					deliveryDuration,
				}));
			},
			setIsDelivery: (isDelivery: boolean) => {
				set((state) => ({
					isDelivery,
				}));
			},
			setIsManualAddress: (isManualAddress: boolean) => {
				set((state) => ({
					isManualAddress,
				}));
			},
			getManualAddress: () => {
				return get().manualAddress;
			},
			initializeManualAddress: (input: string) => {
				const address = JSON.parse(input);
				set((state) => ({
					...address,
				}));
			},
			setManualAddress: (manualAddress: manualAddress) => {
				set((state) => ({
					manualAddress,
				}));
			},
			getBillingAddress: () => {
				return get().billingAddress;
			},
			initializeBillingAddress: (input: string) => {
				const address = JSON.parse(input);
				set((state) => ({
					...address,
				}));
			},
			setBillingAddress: (billingAddress: manualAddress) => {
				set((state) => ({
					billingAddress,
				}));
			},
			getDeliveryAddress: () => {
				return get().deliveryAddress;
			},
			initializeDeliveryAddress: (input: string) => {
				const address = JSON.parse(input);
				set((state) => ({
					...address,
				}));
			},
			setDeliveryAddress: (deliveryAddress: manualAddress) => {
				set((state) => ({
					deliveryAddress,
				}));
			},
			setIsPickup: (isPickup: boolean) => {
				set((state) => ({
					isPickup,
				}));
			},
			setPickupDate: (pickupDate: string) => {
				set((_state) => ({
					pickupDate,
				}));
			},
			setPickupTime: (pickupTime: string) => {
				set((state) => ({
					pickupTime,
				}));
			},
			setConfirmOrder: (confirmOrder: boolean) => {
				set((state) => ({
					confirmOrder,
				}));
			},
			hasRequestedDeliveryDate: () => {
				return get().requestedDeliveryDate !== '';
			},
			hasDeliveryInstructions: () => {
				return get().deliveryInstructions !== '';
			},
			reset: () => {
				set(initialState);
			},
		}),
		{
			name: 'order',
			storage: createJSONStorage(() => localStorage),
		}
	)
);

export default useOrders;
