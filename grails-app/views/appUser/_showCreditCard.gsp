<div id="show-creditCard" class="well bs-component col-md-4 col-md-offset-1" role="main">
			<h1>Credit Card</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ul class="property-list creditCard">
			
				<g:if test="${creditCardInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="creditCard.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${creditCardInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${creditCardInstance?.cardExpDate}">
				<li class="fieldcontain">
					<span id="cardExpDate-label" class="property-label"><g:message code="creditCard.cardExpDate.label" default="Card Exp Date" /></span>
					
						<span class="property-value" aria-labelledby="cardExpDate-label"><g:fieldValue bean="${creditCardInstance}" field="cardExpDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${creditCardInstance?.cardNumber}">
				<li class="fieldcontain">
					<span id="cardNumber-label" class="property-label"><g:message code="creditCard.cardNumber.label" default="Card Number" /></span>
					
						<span class="property-value" aria-labelledby="cardNumber-label"><g:fieldValue bean="${creditCardInstance}" field="cardNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${creditCardInstance?.cardType}">
				<li class="fieldcontain">
					<span id="cardType-label" class="property-label"><g:message code="creditCard.cardType.label" default="Card Type" /></span>
					
						<span class="property-value" aria-labelledby="cardType-label"><g:fieldValue bean="${creditCardInstance}" field="cardType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${creditCardInstance?.county}">
				<li class="fieldcontain">
					<span id="county-label" class="property-label"><g:message code="creditCard.county.label" default="County" /></span>
					
						<span class="property-value" aria-labelledby="county-label"><g:fieldValue bean="${creditCardInstance}" field="county"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${creditCardInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="creditCard.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${creditCardInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${creditCardInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="creditCard.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${creditCardInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${creditCardInstance?.town}">
				<li class="fieldcontain">
					<span id="town-label" class="property-label"><g:message code="creditCard.town.label" default="Town" /></span>
					
						<span class="property-value" aria-labelledby="town-label"><g:fieldValue bean="${creditCardInstance}" field="town"/></span>
					
				</li>
				</g:if>
			
			</ul>
			<g:form url="[resource:creditCardInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>