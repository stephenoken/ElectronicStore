package com.store

abstract class ControllerTemplate {
	
	def auth(){
		if(!session.user){
			redirect(controller:'appUser', action:'login')
			return false
		}
	}
}
