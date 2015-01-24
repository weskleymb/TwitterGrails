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
<g:each in="${postList}" status="i" var="post">
    <div><h3><strong>${post.usuario.login}</strong>&nbsp;<span style="font-size: medium"><g:formatDate type="datetime" format="dd/MM/yyyy HH:mm:ss" date="${post.dateCreated}"/></span></h3></div>
    <div><h4>${post.descricao}</h4></div>
</g:each>