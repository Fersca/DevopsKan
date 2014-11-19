package devopskan

import groovy.json.JsonSlurper
import java.io.BufferedReader
import java.io.InputStreamReader
import java.net.HttpURLConnection
import java.net.URL

class Alertas {

	//departamentos a chequear
	def deptos = 
	['Addresses',
	'Applications',
	'Attributes',
	'Bookmarks',
	'Categories',
	'Emails',
	'Feedback',
	'Homes',
	'Items',
	'Locations',
	'Myml',
	'Orders',
	'Payments',
	'Preferences',
	'Prices',
	'PromotionPacks',
	'Questions',
	'Shipping',
	'Sitemaps',
	'Sites',
	'Users']

	def json = new JsonSlurper()
	
	//exluir los pooles con estas palabras
	def excluir = ['-atl','test','feedback','history_api','frontend','varnish','shipping','payments','node','seo_dashboard','attributes','merka','myml','fend']		
	def url = 'http://api.melicloud.com/compute/pools?dept='
	def urlPool = 'http://api.melicloud.com/compute/pools/'

	def badIntances = []
	def errorIntances = []
	def warningInstances = []
		
	def run(args) {
		
		deptos.each { depto ->
			processDepto(depto)
		}
				  
		return [badIntances, errorIntances, warningInstances] 
			
	}
	
	def processDepto(def depto) {
		//obtiene la lista de pooles
		def pooles = json.parseText((url+depto).toURL().getText())
		
		//para cada pool, pide las instancias
		pooles.each { pool ->
			
			println "Verificando pool: "+pool
			
			//verifica si hay que excluirla
			def excluye = false
			excluir.each {
				if (pool.contains(it)){
					excluye = true
				}
			}
	
			//si no hay que exluirla
			if (!excluye){
	
				//verifica si es un webserver, sino lo descarto (por ejemplo para elastic, rabbits, etc)
				if (pool.contains('webserv')){
		
					def instances = json.parseText((urlPool+pool+'/instances').toURL().getText())
	
					
					//verifica cada instancia
					instances.each { instance ->
						
						//obtiene la info
						//def instMetadata = json.parseText(('http://api.melicloud.com/compute/instances/'+instance).toURL().getText())
						def instMetadata = json.parseText(('http://api.melicloud.com/monitoring/instances/'+instance).toURL().getText())
																						
						//si no está en on_duty, la voy guardando
						if (instMetadata.metrics.state[0]!="on_duty") {
							println "instance: "+instance+" , state: "+instMetadata.metrics.state+" , health: "+instMetadata.metrics.value.status+" , description: "+instMetadata.metrics.value.description
							badIntances << [instMetadata.pool_id,instance, instMetadata.metrics.state]
						} else {
							//si no está en on_duty, la voy guardando
							if (instMetadata.metrics.value.status[0]>=100) {
								println "instance: "+instance+" , state: "+instMetadata.metrics.state+" , health: "+instMetadata.metrics.value.status+" , description: "+instMetadata.metrics.value.description
								errorIntances << [instMetadata.pool_id,instance, instMetadata.metrics.value.status, instMetadata.metrics.value.description]
							}
							//si no está en on_duty, la voy guardando
							if (instMetadata.metrics.value.status[0]>0 && instMetadata.metrics.value.status[0]<100) {
								println "instance: "+instance+" , state: "+instMetadata.metrics.state+" , health: "+instMetadata.metrics.value.status+" , description: "+instMetadata.metrics.value.description
								warningInstances << [instMetadata.pool_id,instance, instMetadata.metrics.value.status, instMetadata.metrics.value.description]
							}
						}
					}
						
				}
			}
		}
	
	}
}
