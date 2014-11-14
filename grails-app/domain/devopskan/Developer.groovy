package devopskan

class Developer {

	String name
	String mail
	String password
	Role role
	
	static hasMany = [tasks:Task]
 	
    static constraints = {
		password(password:true) 
    }
		
	String toString() {
		return name
	}
}
