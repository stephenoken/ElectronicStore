import com.store.AppUser;

class BootStrap {

    def init = { servletContext ->
		def user = AppUser.findOrSaveWhere(fullName:"Stephen O'Kennedy", email:"Stephenoken@gmail.com", 
			address:"3 Clonasleigh", password:"pwd")
    }
    def destroy = {
    }
}
