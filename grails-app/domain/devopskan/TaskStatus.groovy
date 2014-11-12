package devopskan

class TaskStatus {

	String name
	Integer finishedPercentaga
	
	static hasMany = [tasks:Task]
	
    static constraints = {
    }
	
	String toString() {
		return name
	}
}
