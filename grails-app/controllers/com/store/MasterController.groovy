package com.store
import org.springframework.transaction.annotation.Transactional
@Transactional
class MasterController {
	private Controller category
    def index() {
		category = new CategoryController()
		category.test2()
	}
	
	def showCategory(int instanceId){
		println instanceId
		category = new CategoryController()
		category.show(instanceId)
	}
}
