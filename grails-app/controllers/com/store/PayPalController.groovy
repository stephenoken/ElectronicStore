package com.store



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PayPalController extends PaymentStrategy{
	def scaffold = true
	
	def create(){
		AppUser user = AppUser.get(session.user.id)
		String emailId = params.emailId
		String password = params.password
		PayPal pp = new PayPal(emailId:emailId,password:password, user:user)
		pp.save flush:true
		flash.message="You've set up your Paypal Account"
		redirect(controller:"AppUser",action:"home")
	}
	
	def pay() {
		AppUser user = AppUser.get(session.user.id)
		PayPal pp = user.paypalAccounts[0]
		ShoppingCart cart = user.shoppingCarts[0]
		if(pp !=null){
			flash.message="Basket costing €" + cart.totalPrice + " has been bought by PayPal =" + pp.emailId
			cart.totalPrice = 0;
			for(CartItem c:cart.items){
				c.hasBought = true
				c.save flush:true
			}
			cart.save flush:true
		}
		redirect(controller:"AppUser",action:"home")
	}
}
