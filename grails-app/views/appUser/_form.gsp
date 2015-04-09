<%@ page import="com.store.AppUser" %>



<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'fullName', 'error')} required">
	<label for="fullName">
		<g:message code="appUser.fullName.label" default="Full Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fullName" required="" value="${appUserInstance?.fullName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="appUser.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${appUserInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="appUser.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${appUserInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="appUser.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="role" from="${appUserInstance.constraints.role.inList}" required="" value="${appUserInstance?.role}" valueMessagePrefix="appUser.role"/>

</div>

<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'creditCards', 'error')} ">
	<label for="creditCards">
		<g:message code="appUser.creditCards.label" default="Credit Cards" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${appUserInstance?.creditCards?}" var="c">
    <li><g:link controller="creditCard" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="creditCard" action="create" params="['appUser.id': appUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'creditCard.label', default: 'CreditCard')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'paypalAccounts', 'error')} ">
	<label for="paypalAccounts">
		<g:message code="appUser.paypalAccounts.label" default="Paypal Accounts" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${appUserInstance?.paypalAccounts?}" var="p">
    <li><g:link controller="payPal" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="payPal" action="create" params="['appUser.id': appUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'payPal.label', default: 'PayPal')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'shoppingCarts', 'error')} ">
	<label for="shoppingCarts">
		<g:message code="appUser.shoppingCarts.label" default="Shopping Carts" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${appUserInstance?.shoppingCarts?}" var="s">
    <li><g:link controller="shoppingCart" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="shoppingCart" action="create" params="['appUser.id': appUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'shoppingCart.label', default: 'ShoppingCart')])}</g:link>
</li>
</ul>


</div>

