package com.store

abstract class Controller {
//	abstract def test();
	abstract def index(Integer max)
	abstract def show(String instanceId)
	abstract def edit(String instanceId)
	abstract def create()
	
	def auth(){
		if(!session.user){
			redirect(controller:'appUser', action:'login')
			return false
		}
	}
}
