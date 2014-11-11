package devopskan

class Backlog {

	String name
	String description
	static hasMany = [tasks:Task]
	
    static constraints = {
    }
	
	String toString() {
		return name
	}
	
}
