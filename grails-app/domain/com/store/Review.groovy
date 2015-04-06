package com.store

class Review {
	static belongsTo = [stock:Stock, author:AppUser]
	String review
	int rating
	
	static mapping={
		review type:"text"
	}
    static constraints = {
		rating( size: 0..5)
    }
}
