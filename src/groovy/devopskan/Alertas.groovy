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
	'Users',
	'Pictures']

	def json = new JsonSlurper()
	
	//exluir los pooles con estas palabras
	def excluir = ['applications-monitoring','categories-structure','categories-ItemsMigrationRules','categories-opportunities','categories-keyword_ranking',
		'emails-email_addresses_api','mms','nginxtrafficreferer','jenkins','sincro','orders-notifications','null','-atl','test','feedback','history_api','frontend','shipping','payments','seo_dashboard','attributes','merka','myml','fend']		
	def url = 'http://api.melicloud.com/compute/pools?dept='
	def urlPool = 'http://api.melicloud.com/compute/pools/'

	def badIntances = []
	def errorIntances = []
	def warningInstances = []
	def nocCero = []
	def errorServers = []
		
	def hoy = new Date()
	def run(args) {
		
		deptos.each { depto ->
			processDepto(depto)
		}
				  
		return [badIntances, errorIntances, warningInstances,nocCero] 
			
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
	
				//obtiene la metadata
				def poolMetadata = json.parseText(('http://api.melicloud.com/compute/pools/'+pool).toURL().getText())
			
			
				//verifica si es un webserver, sino lo descarto (por ejemplo para elastic, rabbits, etc)
				//if (pool.contains('webserv')){
		
					def instances = json.parseText((urlPool+pool+'/instances').toURL().getText())
	
					//verifica si tiene NOC=1
					if (poolMetadata.noc=="0" && instances.size()>0){
						println "NO TIENE SETEADO EL NOC: "+pool
						nocCero << poolMetadata.pool_id
					} else {
										
						//verifica cada instancia
						instances.each { instance ->
							
							//obtiene la info
							//def instMetadata = json.parseText(('http://api.melicloud.com/compute/instances/'+instance).toURL().getText())
							def instMetadata
							
							try {
								instMetadata = json.parseText(('http://api.melicloud.com/monitoring/instances/'+instance).toURL().getText())
								
								//si no está en on_duty, la voy guardando
								if (instMetadata.metrics.state[0]!="on_duty") {
									println "instance: "+instance+" , state: "+instMetadata.metrics.state+" , health: "+instMetadata.metrics.value.status+" , description: "+instMetadata.metrics.value.description
																											
									def mydate = Date.parse("yyyy-MM-dd hh:mm:ss", instMetadata.metrics.last_state_change[0][0..18].replaceAll("T"," "))
									
									def diff = hoy - mydate 
																		
									badIntances << [instMetadata.pool_id,instance, instMetadata.metrics.state, diff]
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
								
							} catch (def e) {
								//instancias con error
								errorServers << [pool, instance, e.toString()]												
							}
																
						}						
					}
			}
		}
	
	}
}
