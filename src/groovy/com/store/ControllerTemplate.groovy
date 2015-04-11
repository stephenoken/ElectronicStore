package com.store

abstract class ControllerTemplate {
	def auth(){
		
		if(!session.user){
			redirect(controller:'appUser', action:'login')
			return false
		}
	}
	
	private boolean isUser(){
		return session.user.role.equals("ROLE_USER")
	}
	private def isAdmin(){
		return session.user.role.equals("ROLE_ADMIN")
	}
	
}
