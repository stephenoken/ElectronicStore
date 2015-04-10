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
	<g:field name="price" value="${fieldValue(bean: stockInstance, field: 'price')}" type="number" required=""/>

</div>



<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'stockLevel', 'error')} required">
	<label for="stockLevel">
		<g:message code="stock.stockLevel.label" default="Stock Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="stockLevel" type="number" value="${fieldValue(bean: stockInstance, field: 'stockLevel')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'discount', 'error')} required">
	<label for="stockLevel">
		<g:message code="stock.discount.label" default="Discount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="discount" type="number" value="${fieldValue(bean: stockInstance, field: 'discount')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'associatedImage', 'error')} required">
	<label for="associatedImage">
		<g:message code="stock.associatedImage.label" default="Associated Image" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="imageFile" type="file" value="${fieldValue(bean: stockInstance, field: 'associatedImage')}" required="" accept="image/*"/>
</div>

