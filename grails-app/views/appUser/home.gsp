<html>
<head>
	<meta name='layout' content='main'/>
	<title>Login</title>
</head>

<body>
	<h1> Hello ${userInsatnce }</h1>
	<button class="btn btn-primary">Test</button>
	<div class="well bs-component col-md-5 col-md-offset-1">
		<g:form url="[resource:shoppingCartInstance, action:'save',controller:'shoppingCart']" controller="shoppingCart" >
			<fieldset class="form">
				<g:render template="/shoppingCart/form"/>
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="create" class="btn btn-warning" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>