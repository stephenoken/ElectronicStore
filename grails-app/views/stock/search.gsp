<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stock.label', default: 'Stock')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-stock" class="well bs-component col-md-6 col-md-offset-3" role="main">
			<h1>Search</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:form action="execute" >
				<fieldset class="form">
					<div class="form-group">
            			<label for="inputSearch" class="col-lg-3 control-label">Search</label>
            			<div class="col-lg-9">
                			<input type="text" class="form-control" name="inputSearch" placeholder="Search...">
            			</div>
        			</div>
        			<div class="form-group">
            			<label for="searchType" class="col-lg-3 control-label">Search Type</label>
            			<div class="col-lg-9">
                			<select class="form-control" name="searchType">
                    			<option>Title</option>
			                    <option>Manufacturer</option>
			                    <option>Category</option>
                			</select>
                		</div>
                	</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="btn btn-warning" value="Search" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
