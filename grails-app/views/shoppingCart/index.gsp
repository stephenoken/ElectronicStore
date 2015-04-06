
<%@ page import="com.store.ShoppingCart" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shoppingCart.label', default: 'ShoppingCart')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-shoppingCart" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-shoppingCart" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="address" title="${message(code: 'shoppingCart.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="totalPrice" title="${message(code: 'shoppingCart.totalPrice.label', default: 'Total Price')}" />
					
						<th><g:message code="shoppingCart.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${shoppingCartInstanceList}" status="i" var="shoppingCartInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${shoppingCartInstance.id}">${fieldValue(bean: shoppingCartInstance, field: "address")}</g:link></td>
					
						<td>${fieldValue(bean: shoppingCartInstance, field: "totalPrice")}</td>
					
						<td>${fieldValue(bean: shoppingCartInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${shoppingCartInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
