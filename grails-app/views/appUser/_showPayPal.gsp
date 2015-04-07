<div id="show-payPal" class="well bs-component col-md-12" role="main">
			<h1>PayPal</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list payPal">
			
				<g:if test="${payPalInstance?.emailId}">
				<li class="fieldcontain">
					<span id="emailId-label" class="property-label"><g:message code="payPal.emailId.label" default="Email Id" /></span>
					
						<span class="property-value" aria-labelledby="emailId-label"><g:fieldValue bean="${payPalInstance}" field="emailId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${payPalInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="payPal.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${payPalInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:payPalInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>