package com.store

class LoggingFilters {

    def filters = {
        adminStockAccess(controller:'stock|category|manufacturer', action:'edit|create|delete') {
            before = {
				if(!(session.user?.role.equals("ROLE_ADMIN"))){
					flash.message="You must be signed in as an Admin"
					redirect(controller:'AppUser',action:"login")
				}
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
		adminUserAccess(controller:'appUser',action:'edit|index|delete'){
			before = {
				if(!(session.user?.role.equals("ROLE_ADMIN"))){
					flash.message="You must be signed in as an Admin"
					redirect(controller:'AppUser',action:"login")
				}
			}
		}
    }
}
