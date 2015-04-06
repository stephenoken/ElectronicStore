
<%@ page import="com.store.Category" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-category" class="well bs-component col-md-10 col-md-offset-1 " role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-hover ">
			<thead>
					<tr>
					
						<g:sortableColumn property="categoryName" title="${message(code: 'category.categoryName.label', default: 'Category Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${categoryInstanceList}" status="i" var="categoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					${categoryInstance }
						<td>
							<g:link action="index" controller="master" params="[cntlr:'category',function:'show',instanceId:categoryInstance]">
								${fieldValue(bean: categoryInstance, field: "categoryName")}
							</g:link>
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${categoryInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
