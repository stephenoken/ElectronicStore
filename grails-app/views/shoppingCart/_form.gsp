<%@ page import="com.store.ShoppingCart" %>



<div class="fieldcontain ${hasErrors(bean: shoppingCartInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="shoppingCart.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${shoppingCartInstance?.address}"/>

</div>
