package com.store

class ShoppingCart {
	static belongsTo = [user:AppUser]
	static hasMany = [items:CartItem]
    static constraints = {
		address unique: false
		totalPrice unique: false
    }
	String address
	double totalPrice
}
