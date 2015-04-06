<%@ page import="com.store.Stock" %>



<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="stock.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${stockInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="stock.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${com.store.Category.list()}" optionKey="id" required="" value="${stockInstance?.category?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'images', 'error')} ">
	<label for="images">
		<g:message code="stock.images.label" default="Images" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${stockInstance?.images?}" var="i">
    <li><g:link controller="stockImage" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="stockImage" action="create" params="['stock.id': stockInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'stockImage.label', default: 'StockImage')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'manufacturer', 'error')} required">
	<label for="manufacturer">
		<g:message code="stock.manufacturer.label" default="Manufacturer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="manufacturer" name="manufacturer.id" from="${com.store.Manufacturer.list()}" optionKey="id" required="" value="${stockInstance?.manufacturer?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="stock.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: stockInstance, field: 'price')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'purchases', 'error')} ">
	<label for="purchases">
		<g:message code="stock.purchases.label" default="Purchases" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${stockInstance?.purchases?}" var="p">
    <li><g:link controller="cartItem" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="cartItem" action="create" params="['stock.id': stockInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'cartItem.label', default: 'CartItem')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'reviews', 'error')} ">
	<label for="reviews">
		<g:message code="stock.reviews.label" default="Reviews" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${stockInstance?.reviews?}" var="r">
    <li><g:link controller="review" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="review" action="create" params="['stock.id': stockInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'review.label', default: 'Review')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'stockLevel', 'error')} required">
	<label for="stockLevel">
		<g:message code="stock.stockLevel.label" default="Stock Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="stockLevel" type="number" value="${ stockInstance.stockLevel}" required=""/>

</div>

