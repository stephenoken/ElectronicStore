<%@ page import="com.store.Category" %>



<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'categoryName', 'error')} required">
	<label for="categoryName">
		<g:message code="category.categoryName.label" default="Category Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="categoryName" required="" value="${categoryInstance?.categoryName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'stocks', 'error')} ">
	<label for="stocks">
		<g:message code="category.stocks.label" default="Stocks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${categoryInstance?.stocks?}" var="s">
    <li><g:link controller="stock" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="stock" action="create" params="['category.id': categoryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'stock.label', default: 'Stock')])}</g:link>
</li>
</ul>


</div>

