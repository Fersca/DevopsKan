package projectadmin

class Note {

	String description
	Task task
	
    static constraints = {
    }
	
	String toString() {
		return description
	}

}
