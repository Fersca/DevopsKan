
<%@ page import="devopskan.Initiative" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'initiative.label', default: 'Initiative')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'scaffold.css')}"/>
	</head>
	<body>
		<a href="#list-initiative" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-initiative" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'initiative.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'initiative.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="sponsor" title="${message(code: 'initiative.sponsor.label', default: 'Sponsor')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${initiativeInstanceList}" status="i" var="initiativeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${initiativeInstance.id}">${fieldValue(bean: initiativeInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: initiativeInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: initiativeInstance, field: "sponsor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${initiativeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
