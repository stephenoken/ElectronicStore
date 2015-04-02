package com.store



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StockController {
	def scaffold = true
//    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
//
//    def index(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        respond Stock.list(params), model:[stockInstanceCount: Stock.count()]
//    }
//
//    def show(Stock stockInstance) {
//        respond stockInstance, model:[]
//    }
//	
//	def displayImage = {
//		Stock stock = Stock.get(params.id);
//		byte[] image = stock.filePayload
//		response.outputStream << image
//	}
//
//    def create() {
//        respond new Stock(params)
//    }
//
//	def hdImageService
//    @Transactional
//    def save(Stock stockInstance) {
//        if (stockInstance == null) {
//            notFound()
//            return
//        }
//
//        if (stockInstance.hasErrors()) {
//            respond stockInstance.errors, view:'create'
//            return
//        }
//		println params
//		def uploadedFile = params.filePayload
//		try{
//			byte[] uploadedFileBytes = hdImageService.scale(uploadedFile.getInputStream(),500,500)
//			stockInstance.filePayload = uploadedFileBytes
//			
//		}catch(Exception e){
//			println e
//		}
//		stockInstance.save flush:true
//		
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.created.message', args: [message(code: 'stock.label', default: 'Stock'), stockInstance.id])
//                redirect stockInstance
//            }
//            '*' { respond stockInstance, [status: CREATED] }
//        }
//    }
//
//    def edit(Stock stockInstance) {
//        respond stockInstance
//    }
//
//    @Transactional
//    def update(Stock stockInstance) {
//        if (stockInstance == null) {
//            notFound()
//            return
//        }
//
//        if (stockInstance.hasErrors()) {
//            respond stockInstance.errors, view:'edit'
//            return
//        }
//
//        stockInstance.save flush:true
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.updated.message', args: [message(code: 'Stock.label', default: 'Stock'), stockInstance.id])
//                redirect stockInstance
//            }
//            '*'{ respond stockInstance, [status: OK] }
//        }
//    }
//
//    @Transactional
//    def delete(Stock stockInstance) {
//
//        if (stockInstance == null) {
//            notFound()
//            return
//        }
//
//        stockInstance.delete flush:true
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Stock.label', default: 'Stock'), stockInstance.id])
//                redirect action:"index", method:"GET"
//            }
//            '*'{ render status: NO_CONTENT }
//        }
//    }
//
//    protected void notFound() {
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.not.found.message', args: [message(code: 'stock.label', default: 'Stock'), params.id])
//                redirect action: "index", method: "GET"
//            }
//            '*'{ render status: NOT_FOUND }
//        }
//    }
}
