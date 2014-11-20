<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'developer.label', default: 'Alertas')}" />
		<title><g:message code="default.list.label" args="[entityName]" />Alertas</title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'scaffold.css')}"/>
	</head>
	<body>
		<div id="list-developer" class="content scaffold-list" role="main">
			<h1>Instancias que no están en On-Duty</h1>
			<table>
			<thead>
					<tr>
						<th><g:message code="developer.role.label" default="Pool" /></th>
						<th><g:message code="developer.role.label" default="Instance" /></th>
						<th><g:message code="developer.role.label" default="State" /></th>
						<th><g:message code="developer.role.label" default="Dias" /></th>										
					</tr>
				</thead>
				<tbody>
								
				<g:each in="${badIntances}" status="i" var="instance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${instance[0]}</td>					
						<td>${instance[1]}</td>
						<td>${instance[2]}</td>
						<td>${instance[3]}</td>									
					</tr>
				</g:each>
				</tbody>
			</table>
			<h1>Instancias con Error</h1>
			
			<table>
			<thead>
					<tr>
						<th><g:message code="developer.role.label" default="Pool" /></th>
						<th><g:message code="developer.role.label" default="Instance" /></th>
						<th><g:message code="developer.role.label" default="Descripción" /></th>										
					</tr>
				</thead>
				<tbody>
								
				<g:each in="${errorIntances}" status="i" var="instance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">										
						<td>${instance[0]}</td>					
						<td>${instance[1]}</td>
						<td>${instance[3]}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<h1>Instancias con Warning</h1>
			<table>
			<thead>
					<tr>
						<th><g:message code="developer.role.label" default="Pool" /></th>
						<th><g:message code="developer.role.label" default="Instance" /></th>
						<th><g:message code="developer.role.label" default="Descripción" /></th>										
					</tr>
				</thead>
				<tbody>
								
				<g:each in="${warningInstances}" status="i" var="instance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${instance[0]}</td>				
						<td>${instance[1]}</td>									
						<td>${instance[3]}</td>						
					</tr>
				</g:each>
				</tbody>
			</table>
			<h1>Pooles ccon NOC = 0</h1>
			<table>
			<thead>
					<tr>
						<th><g:message code="developer.role.label" default="Pool" /></th>
					</tr>
				</thead>
				<tbody>
								
				<g:each in="${nocCero}" status="i" var="instance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${instance}</td>				
					</tr>
				</g:each>
				</tbody>
			</table>
			<h1>Servers con Error</h1>
			<table>
			<thead>
				<tr>
					<th><g:message code="developer.role.label" default="Pool" /></th>
					<th><g:message code="developer.role.label" default="Instance" /></th>
					<th><g:message code="developer.role.label" default="Error" /></th>
				</tr>
				</thead>
				<tbody>
								
				<g:each in="${errorServers}" status="i" var="instance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${instance[0]}</td>
						<td>${instance[1]}</td>
						<td>${instance[2]}</td>				
					</tr>
				</g:each>
				</tbody>
			</table>									
												
		</div>
	</body>
</html>
