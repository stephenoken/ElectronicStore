package com.store

class AppUser {
	static hasMany = [shoppingCarts:ShoppingCart, creditCards:CreditCard]
	String fullName;
	String email;
	String password;
	
    static constraints = {
		email([unique:true, email:true])
		password(password:true)
		
    }
	
	String toString(){
		"${fullName}"
	}
}
