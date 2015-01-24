<%--
  Created by IntelliJ IDEA.
  User: Wilton
  Date: 16/01/2015
  Time: 11:50
--%>

<%@ page import="br.com.twittergrails.Usuario" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Login</title>
</head>

<body>
    <g:if test="${flash.message}">
        <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            ${flash.message}
        </div>
    </g:if>
    <br/>
    <br/>
    <g:form url="[resource:usuarioInstance, action:'logar']" role="form">
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
        <g:actionSubmit class="btn btn-primary" action="logar" value="${message(code: 'default.button.login.label', default: 'Login')}" />
        <g:link action="create">Cadastre-se</g:link>

    </g:form>
</body>
</html>