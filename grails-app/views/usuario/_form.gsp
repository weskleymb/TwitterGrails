<%@ page import="br.com.twittergrails.Usuario" %>



<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'login', 'has-error')} required">
	<label for="login">
		<g:message code="usuario.login.label" default="Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="login" required="" value="${usuarioInstance?.login}"/>

</div>

<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'senha', 'has-error')} required">
	<label for="senha">
		<g:message code="usuario.senha.label" default="Senha" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField class="form-control" name="senha" required="" value="${usuarioInstance?.senha}"/>

</div>

<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'confirmacaoSenha', 'has-error')} required">
	<label for="confirmacaoSenha">
		<g:message code="usuario.confirmacaoSenha.label" default="Confirmação" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField class="form-control" name="confirmacaoSenha" required="" value="${usuarioInstance?.confirmacaoSenha}"/>

</div>

<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'nome', 'has-error')} required">
	<label for="nome">
		<g:message code="usuario.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="nome" required="" value="${usuarioInstance?.nome}"/>

</div>

<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'descricaoPessoal', 'has-error')} required">
	<label for="descricaoPessoal">
		<g:message code="usuario.descricaoPessoal.label" default="Descricao Pessoal" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="descricaoPessoal" required="" value="${usuarioInstance?.descricaoPessoal}"/>

</div>

