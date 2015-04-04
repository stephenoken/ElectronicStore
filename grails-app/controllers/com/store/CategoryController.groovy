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

	def show(int instanceId) {
		Category c = Category.get(instanceId)
		render (view:"/category/show.gsp",model:[categoryInstance:c])
	}
}
