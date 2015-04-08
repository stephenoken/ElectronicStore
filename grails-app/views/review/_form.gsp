<%@ page import="com.store.Review" %>



<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'rating', 'error')} required">
	<div class="form-group">
	    <label for="rating" class="col-lg-2 control-label">Rating</label>
	    <div class="col-lg-10">
	    	<g:select name="rating" from="${1..5}" class="form-control" required="" value="${fieldValue(bean: reviewInstance, field: 'rating')}"/>
	    </div>
    </div>
</div><%--

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="review.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${com.store.AppUser.list()}" optionKey="id" required="" value="${reviewInstance?.author?.id}" class="many-to-one"/>

</div>

--%><div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'review', 'error')} required">
	<div class="form-group">
        <label for="textArea" class="col-lg-2 control-label">Review</label>
        <div class="col-lg-10">
        	<g:textArea class="form-control" rows="3" id="review" name="review" value="${reviewInstance?.review}"></g:textArea>
    		<span class="help-block">Write your review here.</span>
    	</div>
	</div>
</div>
<%--<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'stock', 'error')} required">
	<label for="stock">
		<g:message code="review.stock.label" default="Stock" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="stock" name="stock.id" from="${com.store.Stock.list()}" optionKey="id" required="" value="${reviewInstance?.stock?.id}" class="many-to-one"/>

</div>

--%>