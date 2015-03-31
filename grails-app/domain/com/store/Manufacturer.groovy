package com.store

class Manufacturer {
	static hasMany = [stocks:Stock]
    static constraints = {
    }
	String categoryName
}
