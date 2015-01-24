<%@ page import="br.com.twittergrails.Post" %>



<div class="form-group ${hasErrors(bean: postInstance, field: 'descricao', 'has-error')} required">
	<label for="descricao">
		<span>Fale sobre algo</span>
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="descricao" required="" value="${postInstance?.descricao}" id="descricao" />

</div>

%{--<div class="form-group ${hasErrors(bean: postInstance, field: 'usuario', 'has-error')} required">
	<label for="usuario">
		<g:message code="post.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${br.com.twittergrails.Usuario.list()}" optionKey="id" required="" value="${postInstance?.usuario?.id}" class="form-control"/>

</div>--}%

