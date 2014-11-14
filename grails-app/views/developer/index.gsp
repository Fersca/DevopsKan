
<%@ page import="devopskan.Developer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'developer.label', default: 'Developer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'scaffold.css')}"/>
	</head>
	<body>
		<a href="#list-developer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-developer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="password" title="${message(code: 'developer.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="mail" title="${message(code: 'developer.mail.label', default: 'Mail')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'developer.name.label', default: 'Name')}" />
					
						<th><g:message code="developer.role.label" default="Role" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${developerInstanceList}" status="i" var="developerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${developerInstance.id}">${fieldValue(bean: developerInstance, field: "password")}</g:link></td>
					
						<td>${fieldValue(bean: developerInstance, field: "mail")}</td>
					
						<td>${fieldValue(bean: developerInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: developerInstance, field: "role")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${developerInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
