
<%@ page import="com.store.AppUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'appUser.label', default: 'AppUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-appUser" class="row well bs-component col-md-6 col-md-offset-3" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list appUser">
			
				<g:if test="${appUserInstance?.fullName}">
				<li class="fieldcontain">
					<span id="fullName-label" class="property-label"><g:message code="appUser.fullName.label" default="Full Name" /></span>
					
						<span class="property-value" aria-labelledby="fullName-label"><g:fieldValue bean="${appUserInstance}" field="fullName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${appUserInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="appUser.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${appUserInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${appUserInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="appUser.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${appUserInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${appUserInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="appUser.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:fieldValue bean="${appUserInstance}" field="role"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${appUserInstance?.shoppingCarts}">
				<legend>Purchase History</legend>
				<table class="table table-striped table-hover">
					<g:each in="${ appUserInstance?.shoppingCarts[0].items}">
					<g:if test="${it.hasBought }">
						<tr>
							<td>${it.stock }</td>
						</tr>
					</g:if>
					</g:each>
				</table>
				</g:if>
			
			</ol>
			<g:form url="[resource:appUserInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-info" action="edit" resource="${appUserInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
