<%@ page import="devopskan.Backlog" %>



<div class="fieldcontain ${hasErrors(bean: backlogInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="backlog.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${backlogInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: backlogInstance, field: 'developers', 'error')} ">
	<label for="developers">
		<g:message code="backlog.developers.label" default="Developers" />
		
	</label>
	<g:select name="developers" from="${devopskan.Developer.list()}" multiple="multiple" optionKey="id" size="5" value="${backlogInstance?.developers*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: backlogInstance, field: 'modules', 'error')} ">
	<label for="modules">
		<g:message code="backlog.modules.label" default="Modules" />
		
	</label>
	<g:select name="modules" from="${devopskan.Module.list()}" multiple="multiple" optionKey="id" size="5" value="${backlogInstance?.modules*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: backlogInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="backlog.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${backlogInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: backlogInstance, field: 'tasks', 'error')} ">
	<label for="tasks">
		<g:message code="backlog.tasks.label" default="Tasks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${backlogInstance?.tasks?}" var="t">
    <li><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="task" action="create" params="['backlog.id': backlogInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'task.label', default: 'Task')])}</g:link>
</li>
</ul>


</div>

