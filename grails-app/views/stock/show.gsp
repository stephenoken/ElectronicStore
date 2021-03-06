
<%@ page import="com.store.Stock" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stock.label', default: 'Stock')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:if test="${flash.message }">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-info ">
					<div class="panel-heading">
				        <h3 class="panel-title">Notification</h3>
				    </div>
				    <div class="panel-body">
				        ${flash.message }
				    </div>
				</div>
			</div>
		</div>
		</g:if>	
		<div id="show-stock" class="row well bs-component col-md-6 col-md-offset-3" role="main">
			<h1><g:fieldValue bean="${stockInstance}" field="title"/></h1>
			<ol class="property-list stock">
			
				<g:if test="${stockInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="stock.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link class="create" action="index" controller="master" params="[cntlr:'category',function:'show',instanceId:stockInstance.category]">${stockInstance?.category?.encodeAsHTML()}</g:link></span>
					
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
				<g:if test="${stockInstance.associatedImage }">
				<li>
					<img src="${resource(dir:'associatedImages', file: stockInstance.id + '.png')}" />
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
				<g:if test="${stockInstance?.discount }">
					<li class="fieldcontain">
						<span id="discount-label" class="property-label"><g:message code="stock.discount.label" default="Discount" /></span>
					
						<span class="property-value" aria-labelledby="discount-label"><g:fieldValue bean="${stockInstance}" field="discount"/></span>
					
					</li>
				</g:if>
			
			</ol>
			<g:if test="${session.user?.role.equals("ROLE_USER") }">
			<g:link class="btn btn-warning" controller="stock" action="addToBasket" id="${stockInstance.id }">Add to Basket</g:link>
			</g:if>
			<g:if test="${session.user?.role.equals("ROLE_ADMIN") }">
			<g:form url="[resource:stockInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link action="edit" id="${stockInstance.id }" class="btn btn-info">
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					
					<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			</g:if>
		</div>
		<g:if test="${stockInstance?.reviews}">
			<div class="row well bs-component col-md-6 col-md-offset-3">
				<h1>Reviews</h1>					
				<g:each in="${reviewInstanceList}" var="r">
					<div class="well bs-component col-md-12">
						<blockquote class="pull-right">
							<p>${r.review }</p>
							<small>Review by <cite title="Source Title">${r.author }</cite></small> 
							Score <cite title="Source Title">${r.rating }/5</cite>
						</blockquote>
						<div class="btn-group-vertical">
							<g:if test="${session.user?.role.equals("ROLE_USER")}">
							<g:link class="pulled-left btn btn-info" action="edit" controller="review" id="${r.id }">Edit</g:link>
							<g:form controller="review" action="delete" id="${r.id }" method="DELETE">
								<g:hiddenField name="stockId" value="${ stockInstance.id}"/>
								<g:actionSubmit class="pulled-left btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
							</g:form>
							</g:if>
						</div>
						<%--<span class="property-value" aria-labelledby="reviews-label"><g:link controller="review" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>--%>
					</div>
				</g:each>
			</div>
		</g:if>
		<g:render template="createReview"></g:render>
	</body>
</html>
