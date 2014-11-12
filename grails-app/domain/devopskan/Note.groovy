package devopskan

class Note {

	String description
	Task task
	
	static mapping = {
		description type: 'text'
	}

    static constraints = {
		description(widget:'textarea')
    }
	
	String toString() {
		return description
	}

}
