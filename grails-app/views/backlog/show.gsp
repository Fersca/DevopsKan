
<%@ page import="devopskan.Backlog" %>
<%@ page import="devopskan.TaskStatus" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'backlog.label', default: 'Backlog')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'scaffold.css')}"/>
	</head>
	<body>
		<a href="#show-backlog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-backlog" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list backlog">
			
				<g:if test="${backlogInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="backlog.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${backlogInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${backlogInstance?.developers}">
				<li class="fieldcontain">
					<span id="developers-label" class="property-label"><g:message code="backlog.developers.label" default="Developers" /></span>
					
						<g:each in="${backlogInstance.developers}" var="d">
						<span class="property-value" aria-labelledby="developers-label"><g:link controller="developer" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${backlogInstance?.modules}">
				<li class="fieldcontain">
					<span id="modules-label" class="property-label"><g:message code="backlog.modules.label" default="Modules" /></span>
					
						<g:each in="${backlogInstance.modules}" var="m">
						<span class="property-value" aria-labelledby="modules-label"><g:link controller="module" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${backlogInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="backlog.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${backlogInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<br>
				<g:if test="${backlogInstance?.tasks}">			
				<table>
				<thead>
						<tr>
						
							<g:sortableColumn property="id" title="${message(code: 'developer.password.label', default: 'Id')}" />
						
							<g:sortableColumn property="title" title="${message(code: 'developer.mail.label', default: 'Title')}" />
						
							<g:sortableColumn property="status" title="${message(code: 'developer.name.label', default: 'Status')}" />
							
							<th><g:message code="developer.role.label" default="Action" /></th>
							
							<g:sortableColumn property="backlogPriority" title="${message(code: 'developer.name.label', default: 'Back Priority')}" />
							
							<th><g:message code="developer.role.label" default="Action" /></th>
							
							<g:sortableColumn property="developer" title="${message(code: 'developer.name.label', default: 'Developer')}" />
						
							<th><g:message code="developer.role.label" default="Module" /></th>
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${backlogInstance.tasks.sort {it.backlogPriority}}" status="i" var="taskInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link controller="task" action="show" id="${taskInstance.id}">${fieldValue(bean: taskInstance, field: "id")}</g:link></td>
						
							<td>${fieldValue(bean: taskInstance, field: "title")}</td>
							
							<td>${fieldValue(bean: taskInstance, field: "status")}</td>
							
							<td>
								<g:each in="${TaskStatus.list()}" status="x" var="statusInstance">
									<g:link controller="taskStatus" action="changeStatus" id="${taskInstance.id}" params="[to: statusInstance.id, from: 'backlog']">${fieldValue(bean: statusInstance, field: "name")}</g:link>
								</g:each>
							</td>
							
							<td>${fieldValue(bean: taskInstance, field: "backlogPriority")}</td>
							
							<td><g:link controller="task" action="increaseBackPriority" id="${taskInstance.id}">Subir</g:link> | <g:link controller="task" action="decreaseBackPriority" id="${taskInstance.id}">Bajar</g:link></td>							
						
							<td>${fieldValue(bean: taskInstance, field: "developer")}</td>
							
							<td>${fieldValue(bean: taskInstance, field: "module")}</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
				</g:if>
			
			</ol>
			<g:form url="[resource:backlogInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${backlogInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
