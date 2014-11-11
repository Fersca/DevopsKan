package projectadmin

class Task {

	Long id
	String title
	String description
	String businessObjetive
	
	Developer developer
	Project project
	Initiative initiative
	String initiativeProject
	Module module
	
	TaskType type
	TaskStatus status
	TaskDifficulty difficulty
	Boolean outsourcerd
	String sponsor
	Integer iniciativePriority
	Integer projectPriority

	static hasMany = [notes:Note]
		
    static constraints = {
		developer(nullable:true)
		project(nullable:true)
    }
	
	String toString() {
		return id+" - "+title
	}

}
