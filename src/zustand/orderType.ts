import { Items } from '@/lib/items';
import { initialAddressInfo, manualAddress } from '@/lib/customerInfo';

export type Store = {
	id: number;
	orderDate: Date;
	Items: Array<Items>;
	loadFromCart: (items: Items[]) => void;
	clearOrders: () => void;
	orderCount: () => number;
	orderTotal: () => number;
	taxRate: number;
	deliveryInstructions: string;
	purchaseOrder: string;
	requestedDeliveryDate: string;
	isPaid: boolean;
	isDelivered: boolean;
	paymentMethod: string;
	createdAt: Date;
	updatedAt: Date;
	isDelivery: boolean;
	isManualAddress: boolean;
	deliveryAddressId: string;
	manualAddress: manualAddress;
	billingAddress: manualAddress;
	deliveryAddress: manualAddress;
	deliveryDistance: number;
	deliveryDuration: number;
	isPickup: boolean;
	pickupDate: string;
	pickupTime: string;
	confirmOrder: boolean;
	setOrderDate: (orderDate: Date) => void;
	setItems: (items: Items[]) => void;
	setTaxRate: (taxRate: number) => void;
	setDeliveryInstructions: (deliveryInstructions: string) => void;
	setPurchaseOrder: (purchaseOrder: string) => void;
	setRequestedDeliveryDate: (requestedDeliveryDate: string) => void;
	setIsPaid: (isPaid: boolean) => void;
	setIsDelivered: (isDelivered: boolean) => void;
	setIsDelivery: (isDelivery: boolean) => void;
	setDeliveryAddressId: (deliveryAddressId: string) => void;
	setIsManualAddress: (isManualAddress: boolean) => void;
	initializeManualAddress: (input: string) => void;
	setManualAddress: (manualAddress: manualAddress) => void;
	getManualAddress: () => manualAddress;
	setBillingAddress: (billingAddress: manualAddress) => void;
	getBillingAddress: () => manualAddress;
	setDeliveryAddress: (billingAddress: manualAddress) => void;
	getDeliveryAddress: () => manualAddress;
	setDeliveryDistance: (deliveryDistance: number) => void;
	setDeliveryDuration: (deliveryDuration: number) => void;
	setPaymentMethod: (paymentMethod: string) => void;
	setCreatedAt: (createdAt: Date) => void;
	setUpdatedAt: (updatedAt: Date) => void;
	setIsPickup: (isPickup: boolean) => void;
	setPickupDate: (pickupDate: string) => void;
	setPickupTime: (pickupTime: string) => void;
	hasRequestedDeliveryDate: () => boolean;
	hasDeliveryInstructions: () => boolean;
	reset: () => void;
};