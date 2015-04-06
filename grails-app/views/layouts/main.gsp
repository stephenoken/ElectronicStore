<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body>
		<div class="bs-component">
			<nav id="Tournament-Builder_Nav" class="navbar navbar-warning navbar-fixed-top" role="navigation">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbarCollapse"> 
							<span class="sr-only">Toggle Navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						
						<g:link controller="home" class="navbar-brand">
							Electronics Store
						</g:link>
					</div>
					<div id="navbarCollapse" class="collapse navbar-collapse">
						<ul class="nav navbar-nav">
							<li>
								<a data-toggle="dropdown" class="dropdown-toggle" href="#">
		                    		Items<b class="caret"></b>
		                     	</a>		 	
			                    <ul role="menu" class="dropdown-menu">
			                        <li>
										<a href="../stock-index=">
	                						Stock List
	                					</a>
	                				</li>
	                			</ul>
							</li>
							<li>
								<g:link controller="Tournament">
									Tournament
								</g:link>
							</li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li>
								<div class="login-control">
									<g:loginControl/>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<script type="text/javascript">
		$(document).ready(function() {
            // This command is used to initialize some elements and make them work properly
            $.material.init();
        });
		</script>
	</body>
</html>
