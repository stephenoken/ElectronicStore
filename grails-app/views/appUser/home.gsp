<html>
<head>
	<meta name='layout' content='main'/>
	<title>${userInstance } | Dashboard</title>
</head>

<body>
	<g:if test="${flash.message }">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-info ">
					<div class="panel-heading">
				        <h3 class="panel-title">Notification</h3>
				    </div>
				    <div class="panel-body">
				        ${flash.message }
				    </div>
				</div>
			</div>
		</div>
	</g:if>
	<g:if test="${userInstance.role.equals("ROLE_USER") }">
	<g:render template="userHome"></g:render>
	</g:if>
	<g:if test="${userInstance.role.equals("ROLE_ADMIN") }">
	<g:render template="adminHome"/>
	</g:if>
</body>
</html>