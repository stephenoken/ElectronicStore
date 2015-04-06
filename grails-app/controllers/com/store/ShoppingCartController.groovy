package com.store

class ShoppingCartController {
//    def index() { }
	def beforeInterceptor=[action:this.&auth]
	
	def auth(){
		if(!session.user){
			redirect(controller:'appUser', action:'login')
			return false
		}
	}
	
	def create(){
		AppUser user = AppUser.get(session.user.id)
		String address = params.address
		double price = 0
		println address
		ShoppingCart cart = new ShoppingCart(user:user,address:address,totalPrice:price)
		cart.save flush:true
		flash.message="You've set up your shopping cart"
		redirect(controller:"AppUser",action:"home")
		
	}
}
