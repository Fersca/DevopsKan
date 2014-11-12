package devopskan

class Module {
	
	String name
	String description
	
	static hasMany = [tasks:Task]
	
	static mapping = {
		description type: 'text'
	}

	static constraints = {
		description(widget:'textarea')
	}
	
	String toString() {
		return name
	}

}
