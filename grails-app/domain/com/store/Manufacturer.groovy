package com.store

class Manufacturer {
	static hasMany = [stocks:Stock]
    static constraints = {
    }
	String manufacturerName
	
	String toString(){
		"${manufacturerName}"
	}
}
