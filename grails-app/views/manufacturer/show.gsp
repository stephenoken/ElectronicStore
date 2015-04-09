
<%@ page import="com.store.Manufacturer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'manufacturer.label', default: 'Manufacturer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-manufacturer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-manufacturer" class="content scaffold-show" role="main">
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
				<li class="fieldcontain">
					<span id="stocks-label" class="property-label"><g:message code="manufacturer.stocks.label" default="Stocks" /></span>
					
						<g:each in="${manufacturerInstance.stocks}" var="s">
						<span class="property-value" aria-labelledby="stocks-label"><g:link controller="stock" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:manufacturerInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${manufacturerInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
