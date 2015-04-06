
<%@ page import="com.store.Stock" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stock.label', default: 'Stock')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-stock" class="row well bs-component col-md-6 col-md-offset-3" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list stock">
			
				<g:if test="${stockInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="stock.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${stockInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="stock.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link class="create" action="index" controller="master" params="[cntlr:'category',function:'show',instanceId:stockInstance.category]">${stockInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.images}">
				<li class="fieldcontain">
					<span id="images-label" class="property-label"><g:message code="stock.images.label" default="Images" /></span>
					
						<g:each in="${stockInstance.images}" var="i">
						<span class="property-value" aria-labelledby="images-label"><g:link controller="stockImage" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.manufacturer}">
				<li class="fieldcontain">
					<span id="manufacturer-label" class="property-label"><g:message code="stock.manufacturer.label" default="Manufacturer" /></span>
					
						<span class="property-value" aria-labelledby="manufacturer-label"><g:link class="create" action="index" controller="master" params="[cntlr:'manufacturer',function:'show',instanceId:stockInstance.manufacturer]">${stockInstance?.manufacturer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="stock.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label">&#8364;<g:fieldValue bean="${stockInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.purchases}">
				<li class="fieldcontain">
					<span id="purchases-label" class="property-label"><g:message code="stock.purchases.label" default="Purchases" /></span>
					
						<g:each in="${stockInstance.purchases}" var="p">
						<span class="property-value" aria-labelledby="purchases-label"><g:link controller="cartItem" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.stockLevel}">
				<li class="fieldcontain">
					<span id="stockLevel-label" class="property-label"><g:message code="stock.stockLevel.label" default="Stock Level" /></span>
					
						<span class="property-value" aria-labelledby="stockLevel-label"><g:fieldValue bean="${stockInstance}" field="stockLevel"/></span>
					
				</li>
				</g:if>
				<g:else>
					<li class="fieldcontain">
						<span id="stockLevel-label" class="property-label"><g:message code="stock.stockLevel.label" default="Stock Level" /></span>
						<span class="property-value" aria-labelledby="stockLevel-label"> Not in stock</span>
					</li>
				</g:else>
			
			</ol>
			<g:form url="[resource:stockInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link controller="master" params="[cntlr:'stock',function:'edit',instanceId:stockInstance.id]" class="btn btn-info">
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<g:link class="btn btn-warning" controller="stock" action="addToBasket" id="${stockInstance.id }">Purchase</g:link>
					<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
		<g:if test="${stockInstance?.reviews}">
			<div class="row col-md-6 col-md-offset-3">
				
				<h1>Reviews</h1>					
				<g:each in="${stockInstance.reviews}" var="r">
					<div class="row well bs-component col-md-12">
						<blockquote class="pull-right">
							<p>${r.review }</p>
							<small>Review by <cite title="Source Title">${r.author }</cite></small>
						</blockquote>
						<%--<span class="property-value" aria-labelledby="reviews-label"><g:link controller="review" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>--%>
					</div>
				</g:each>
			</div>
		</g:if>
	</body>
</html>
