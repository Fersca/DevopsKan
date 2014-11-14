
<%@ page import="devopskan.Developer" %>
<%@ page import="devopskan.TaskStatus" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'developer.label', default: 'Developer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'scaffold.css')}"/>
	</head>
	<body>
		<a href="#show-developer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-developer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list developer">
			
				<g:if test="${developerInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="developer.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${developerInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${developerInstance?.mail}">
				<li class="fieldcontain">
					<span id="mail-label" class="property-label"><g:message code="developer.mail.label" default="Mail" /></span>
					
						<span class="property-value" aria-labelledby="mail-label"><g:fieldValue bean="${developerInstance}" field="mail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${developerInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="developer.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${developerInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${developerInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="developer.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:link controller="role" action="show" id="${developerInstance?.role?.id}">${developerInstance?.role?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<br>
				<g:if test="${developerInstance?.tasks}">			
				<table>
				<thead>
						<tr>
						
							<g:sortableColumn property="id" title="${message(code: 'developer.password.label', default: 'Id')}" />
						
							<g:sortableColumn property="title" title="${message(code: 'developer.mail.label', default: 'Title')}" />
						
							<g:sortableColumn property="status" title="${message(code: 'developer.name.label', default: 'Status')}" />
														
							<th><g:message code="developer.role.label" default="Action" /></th>
														
							<g:sortableColumn property="deverloperPriority" title="${message(code: 'developer.name.label', default: 'Dev Priority')}" />
							
							<th><g:message code="developer.role.label" default="Action" /></th>
							
							<g:sortableColumn property="type" title="${message(code: 'developer.name.label', default: 'Type')}" />
						
							<th><g:message code="developer.role.label" default="Module" /></th>
							
							<th><g:message code="developer.role.label" default="Estimated Date" /></th>
													
						</tr>
					</thead>
					<tbody>
					<g:each in="${developerInstance.tasks.sort {it.deverloperPriority}}" status="i" var="taskInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link controller="task" action="show" id="${taskInstance.id}">${fieldValue(bean: taskInstance, field: "id")}</g:link></td>
						
							<td>${fieldValue(bean: taskInstance, field: "title")}</td>
							
							<td>${fieldValue(bean: taskInstance, field: "status")}</td>
							
							<td>
								<g:each in="${TaskStatus.list()}" status="x" var="statusInstance">
									<g:link controller="taskStatus" action="changeStatus" id="${taskInstance.id}" params="[to: statusInstance.id, from: 'developer']">${fieldValue(bean: statusInstance, field: "name")}</g:link>
								</g:each>
							</td>
														
							<td>${fieldValue(bean: taskInstance, field: "deverloperPriority")}</td>
							
							<td><g:link controller="task" action="increasePriority" id="${taskInstance.id}">More</g:link> | <g:link controller="task" action="decreasePriority" id="${taskInstance.id}">Less</g:link></td>
						
							<td>${fieldValue(bean: taskInstance, field: "type")}</td>
							
							<td>${fieldValue(bean: taskInstance, field: "module")}</td>
							
							<td>${fieldValue(bean: taskInstance, field: "estimatedTime")}</td>
													
						</tr>
					</g:each>
					</tbody>
				</table>
				</g:if>
			
			
			
			</ol>
			<g:form url="[resource:developerInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${developerInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
