<%@ page import="com.store.PayPal" %>



<div class="fieldcontain ${hasErrors(bean: payPalInstance, field: 'emailId', 'error')} required">
	<label for="emailId">
		<g:message code="payPal.emailId.label" default="Email Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="emailId" required="" value="${payPalInstance?.emailId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: payPalInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="payPal.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${payPalInstance?.password}"/>

</div>

