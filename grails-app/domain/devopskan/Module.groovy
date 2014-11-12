package devopskan

class Module {
	
	String name
	String description
	
	static hasMany = [tasks:Task]
	
	static constraints = {
	}

	String toString() {
		return name
	}

}
