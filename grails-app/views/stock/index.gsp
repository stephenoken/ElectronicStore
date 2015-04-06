
<%@ page import="com.store.Stock" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stock.label', default: 'Stock')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-stock" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="index" controller="master" params="[cntlr:'stock',function:'create']"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-stock" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'stock.title.label', default: 'Title')}" />
					
						<th><g:message code="stock.category.label" default="Category" /></th>
					
						<th><g:message code="stock.manufacturer.label" default="Manufacturer" /></th>
					
						<g:sortableColumn property="price" title="${message(code: 'stock.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="stockLevel" title="${message(code: 'stock.stockLevel.label', default: 'Stock Level')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${stockInstanceList}" status="i" var="stockInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>
							<g:link action="index" controller="master" params="[cntlr:'stock',function:'show',instanceId:stockInstance.id]">
								${fieldValue(bean: stockInstance, field: "title")}
							</g:link>
						</td>
					
						<td>${fieldValue(bean: stockInstance, field: "category")}</td>
					
						<td>${fieldValue(bean: stockInstance, field: "manufacturer")}</td>
					
						<td>${fieldValue(bean: stockInstance, field: "price")}</td>
					
						<td>${fieldValue(bean: stockInstance, field: "stockLevel")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${stockInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
