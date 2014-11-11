package devopskan

class TaskStatus {

	String name
	Integer finishedPercentaga
	
    static constraints = {
    }
	
	String toString() {
		return name
	}
}
