package com.store


class Stock {
	static belongsTo = [manufacturer:Manufacturer, category:Category]
	static hasMany = [reviews:Review, purchases:CartItem]
	
    static constraints = {
		title(unique:true)
//		filePayload(nullable:true, maxSize:100000000)
		associatedImage(nullable:true)
    }
	
	String title;
	String associatedImage;
	double price;
	int stockLevel; 
	double discount
//	byte[] filePayload
	
	String toString(){
		"${title}"
	}
	
}
