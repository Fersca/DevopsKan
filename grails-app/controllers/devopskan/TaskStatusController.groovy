package devopskan

class TaskStatusController {

    static scaffold = true
	
	def changeStatus() {
	
		Task task = Task.get(params.id)
		task.status = TaskStatus.get(params.to)		
		task.save(flush:true)
		chain(controller: params.from, action: "show", id: task.backlog.id)

	}
}
