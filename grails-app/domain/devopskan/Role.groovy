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

	Integer getAverageFactor() {
		
		Integer suma=0
		Integer cant=0
		
		def roles = Role.findAll()
		
		roles.each { Role r ->  
			suma = suma + r.getProductivityFactor()
			cant++
		}
	
		if (cant>0)	
			return suma/cant
		else 
			return 1
			
	}
	
}
