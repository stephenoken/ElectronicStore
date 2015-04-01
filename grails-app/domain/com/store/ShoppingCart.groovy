package com.store

class ShoppingCart {
	static belongsTo = [user:AppUser]
	static hasMany = [stocks:Stock]
    static constraints = {
    }
	String address
}
