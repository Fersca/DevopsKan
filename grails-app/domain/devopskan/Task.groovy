package devopskan

class Task {

	String title
	String description
	String businessObjetive
	
	Developer developer
	Backlog backlog
	Initiative initiative
	String project
	Module module
	
	TaskType type
	TaskStatus status
	TaskDifficulty difficulty
	Boolean outsourcerd
	String sponsor
	Integer iniciativePriority
	Integer backlogPriority

	Date dateCreated
	Date lastUpdated
	
	static hasMany = [notes:Note]
		
    static constraints = {
		developer(nullable:true)
		backlog(nullable:true)
    }
	
	String toString() {
		return title
	}

}
