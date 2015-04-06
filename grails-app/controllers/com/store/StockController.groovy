package com.store



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StockController extends Controller{

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		render (view:"/stock/index.gsp", model:[stockInstanceList:Stock.list(params),stockInstanceCount: Stock.count()])
    }

    def show(String instanceId) {
		Stock s = Stock.get(instanceId)
		render (view:"/stock/show.gsp",model:[stockInstance:s])
    }

    def edit(String instanceId) {
		Stock s = Stock.get(instanceId)
        render (view:"/stock/edit.gsp",model:[stockInstance:s])
    }
    def create() {
        render (view:"/stock/create.gsp")
    }

    @Transactional
    def save(Stock stockInstance) {
        if (stockInstance == null) {
            notFound()
            return
        }

        if (stockInstance.hasErrors()) {
            respond stockInstance.errors, view:'create'
            return
        }

        stockInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'stock.label', default: 'Stock'), stockInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { respond stockInstance, [status: CREATED] }
        }
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

        stockInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Stock.label', default: 'Stock'), stockInstance.id])
                redirect action: "index", method: "GET"
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
}
