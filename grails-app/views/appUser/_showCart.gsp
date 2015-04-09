<div class="row col-md-4 col-md-offset-1">
	<div id="show-shoppingCart" class=" well bs-component col-md-12" role="main">
		<h1>Shopping Cart Details</h1>
		<ul class="property-list shoppingCart">
		
			<g:if test="${shoppingCartInstance?.address}">
			<li class="fieldcontain">
				<span id="address-label" class="property-label"><g:message code="shoppingCart.address.label" default="Address" /></span>
				
					<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${shoppingCartInstance}" field="address"/></span>
				
			</li>
			</g:if>
		
			<g:if test="${shoppingCartInstance?.items}">
			<table class="table col-md-12">
				<tr>
					<th>Item</th>
					<th>Price</th>
				</tr>
			<g:each in="${shoppingCartInstance.items}" var="i">
				<g:if test="${i.hasBought == false }">
					<tr>
						<td>
							<g:link controller="stock" action="show" id="${i.stock.id}">${i?.stock.encodeAsHTML()}</g:link>
				<%--<span class="property-value" aria-labelledby="items-label"><g:link controller="cartItem" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>--%>
						</td>
						<td>
							${i?.itemPrice }
						<td>
					</tr>
				</g:if>
			</g:each>
			</table>	
			
			</g:if>
			<g:else>
				Your basket is empty
			</g:else>
			<g:if test="${shoppingCartInstance?.totalPrice}">
				<span id="totalPrice-label" class="property-label"><g:message code="shoppingCart.totalPrice.label" default="Total Price" /></span>
				
					<span class="property-value" aria-labelledby="totalPrice-label"><g:fieldValue bean="${shoppingCartInstance}" field="totalPrice"/></span>
				
			</g:if>
			<g:else>
				<span id="totalPrice-label" class="property-label"><g:message code="shoppingCart.totalPrice.label" default="Total Price" /></span>
				
					<span class="property-value" aria-labelledby="totalPrice-label">0.0</span>
			</g:else>
			
		</ul>
		<g:form url="[resource:shoppingCartInstance, action:'delete']" method="DELETE">
			<fieldset class="buttons">
				<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				<g:link class="btn btn-warning" contoller="appUser" action="purchases" params="[paymentType:'creditCard']">Buy CC</g:link>
				<g:link class="btn btn-warning" contoller="appUser" action="purchases" params="[paymentType:'payPal']">Buy PP</g:link>
			</fieldset>
		</g:form>
	</div>
	<div class="well col-md-12">
		<h1>Shopping Cart History</h1>
         <div class="list-group">
             <g:each in="${shoppingCartInstance.items}" var="i">
             	<g:if test="${i.hasBought }">
             		<div class="list-group-item">
             		<g:link controller="stock" action="show" id="${i.stock.id}">${i?.stock.encodeAsHTML()}</g:link>
             		</div>
             	</g:if>
            </g:each>
        </div>
	</div>
</div>