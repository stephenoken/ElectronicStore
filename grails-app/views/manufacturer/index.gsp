
<%@ page import="com.store.Manufacturer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'manufacturer.label', default: 'Manufacturer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-manufacturer" class="well bs-component col-md-10 col-md-offset-1 " role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-hover ">
			<thead>
					<tr>
					
						<g:sortableColumn property="manufacturerName" title="${message(code: 'manufacturer.manufacturerName.label', default: 'Manufacturer Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${manufacturerInstanceList}" status="i" var="manufacturerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${manufacturerInstance.id}">${fieldValue(bean: manufacturerInstance, field: "manufacturerName")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${manufacturerInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
