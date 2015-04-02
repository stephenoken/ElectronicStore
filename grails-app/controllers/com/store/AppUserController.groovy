package com.store

class AppUserController{
	def scaffold = AppUser
	
	def login(){}
	
	def authenticate(){
		def user = AppUser.findByEmailIlikeAndPassword(params.email, params.password)//The ILike makes it case insensitive
		if(user != null){
			session.user = user 
			flash.message = "Hello ${user.fullName}!"
			redirect(controller:"stock", action:"index")
		}else{
			flash.message= "Sorry, ${params.email}. Please try again!"
			redirect(action:"login")
		}
	}
	
	def logout(){
		flash.message="Goodbye ${session.user.fullName}"
		session.user = null
		redirect(controller:"stock", action:"index")
	}
}
