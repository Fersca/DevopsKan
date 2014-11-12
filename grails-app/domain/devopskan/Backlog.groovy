package devopskan

class Backlog {

	String name
	String description
	
	static hasMany = [tasks:Task, modules:Module, developers:Developer]
	
    static constraints = {
    }
	
	String toString() {
		return name
	}
	
}
