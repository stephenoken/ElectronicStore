package com.store

class PayPal {
	static belongsTo = [user:AppUser]
	String emailId
	String password
    static constraints = {
		emailId([ email:true])
		password(password:true)
    }
}
