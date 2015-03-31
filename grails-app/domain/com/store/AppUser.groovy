package com.store

class AppUser {
	
	String fullName;
	String email;
	String address;
	String password;
	
    static constraints = {
		email([unique:true, email:true])
		password(password:true)
		address(unique:false)
		
    }
	
	String toString(){
		"${fullName}"
	}
}
