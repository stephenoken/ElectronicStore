package com.store

class AppUserController{
	def scaffold = AppUser
	def beforeInterceptor=[action:this.&auth,except:["login","authenticate","logout","create","save"]] 
	def login(){}
	
	def authenticate(){
		def user = AppUser.findByEmailIlikeAndPassword(params.email, params.password)//The ILike makes it case insensitive
		if(user != null){
			session.user = user 
			flash.message = "Hello ${user.fullName}!"
			redirect( action:"home")
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
	
	def home(){
		AppUser user = AppUser.get(session.user.id)
		render (view:"home.gsp", model:[userInsatnce:user,shoppingCartInstance:user.shoppingCarts[0],
			creditCardInstance:user.creditCards[0],payPalInstance:user.paypalAccounts[0]])
	}
	
	def auth(){
		if(!session.user){
			redirect(controller:'appUser', action:'login')
			return false
		}
	}
	
	def purchases(){
		String paymentParam =  params.paymentType
		PaymentStrategy payment;
		if(paymentParam.equalsIgnoreCase("creditCard"))
			payment = new CreditCardController()
		if(paymentParam.equalsIgnoreCase("payPal"))
			payment = new PayPalController()
		payment.pay()
	}
}
