package com.store
import org.springframework.transaction.annotation.Transactional
@Transactional
class MasterController {
	private Controller category
	
	def index(){
		String controllerParam = params.cntlr
		String instanceId = params.instanceId
		String function = params.function
		Controller controller
		println controllerParam + " " +instanceId + " " + function
		switch(controllerParam){
			case "category": controller = new CategoryController()
			break
			//case "": controller
			default: render "Resource Unavailable"
		}
		switch(function){
			case "index": controller.index()
			break
			case "show": controller.show(instanceId)
			break
			case "edit": controller.edit(instanceId)
			break
			case "create": controller.create()
			break
			
		}
	}
    def index2() {
		category = new CategoryController()
		category.test2()
	}
	
	def showCategory(String instanceId){
		println instanceId
		category = new CategoryController()
		category.show(instanceId)
	}
	
	def editCategory(String instanceId){
		println instanceId
		category = new CategoryController()
		category.edit(instanceId)
	}
	
	def createCategory(){
		category = new CategoryController()
		category.create()
	}
}
