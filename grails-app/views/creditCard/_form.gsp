<%@ page import="com.store.CreditCard" %>



<div class="fieldcontain ${hasErrors(bean: creditCardInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="creditCard.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${creditCardInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: creditCardInstance, field: 'cardExpDate', 'error')} required">
	<label for="cardExpDate">
		<g:message code="creditCard.cardExpDate.label" default="Card Exp Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cardExpDate" required="" value="${creditCardInstance?.cardExpDate}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: creditCardInstance, field: 'cardNumber', 'error')} required">
	<label for="cardNumber">
		<g:message code="creditCard.cardNumber.label" default="Card Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cardNumber" required="" value="${creditCardInstance?.cardNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: creditCardInstance, field: 'cardType', 'error')} required">
	<label for="cardType">
		<g:message code="creditCard.cardType.label" default="Card Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cardType" required="" value="${creditCardInstance?.cardType}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: creditCardInstance, field: 'county', 'error')} required">
	<label for="county">
		<g:message code="creditCard.county.label" default="County" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="county" required="" value="${creditCardInstance?.county}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: creditCardInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="creditCard.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${creditCardInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: creditCardInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="creditCard.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${creditCardInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: creditCardInstance, field: 'town', 'error')} required">
	<label for="town">
		<g:message code="creditCard.town.label" default="Town" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="town" required="" value="${creditCardInstance?.town}"/>

</div>


