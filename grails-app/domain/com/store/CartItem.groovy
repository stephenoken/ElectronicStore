package com.store

class CartItem {
	static belongsTo = [shoppingCart:ShoppingCart, stock:Stock]
    static constraints = {
    }
}
