package com.store

class ShoppingCart {
	static belongsTo = [user:AppUser]
	static hasMany = [items:CartItem]
    static constraints = {
    }
	String address
}
