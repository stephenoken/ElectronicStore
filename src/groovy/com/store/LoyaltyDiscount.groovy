package com.store

class LoyaltyDiscount extends Discount {

	@Override
	public double discount() {
		boolean applyDiscount;
		double discount = 0.05
		for(CartItem c: user.shoppingCarts[0].items){
			if(c.hasBought){
				applyDiscount =true
			}
		}
		if(applyDiscount)
		return stockInstance.price*(1-discount);
		else
		return stockInstance.price;
	}

}
