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
	Integer deverloperPriority

	//esta fecha se pone a mano.
	Date creationDate
	
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

	Date getEstimatedTime() {
	
		Date hoy = new Date()
		return hoy+sizeLeft()
			
	}
	
	Integer sizeLeft() {
				
		//Busco la tarea anterior
		if (developer) {
		
			//obtengo todas las tareas
			def tareas = Task.findAll()//Task.findByDeveloper(developer)
			
			//obtengo la tarea que tenga la prioridad anterior
			Task anterior
			tareas.each { Task t ->

				//filtro las de prioridad mas alta  
				if (t.deverloperPriority<this.deverloperPriority) {
					
					if (anterior) {
						if (anterior.deverloperPriority<t.deverloperPriority) {
							anterior = t
						}
					} else {
						//me guardo la actual como anterior
						anterior = t
					}
				}
			}
			
			//dificultad actual
			def diff = difficulty.difficultyFactor * status.finishedPercentaga/100 * developer.role.getAverageFactor()/developer.role.productivityFactor
						
			//encontró una tarea anterior
			if (anterior) {
		
				//devuelve la suma entre la difficultad actual y la de la anterior
				return diff + anterior.sizeLeft()
						
			} else {
			
				//devuelve la diff actual, ya que es la primera tarea del desarrollador
				return diff
			}
				
		} else {

			//no hay desarrollador, con lo cua busca las tareas del proyecto
			def tareas = Task.findByProject(project)
			
			//obtengo la tarea que tenga la prioridad anterior
			Task anterior
			tareas.each { Task t ->
				//filtro las de prioridad mas alta
				if (t.backlogPriority<this.backlogPriority) {
					
					if (anterior) {
						if (anterior.backlogPriority<t.backlogPriority) {
							anterior = t
						}
					} else {
						//me guardo la actual como anterior
						anterior = t
					}
				}
			}
	
			//dificultad actual
			def diff = difficulty.difficultyFactor * status.finishedPercentaga/100 * Role.averageFactor()
	
			//encontró una tarea anterior
			if (anterior) {
						
				//devuelve la suma entre la difficultad actual y la de la anterior en el backlog
				return diff + anterior.sizeLeft()
						
			} else {
			
				//devuelve la diff actual, ya que es la primera tarea del backlog, debería ser la primera tarea
				//de cualquier desarrollador, salgo que no haya ninguno en el proyecto
				return diff
			}

		} 
		
	}
	
}
