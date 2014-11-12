package devopskan

class TaskDifficulty {

	String name
	Integer difficultyFactor
	
	static hasMany = [tasks:Task]
	
    static constraints = {
    }
	
	String toString() {
		return name
	}

}
