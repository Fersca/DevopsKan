package devopskan

class ModuleController {

    static scaffold = true
	
	def alertas() {
		
		def a = new Alertas()
		def instances = a.run()
				
		[badIntances: instances[0],errorIntances: instances[1],warningInstances:instances[2]]
		
	}
}
