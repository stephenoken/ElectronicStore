<div id="create-review" class="row well bs-component col-md-6 col-md-offset-3" role="main">
			<h1>Post a Review</h1>
			<g:hasErrors bean="${reviewInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${reviewInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:reviewInstance, action:'save',controller:'review',params:[stock:stockInstance?.id,author:session.user?.id]]" >
				<fieldset class="form">
					<g:render template="../review/form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="btn btn-warning" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
