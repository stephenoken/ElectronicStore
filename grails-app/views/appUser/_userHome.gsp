<div class="row">	
		<g:if test="${ userInstance?.shoppingCarts}"> 
			<g:render template="showCart"></g:render>
		</g:if>
		<g:else>
			<div class="row col-md-4 col-md-offset-1">
				<div class="well bs-component col-md-12">
					<h1>New Shopping Cart</h1>
					<g:form action="create" controller="shoppingCart" >
						<fieldset class="form">
							<g:render template="/shoppingCart/form"/>
						</fieldset>
						<fieldset class="buttons">
							<g:submitButton name="create" class="btn btn-warning" value="${message(code: 'default.button.create.label', default: 'Create')}" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</g:else>
		<div class="col-md-4 col-md-offset-1">
			<g:if test="${userInstance?.creditCards }"> 
				<g:render template="showCreditCard"></g:render>
			</g:if>
			<g:else>
			<%--<g:if test="${userInstance.creditCards}">Hello</g:if>--%>
				<div class="well bs-component col-md-12">
					<g:form action="create" controller="creditCard" >
						<fieldset class="form">
							<h1>Add Credit Card Details</h1>
							<g:render template="/creditCard/form"/>
						</fieldset>
						<fieldset class="buttons">
							<g:submitButton name="create" class="btn btn-warning" value="${message(code: 'default.button.create.label', default: 'Create')}" />
						</fieldset>
					</g:form>
				</div>
			</g:else>
			<g:if test="${userInstance?.paypalAccounts }">
				<g:render template="showPayPal"></g:render>
			</g:if>
			<g:else>
				<div class="well bs-component col-md-12">
					<g:form action="create" controller="payPal" >
						<fieldset class="form">
							<h1>Add PayPal Details</h1>
							<g:render template="/payPal/form"/>
						</fieldset>
						<fieldset class="buttons">
							<g:submitButton name="create" class="btn btn-warning" value="${message(code: 'default.button.create.label', default: 'Create')}" />
						</fieldset>
					</g:form>
				</div>
			</g:else>
		</div>
	</div>