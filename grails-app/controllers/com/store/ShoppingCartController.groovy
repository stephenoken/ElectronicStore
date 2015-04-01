package com.store

class ShoppingCartController {
	def scaffold = true
//    def index() { }
	def beforeInterceptor=[action:this.&auth]
	
	def auth(){
		if(!session.user){
			redirect(controller:'appUser', action:'login')
			return false
		}
	}
}
