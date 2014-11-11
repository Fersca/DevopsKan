package projectadmin

class Project {

	String name
	String description
	static hasMany = [tasks:Task]
	
    static constraints = {
    }
	
	String toString() {
		return name
	}
	
}
