package com.store

class Category {
	static hasMany = [stocks:Stock]
    static constraints = {
    }
	String categoryName
	
	String toString(){
		"${categoryName}"
	}
}
