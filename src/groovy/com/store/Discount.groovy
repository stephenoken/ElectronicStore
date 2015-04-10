package com.store

abstract class Discount {
	protected Stock stockInstance
	protected AppUser user
	abstract double discount()
	
	def applyDiscount(Stock stockInsatnce, AppUser user){
		this.user = user
		this.stockInstance = stockInsatnce
		return discount()
	}

}
