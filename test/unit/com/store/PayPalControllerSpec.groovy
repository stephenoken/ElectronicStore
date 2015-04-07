package com.store



import grails.test.mixin.*
import spock.lang.*

@TestFor(PayPalController)
@Mock(PayPal)
class PayPalControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.payPalInstanceList
            model.payPalInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.payPalInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def payPal = new PayPal()
            payPal.validate()
            controller.save(payPal)

        then:"The create view is rendered again with the correct model"
            model.payPalInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            payPal = new PayPal(params)

            controller.save(payPal)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/payPal/show/1'
            controller.flash.message != null
            PayPal.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def payPal = new PayPal(params)
            controller.show(payPal)

        then:"A model is populated containing the domain instance"
            model.payPalInstance == payPal
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def payPal = new PayPal(params)
            controller.edit(payPal)

        then:"A model is populated containing the domain instance"
            model.payPalInstance == payPal
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/payPal/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def payPal = new PayPal()
            payPal.validate()
            controller.update(payPal)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.payPalInstance == payPal

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            payPal = new PayPal(params).save(flush: true)
            controller.update(payPal)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/payPal/show/$payPal.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/payPal/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def payPal = new PayPal(params).save(flush: true)

        then:"It exists"
            PayPal.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(payPal)

        then:"The instance is deleted"
            PayPal.count() == 0
            response.redirectedUrl == '/payPal/index'
            flash.message != null
    }
}
