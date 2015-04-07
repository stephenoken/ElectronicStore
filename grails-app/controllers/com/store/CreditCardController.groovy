package com.store

class CreditCardController extends PaymentStrategy{
	def scaffold = true
   // def index() { }
	def create(){
		AppUser user = AppUser.get(session.user.id)
		String address = params.address
		String cardExpDate = params.cardExpDate
		String cardNumber = params.cardNumber
		String cardType = params.cardType
		String county = params.county
		String firstName = params.firstName
		String lastName = params.lastName
		String town = params.town
		
		println address
		CreditCard cc = new CreditCard(
			firstName:firstName,address:address,cardExpDate:cardExpDate,
			cardNumber:cardNumber,cardType:cardType,county:county,
			lastName:lastName,town:town,user:user)
		cc.save flush:true
		flash.message="You've set up your Credit Card"
		redirect(controller:"AppUser",action:"home")
		
	}

	def pay() {
		AppUser user = AppUser.get(session.user.id)
		CreditCard card = user.creditCards[0]
		ShoppingCart cart = user.shoppingCarts[0]
		if(card !=null){
			flash.message="Basket costing €" + cart.totalPrice + " has been bought by credit card " + card.cardNumber
			cart.totalPrice = 0
//			for(CartItem c:cart.items){
//				def item = c.stock
//				def shoppingCart = c.shoppingCart
//				println item
//				item.discard()
//				shoppingCart.discard()
//				c.delete flush:true
//			}
			cart.save flush:true
			redirect(controller:"AppUser",action:"home")
		}
		
	}
}
