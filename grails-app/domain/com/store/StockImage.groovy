package com.store

class StockImage {
	static belongsTo = [stock:Stock]
	String fileName
	byte[] filePayload
    static constraints = {
		filePayload(nullable:true, maxSize:100000000)
    }
}
