package com.store

class StockImage {
	static belongsTo = [stock:Stock]
	String fileName
    static constraints = {
    }
}
