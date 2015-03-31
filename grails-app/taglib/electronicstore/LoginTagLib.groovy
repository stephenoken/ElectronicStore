package electronicstore

class LoginTagLib {
    //static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
	def loginControl ={
		if(session.user){
			out << "Hello ${session.user.fullName} "
			out << """${link(action:"logout", controller:"appUser", class:"test"){"Logout"}}"""
 	 	}else{
				out << """${link(action:"login", controller:"appUser"){"Login"}}"""
				out << " or Sign up "
				out << """${link(action:"create", controller:"appUser"){"Register"}}"""
		  }
	}
}