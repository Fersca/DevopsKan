package projectadmin

class Initiative {

	String name
	String sponsor
	String internalProyect
	String description
	static hasMany = [tasks:Task]
	
    static constraints = {
    }
	
	String toString() {
		return name
	}
}
