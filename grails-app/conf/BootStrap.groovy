import com.store.AppUser
import com.store.Category
import com.store.CreditCard;
import com.store.Manufacturer
import com.store.Review
import com.store.ShoppingCart
import com.store.Stock

class BootStrap {

    def init = { servletContext ->
		double price = 0
		def user = AppUser.findOrSaveWhere(fullName:"Stephen O'Kennedy", email:"Stephenoken@gmail.com", 
			password:"pwd")
		def cart = ShoppingCart.findOrSaveWhere(address:"3 Clonasleigh",totalPrice:price, user:user)
		def cC = CreditCard.findOrSaveWhere(address:"3 Clonasleigh", firstName:"Stephen",cardExpDate:"06/16",cardNumber:"4532470627137387",cardType:"Visa",county:"Dublin",lastName:"Oken",town:"shankill",user:user)
		//Categories
		def laptopCategory = Category.findOrSaveWhere(categoryName:"Laptops")
		def tvCategory = Category.findOrSaveWhere(categoryName:"TVs")
		def desktopCategory = Category.findOrSaveWhere(categoryName:"Desktops")
		//Manufacturers
		def appleManufacturer = Manufacturer.findOrSaveWhere(manufacturerName:"Apple")
		def samsungManufacturer = Manufacturer.findOrSaveWhere(manufacturerName:"Samsung")
		def lenovoManufacturer = Manufacturer.findOrSaveWhere(manufacturerName:"Lenovo")
		//Products 
		double macbookProPrice = 999
		double thinPadPrice = 499
		double samsungTVPrice = 650
		double appleTVPrice = 300
		double iMacPrice = 2000
		double samsungDesktopPrice = 1200
		double lennovoDesktopPrice = 1000
		def macbookPro = Stock.findOrSaveWhere(title:"Macbook pro", price:macbookProPrice,manufacturer:appleManufacturer,category:laptopCategory,stockLevel:0)
		def thinPad = Stock.findOrSaveWhere(title:"T-351", price:thinPadPrice,manufacturer:lenovoManufacturer,category:laptopCategory,stockLevel:2)
		def samsungTV = Stock.findOrSaveWhere(title:"48\" H8000 Series 8 Smart 3D Curved Full HD LED TV", price:samsungTVPrice,manufacturer:samsungManufacturer,category:tvCategory,stockLevel:5)
		def appleTV = Stock.findOrSaveWhere(title:"Apple TV", price:appleTVPrice,manufacturer:appleManufacturer,category:tvCategory,stockLevel:4)
		def iMac = Stock.findOrSaveWhere(title:"iMac", price:iMacPrice,manufacturer:appleManufacturer,category:desktopCategory,stockLevel:5)
		def samsungDesktop = Stock.findOrSaveWhere(title:"ATIV One 7 Curved (27.0” LED Full HD / Core™ i5)", price:samsungDesktopPrice,manufacturer:samsungManufacturer,category:desktopCategory,stockLevel:7)
		def lennovoDesktop = Stock.findOrSaveWhere(title:"B50", price:lennovoDesktopPrice,manufacturer:lenovoManufacturer,category:desktopCategory,stockLevel:9)
		//Reviews
		def review1 = Review.findOrSaveWhere(stock:macbookPro,author:user,review:"It's great",rating:5)
		
    }
    def destroy = {
    }
}
