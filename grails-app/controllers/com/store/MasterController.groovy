package com.store

class MasterController {
	private Controller category = new CategoryController()
    def index() {
		category.test2()
	}
}
