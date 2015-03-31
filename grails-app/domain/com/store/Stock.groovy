package com.store

class Stock {
	static belongsTo = [manufacturer:Manufacturer, category:Category]
	
    static constraints = {
		title(unique:true)
		filePayload(nullable:true, maxSize:100000000)
    }
	
	String title;
	BigDecimal price;
	byte[] filePayload
	
}
