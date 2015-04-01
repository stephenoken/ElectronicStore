package com.store

class Review {
	static belongsTo = [stock:Stock]
	String review
	int rating
	
	static mapping={
		review type:"text"
	}
    static constraints = {
    }
}
