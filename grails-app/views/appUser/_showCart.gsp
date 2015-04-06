<div id="show-shoppingCart" class="well bs-component col-md-4 col-md-offset-1" role="main">
			<h1>Shopping Cart Details</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ul class="property-list shoppingCart">
			
				<g:if test="${shoppingCartInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="shoppingCart.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${shoppingCartInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shoppingCartInstance?.items}">
				<li class="fieldcontain">
					<span id="items-label" class="property-label"><g:message code="shoppingCart.items.label" default="Items" /></span>
					
						<g:each in="${shoppingCartInstance.items}" var="i">
						<span class="property-value" aria-labelledby="items-label"><g:link controller="cartItem" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${shoppingCartInstance?.totalPrice}">
				<li class="fieldcontain">
					<span id="totalPrice-label" class="property-label"><g:message code="shoppingCart.totalPrice.label" default="Total Price" /></span>
					
						<span class="property-value" aria-labelledby="totalPrice-label"><g:fieldValue bean="${shoppingCartInstance}" field="totalPrice"/></span>
					
				</li>
				</g:if>
			
			</ul>
			<g:form url="[resource:shoppingCartInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>