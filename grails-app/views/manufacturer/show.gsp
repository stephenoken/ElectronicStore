
<%@ page import="com.store.Manufacturer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'manufacturer.label', default: 'Manufacturer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-manufacturer" class="well bs-component col-md-6 col-md-offset-3" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list manufacturer">
			
				<g:if test="${manufacturerInstance?.manufacturerName}">
				<li class="fieldcontain">
					<span id="manufacturerName-label" class="property-label"><g:message code="manufacturer.manufacturerName.label" default="Manufacturer Name" /></span>
					
						<span class="property-value" aria-labelledby="manufacturerName-label"><g:fieldValue bean="${manufacturerInstance}" field="manufacturerName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${manufacturerInstance?.stocks}">
					<table class="table table-striped table-hover ">
					<tr>
					<g:message code="manufacturer.stocks.label" default="Stocks" />
					</tr>
					
						<g:each in="${manufacturerInstance.stocks}" var="s">
						<tr>
						<td><g:link controller="stock" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></td>
						</tr>
						</g:each>
					
					</table>
				</g:if>
			
			</ol>
			<g:form url="[resource:manufacturerInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-warning" action="edit" resource="${manufacturerInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
