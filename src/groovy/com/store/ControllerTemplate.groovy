package com.store

abstract class ControllerTemplate {
	def auth(){
		
		if(!session.user){
			redirect(controller:'appUser', action:'login')
			return false
		}
		if(isUser())
			println "You are a User"
		else if(isAdmin())
			println "You're an Admin"
		else
			println "You haven't signed up"
	}
	
	private boolean isUser(){
		return session.user.role.equals("ROLE_USER")
	}
	private def isAdmin(){
		return session.user.role.equals("ROLE_ADMIN")
	}
	
}
