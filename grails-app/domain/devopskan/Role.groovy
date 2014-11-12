package devopskan

class Role {

	String name
	Integer productivityFactor
	
	static hasMany = [developers:Developer]
	
    static constraints = {
    }
	
	String toString() {
		return name
	}

}
