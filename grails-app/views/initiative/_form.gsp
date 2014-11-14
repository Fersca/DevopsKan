<%@ page import="devopskan.Initiative" %>



<div class="fieldcontain ${hasErrors(bean: initiativeInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="initiative.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" required="" value="${initiativeInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: initiativeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="initiative.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${initiativeInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: initiativeInstance, field: 'sponsor', 'error')} required">
	<label for="sponsor">
		<g:message code="initiative.sponsor.label" default="Sponsor" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sponsor" required="" value="${initiativeInstance?.sponsor}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: initiativeInstance, field: 'tasks', 'error')} ">
	<label for="tasks">
		<g:message code="initiative.tasks.label" default="Tasks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${initiativeInstance?.tasks?}" var="t">
    <li><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="task" action="create" params="['initiative.id': initiativeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'task.label', default: 'Task')])}</g:link>
</li>
</ul>


</div>

