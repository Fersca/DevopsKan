package devopskan

class Initiative {

	String name
	String sponsor
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
