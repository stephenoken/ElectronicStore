package com.store



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import org.springframework.web.multipart.MultipartRequest

@Transactional(readOnly = true)
class StockController implements StockDAO{
	FileUploadService fileUploadService = new FileUploadService()
	
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Stock.list(params), model:[stockInstanceCount: Stock.count()]
    }

    def show(Stock stockInstance) {
        respond stockInstance, model:[reviewInstanceList:stockInstance.reviews.sort{it.id} ]
    }

    def create() {
        respond new Stock(params)
    }

    @Transactional
    def save(Stock stockInstance) {
        if (stockInstance == null) {
            notFound()
            return
        }
//		stockInstance.associatedImage = "${stockInstance.id}.png" 
        if (stockInstance.hasErrors()) {
            respond stockInstance.errors, view:'create'
            return
        }
        stockInstance.save flush:true
		def associatedImage = request.getFile('imageFile')
		println associatedImage
		if(!associatedImage.isEmpty()){
			stockInstance.associatedImage = fileUploadService.uploadFile(associatedImage, "${stockInstance.id}.png", "associatedImages")
		}
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'stock.label', default: 'Stock'), stockInstance.id])
                redirect stockInstance
            }
            '*' { respond stockInstance, [status: CREATED] }
        }
    }
    def edit(Stock stockInstance) {
        respond stockInstance
    }

    @Transactional
    def update(Stock stockInstance) {
        if (stockInstance == null) {
            notFound()
            return
        }

        if (stockInstance.hasErrors()) {
            respond stockInstance.errors, view:'edit'
            return
        }
		println "Hello"
        stockInstance.save flush:true
//		def associatedImage = request.getFile('imageFile')
//		println associatedImage
//		if(!associatedImage.isEmpty()){
//			stockInstance.associatedImage = fileUploadService.uploadFile(associatedImage, "${stockInstance.id}.png", "associatedImages")
//		}
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Stock.label', default: 'Stock'), stockInstance.id])
                redirect stockInstance
            }
            '*'{ respond stockInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Stock stockInstance) {

        if (stockInstance == null) {
            notFound()
            return
        }

        stockInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Stock.label', default: 'Stock'), stockInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'stock.label', default: 'Stock'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	def addToBasket(Stock stockInstance){
		if(session.user){
			AppUser  user = AppUser.get(session.user.id)
			
			ShoppingCart sct = user.shoppingCarts.getAt(0)
			if(stockInstance.stockLevel > 0){
				Discount sales = new SalesDiscount()
				Discount loyalty = new LoyaltyDiscount()
				double itemPrice = loyalty.applyDiscount(stockInstance,user)
				if(stockInstance.discount)
					itemPrice = sales.applyDiscount(stockInstance,user)
				println itemPrice
				CartItem ct = new CartItem(stock:stockInstance,shoppingCart:sct,hasBought:false,itemPrice:itemPrice)
				ct.save flush:true
				stockInstance.stockLevel --
				stockInstance.save flush:true
				sct.totalPrice += ct.itemPrice
				sct.save flush:true
				flash.message = "Item added to your cart"
				redirect (controller:"appUser",action:"home")
			}else{
				flash.message = "Item not in stock"
				redirect (controller:"appUser",action:"home")
			}
		}else{
				flash.message = "Must be logged in to add to basket"
				redirect (controller:"appUser",action:"login")
		}
	}

	def search() {
		// Will automatically render search.gsp
	}

	def execute(){
		println params
		String searchTerm = params.inputSearch
		String searchType = params.searchType
		ArrayList<Stock> results;
		try{
			switch(searchType){
				case "Title": results = findByTitle(searchTerm)
				break
				case "Manufacturer": results = findByManufacture(searchTerm)
				break
				case "Category": results= findByCategory(searchTerm)
				break
			}
		}catch(Exception e){
			flash.message = "Your search yielded no results"	
		}
		render(view:'index',model:[stockInstanceList:results])
	}
	
	public List<Stock> findByTitle(String criteria) {
		return Stock.findAllByTitleIlike("%"+criteria+"%").toList();
	}

	public List<Stock> findByManufacture(String criteria) {
		Manufacturer m = Manufacturer.findByManufacturerNameIlike(criteria)
		return m.stocks.toList();
	}

	public List<Stock> findByCategory(String criteria) {
		ArrayList<Stock> results = new ArrayList<Stock>()
		ArrayList<Category> categories = Category.findAllByCategoryNameIlike("%"+criteria+"%")
		for(Category c : categories)
			results.addAll(c.stocks.toList())
		return results;
	}
	
}
