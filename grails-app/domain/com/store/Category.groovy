package com.store

class Category {
	static hasMany = [stocks:Stock]
    static constraints = {
		categoryName(unique:true)
    }
	String categoryName
	
	String toString(){
		"${categoryName}"
	}
}
