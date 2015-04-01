import com.store.AppUser
import com.store.ShoppingCart

class BootStrap {

    def init = { servletContext ->
		
		def user = AppUser.findOrSaveWhere(fullName:"Stephen O'Kennedy", email:"Stephenoken@gmail.com", 
			password:"pwd")
		def cart = ShoppingCart.findOrSaveWhere(address:"3 Clonasleigh", user:user)
    }
    def destroy = {
    }
}
