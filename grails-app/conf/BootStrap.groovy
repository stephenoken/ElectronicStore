import com.store.AppUser
import com.store.Category;
import com.store.Manufacturer;
import com.store.ShoppingCart

class BootStrap {

    def init = { servletContext ->
		
		def user = AppUser.findOrSaveWhere(fullName:"Stephen O'Kennedy", email:"Stephenoken@gmail.com", 
			password:"pwd")
		def cart = ShoppingCart.findOrSaveWhere(address:"3 Clonasleigh", user:user)
		def laptopCategory = Category.findOrSaveWhere(categoryName:"Laptops")
		def tvCategory = Category.findOrSaveWhere(categoryName:"TVs")
		def desktopCategory = Category.findOrSaveWhere(categoryName:"Desktops")
		def appleManufacturer = Manufacturer.findOrSaveWhere(manufacturerName:"Apple")
		def samsungManufacturer = Manufacturer.findOrSaveWhere(manufacturerName:"Samsung")
		def lenovoManufacturer = Manufacturer.findOrSaveWhere(manufacturerName:"Lenovo")
		
    }
    def destroy = {
    }
}
