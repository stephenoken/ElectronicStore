package com.store

class CreditCard {
	String firstName
	String lastName
	String address
	String town
	String county
	String cardType
	String cardNumber
	String cardExpDate
	
	static belongsTo = [user:AppUser]
    static constraints = {
    }
}
