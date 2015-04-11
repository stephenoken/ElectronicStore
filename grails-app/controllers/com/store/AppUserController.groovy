package com.store

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


class AppUserController{
	def scaffold = AppUser
//	def beforeInterceptor=[action:this.&auth,except:["login","authenticate","logout","create","save"]] 
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
		if(session.user){
		AppUser user = AppUser.get(session.user.id)
		render (view:"home.gsp", model:[userInstance:user,shoppingCartInstance:user.shoppingCarts[0],
			creditCardInstance:user.creditCards[0],payPalInstance:user.paypalAccounts[0]])
		}
		else
		redirect(controller:'appUser', action:'login')
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
	@Transactional
	def save(AppUser appUserInstance){
		if(appUserInstance.hasErrors()){
			respond appUserInstance.errors, view:'create'
			return 
		}
		appUserInstance.role = "ROLE_USER"
		appUserInstance.save flush:true
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [message(code: 'appUser.label', default: 'User'), appUserInstance.id])
				redirect(action:'home')
			}
			'*' { respond appUserInstance, [status: CREATED] }
		}
	}
}
