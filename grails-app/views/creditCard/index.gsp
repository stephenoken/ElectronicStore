
<%@ page import="com.store.CreditCard" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'creditCard.label', default: 'CreditCard')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-creditCard" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-creditCard" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="address" title="${message(code: 'creditCard.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="cardExpDate" title="${message(code: 'creditCard.cardExpDate.label', default: 'Card Exp Date')}" />
					
						<g:sortableColumn property="cardNumber" title="${message(code: 'creditCard.cardNumber.label', default: 'Card Number')}" />
					
						<g:sortableColumn property="cardType" title="${message(code: 'creditCard.cardType.label', default: 'Card Type')}" />
					
						<g:sortableColumn property="county" title="${message(code: 'creditCard.county.label', default: 'County')}" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'creditCard.firstName.label', default: 'First Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${creditCardInstanceList}" status="i" var="creditCardInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${creditCardInstance.id}">${fieldValue(bean: creditCardInstance, field: "address")}</g:link></td>
					
						<td>${fieldValue(bean: creditCardInstance, field: "cardExpDate")}</td>
					
						<td>${fieldValue(bean: creditCardInstance, field: "cardNumber")}</td>
					
						<td>${fieldValue(bean: creditCardInstance, field: "cardType")}</td>
					
						<td>${fieldValue(bean: creditCardInstance, field: "county")}</td>
					
						<td>${fieldValue(bean: creditCardInstance, field: "firstName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${creditCardInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
