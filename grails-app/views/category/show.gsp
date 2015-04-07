
<%@ page import="com.store.Category" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-category" class="well bs-component col-md-6 col-md-offset-3" role="main">
			<h1>${categoryInstance}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list category">
			
				<g:if test="${categoryInstance?.stocks}">
					<table class="table table-striped table-hover ">
						<tr>
							<th><g:message code="category.stocks.label" default="Stocks" /></span></th>
						</tr>
						<g:each in="${categoryInstance.stocks}" var="s">
						<tr>
							<td>
							<g:link action="index" controller="master" params="[cntlr:'stock',function:'show',instanceId:s.id]">
								${s?.encodeAsHTML()}
							</g:link>
							</td>
						</tr>
						</g:each>
					</table>
				</g:if>
			
			</ol>
			<g:form url="[resource:categoryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<%--<g:link class="btn btn-info" controller="master" params="[cntlr:'category',function:'edit',instanceId:categoryInstance]"><g:message code="default.button.edit.label" default="Edit" /></g:link>--%>
					<g:link class="btn btn-info" action="edit" id="${categoryInstance.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
