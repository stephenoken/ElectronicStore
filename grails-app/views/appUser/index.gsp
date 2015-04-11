
<%@ page import="com.store.AppUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'appUser.label', default: 'AppUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-appUser" class="well bs-component col-md-10 col-md-offset-1 " role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table  class="table table-striped table-hover ">
			<thead>
					<tr>
					
						<g:sortableColumn property="fullName" title="${message(code: 'appUser.fullName.label', default: 'Full Name')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'appUser.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'appUser.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="role" title="${message(code: 'appUser.role.label', default: 'Role')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${appUserInstanceList}" status="i" var="appUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${appUserInstance.id}">${fieldValue(bean: appUserInstance, field: "fullName")}</g:link></td>
					
						<td>${fieldValue(bean: appUserInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: appUserInstance, field: "password")}</td>
					
						<td>${fieldValue(bean: appUserInstance, field: "role")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${appUserInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
