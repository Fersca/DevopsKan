
<%@ page import="devopskan.Initiative" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'initiative.label', default: 'Initiative')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'scaffold.css')}"/>
	</head>
	<body>
		<a href="#show-initiative" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-initiative" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list initiative">
			
				<g:if test="${initiativeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="initiative.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${initiativeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${initiativeInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="initiative.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${initiativeInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${initiativeInstance?.sponsor}">
				<li class="fieldcontain">
					<span id="sponsor-label" class="property-label"><g:message code="initiative.sponsor.label" default="Sponsor" /></span>
					
						<span class="property-value" aria-labelledby="sponsor-label"><g:fieldValue bean="${initiativeInstance}" field="sponsor"/></span>
					
				</li>
				</g:if>
							
				<br>
				<g:if test="${initiativeInstance?.tasks}">			
				<table>
				<thead>
						<tr>
						
							<g:sortableColumn property="id" title="${message(code: 'developer.password.label', default: 'Id')}" />
						
							<g:sortableColumn property="title" title="${message(code: 'developer.mail.label', default: 'Title')}" />
						
							<g:sortableColumn property="status" title="${message(code: 'developer.name.label', default: 'Status')}" />
							
							<g:sortableColumn property="iniciativePriority" title="${message(code: 'developer.name.label', default: 'Init Priority')}" />
							
							<th><g:message code="developer.role.label" default="Action" /></th>
							
							<g:sortableColumn property="developer" title="${message(code: 'developer.name.label', default: 'Developer')}" />
						
							<th><g:message code="developer.role.label" default="Module" /></th>
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${initiativeInstance.tasks.sort {it.iniciativePriority}}" status="i" var="taskInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link controller="task" action="show" id="${taskInstance.id}">${fieldValue(bean: taskInstance, field: "id")}</g:link></td>
						
							<td>${fieldValue(bean: taskInstance, field: "title")}</td>
							
							<td>${fieldValue(bean: taskInstance, field: "status")}</td>
							
							<td>${fieldValue(bean: taskInstance, field: "iniciativePriority")}</td>
							
							<td><g:link controller="task" action="increaseInitPriority" id="${taskInstance.id}">More</g:link> | <g:link controller="task" action="decreaseInitPriority" id="${taskInstance.id}">Less</g:link></td>						
						
							<td>${fieldValue(bean: taskInstance, field: "developer")}</td>
							
							<td>${fieldValue(bean: taskInstance, field: "module")}</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
				</g:if>
				
			
			</ol>
			<g:form url="[resource:initiativeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${initiativeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
