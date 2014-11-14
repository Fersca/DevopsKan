package devopskan

class TaskController {

    static scaffold = true
	
	def increasePriority() {
		
		Task task = Task.get(params.id)
		if (task.deverloperPriority>0)
			task.deverloperPriority = task.deverloperPriority-1 
		
		task.save(flush:true)
		chain(controller: "developer", action: "show", id: task.developer.id)
		
	}
	
	def decreasePriority() {
		
		Task task = Task.get(params.id)
		task.deverloperPriority = task.deverloperPriority+1
		
		task.save(flush:true)
		chain(controller: "developer", action: "show", id: task.developer.id)
		
	}

	def increaseBackPriority() {
		
		Task task = Task.get(params.id)
		if (task.backlogPriority>0)
			task.backlogPriority = task.backlogPriority-1
		
		task.save(flush:true)
		chain(controller: "backlog", action: "show", id: task.backlog.id)
		
	}
	
	def decreaseBackPriority() {
		
		Task task = Task.get(params.id)
		task.backlogPriority = task.backlogPriority+1
		
		task.save(flush:true)
		chain(controller: "backlog", action: "show", id: task.backlog.id)
		
	}

	def increaseInitPriority() {
		
		Task task = Task.get(params.id)
		if (task.iniciativePriority>0)
			task.iniciativePriority = task.iniciativePriority-1
		
		task.save(flush:true)
		chain(controller: "backlog", action: "show", id: task.backlog.id)
		
	}
	
	def decreaseInitPriority() {
		
		Task task = Task.get(params.id)
		task.iniciativePriority = task.iniciativePriority+1
		
		task.save(flush:true)
		chain(controller: "initiative", action: "show", id: task.initiative.id)
		
	}

}
