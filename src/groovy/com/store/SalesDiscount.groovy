package com.store

class SalesDiscount extends Discount {

	public double discount() {
		return stockInstance.price*(1-stockInstance.discount);
	}

}
