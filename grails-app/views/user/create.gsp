<%@ page import="ro.isi.auth.User" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
	<title><g:message code="default.create.label" args="[entityName]" default="Create ${entityName}" /></title>
</head>

<body>

<section id="create-user" class="first">

	<g:hasErrors bean="${userInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${userInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<div class="form-actions">
			<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            <button class="btn" type="reset">${message(code: 'default.button.cancel.label', default: 'Cancel')}</button>
		</div>
	</g:form>
	
</section>
		
</body>

</html>
