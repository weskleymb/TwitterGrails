<%@ page import="br.com.twittergrails.Post" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainlogado">
		<g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
          <div class="col-lg-12">
              <h1 class="page-header"><g:message code="default.create.label" args="[entityName]" /></h1>
          </div>
          <!-- /.col-lg-12 -->
		</div>
		<div class="row">
			<ol class="breadcrumb">
				%{--<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
				<li class="active"><g:message code="default.create.label" args="[entityName]" /></li>
			</ol>
			<g:if test="${flash.message}">
				<div class="alert alert-warning alert-dismissible" role="alert">
				  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				  ${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${postInstance}">
				<div class="alert alert-warning alert-dismissible" role="alert">
				  	<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<ul class="errors" role="alert">
						<g:eachError bean="${postInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
				</div>
			</g:hasErrors>
			<div class="col-lg-12">
		        <div class="panel panel-primary">
		            <div class="panel-heading">
	                	<i class="fa fa-clock-o fa-fw"></i><g:message code="default.create.label" args="[entityName]" />
		            </div>
		            <div class="panel-body">
		            	<g:form url="[resource:postInstance, action:'save']" role="form" id="formPost">
							<g:render template="form"/>
							<g:submitToRemote onSuccess="clearForm()" url="[action: 'save']" update="posts"  name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
							%{--<g:link class="btn btn-warning" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>--}%
						</g:form>

						<g:javascript library="jquery" plugin="jquery">
						</g:javascript>

						<g:javascript>
							function clearForm() {
								$("#descricao").val('');
							}
						</g:javascript>

						<div id="posts">
							<g:render template="tweets" model="[postList: postList]" />
						</div>
		            </div>
	            </div>
            </div>
		</div>
	</body>
</html>
