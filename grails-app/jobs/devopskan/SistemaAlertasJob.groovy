package devopskan

class SistemaAlertasJob {
    static triggers = {
      //simple repeatInterval: 5000l // execute job once in 5 seconds
	  cron name: 'myTrigger', cronExpression: "0 0 9/5 * * ?"
    }

	def mailService
			
    def execute() {
		
		def a = new Alertas()
		def instances = a.run()
				
		def modelo = [badIntances: instances[0],errorIntances: instances[1],warningInstances:instances[2], nocCero:instances[3], errorServers: instances[4]]
 		
		mailService.sendMail {
			to "apicore@mercadolibre.com"
			subject "☆☆☆☆ REPORTE DE INSTANCIAS ☆☆☆☆"
			html(view:'/module/alertas', model: modelo)
		 }
		
        println "Mandó mail de verificación de instancias"
    }
}
