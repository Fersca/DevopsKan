<%@ page import="devopskan.Developer" %>



<div class="fieldcontain ${hasErrors(bean: developerInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="developer.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${developerInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: developerInstance, field: 'mail', 'error')} required">
	<label for="mail">
		<g:message code="developer.mail.label" default="Mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mail" required="" value="${developerInstance?.mail}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: developerInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="developer.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${developerInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: developerInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="developer.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="role" name="role.id" from="${devopskan.Role.list()}" optionKey="id" required="" value="${developerInstance?.role?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: developerInstance, field: 'tasks', 'error')} ">
	<label for="tasks">
		<g:message code="developer.tasks.label" default="Tasks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${developerInstance?.tasks?}" var="t">
    <li><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="task" action="create" params="['developer.id': developerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'task.label', default: 'Task')])}</g:link>
</li>
</ul>


</div>

