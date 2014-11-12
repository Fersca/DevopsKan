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

	//Date creationDate
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [notes:Note]

	static mapping = {
		description type: 'text'
		businessObjetive type: 'text'
	}
	
    static constraints = {
		id ()
		title ()
		status()
		module()
		backlog(nullable:true)
		developer(nullable:true)
		description(widget:'textarea')
		businessObjetive(widget:'textarea')
    }
	
	String toString() {
		return title
	}

}
