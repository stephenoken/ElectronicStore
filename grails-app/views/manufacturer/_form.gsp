<%@ page import="com.store.Manufacturer" %>



<div class="fieldcontain ${hasErrors(bean: manufacturerInstance, field: 'manufacturerName', 'error')} required">
	<label for="manufacturerName">
		<g:message code="manufacturer.manufacturerName.label" default="Manufacturer Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="manufacturerName" required="" value="${manufacturerInstance?.manufacturerName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: manufacturerInstance, field: 'stocks', 'error')} ">
	<label for="stocks">
		<g:message code="manufacturer.stocks.label" default="Stocks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${manufacturerInstance?.stocks?}" var="s">
    <li><g:link controller="stock" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="stock" action="create" params="['manufacturer.id': manufacturerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'stock.label', default: 'Stock')])}</g:link>
</li>
</ul>


</div>

