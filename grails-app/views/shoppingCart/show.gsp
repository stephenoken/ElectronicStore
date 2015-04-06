
<%@ page import="com.store.ShoppingCart" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shoppingCart.label', default: 'ShoppingCart')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-shoppingCart" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-shoppingCart" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list shoppingCart">
			
				<g:if test="${shoppingCartInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="shoppingCart.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${shoppingCartInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shoppingCartInstance?.items}">
				<li class="fieldcontain">
					<span id="items-label" class="property-label"><g:message code="shoppingCart.items.label" default="Items" /></span>
					
						<g:each in="${shoppingCartInstance.items}" var="i">
						<span class="property-value" aria-labelledby="items-label"><g:link controller="cartItem" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${shoppingCartInstance?.totalPrice}">
				<li class="fieldcontain">
					<span id="totalPrice-label" class="property-label"><g:message code="shoppingCart.totalPrice.label" default="Total Price" /></span>
					
						<span class="property-value" aria-labelledby="totalPrice-label"><g:fieldValue bean="${shoppingCartInstance}" field="totalPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shoppingCartInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="shoppingCart.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="appUser" action="show" id="${shoppingCartInstance?.user?.id}">${shoppingCartInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:shoppingCartInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${shoppingCartInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
