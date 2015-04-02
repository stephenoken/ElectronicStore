package com.store

class CategoryController extends Controller{
	def scaffold = true
    //def index() { }
	def test(){
		render "hello"
	}
	
	def test2(){
		render "hello my friend"
	}
}
