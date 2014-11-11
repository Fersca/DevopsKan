package devopskan

class Initiative {

	String name
	String sponsor
	String description
	static hasMany = [tasks:Task]
	
    static constraints = {
    }
	
	String toString() {
		return name
	}
}
