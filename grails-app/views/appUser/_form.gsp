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

<g:if test="${session.user?.role?.equals("ROLE_ADMIN") }">
<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="appUser.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="role" from="${appUserInstance.constraints.role.inList}" required="" value="${appUserInstance?.role}" valueMessagePrefix="appUser.role"/>

</div>
</g:if>
