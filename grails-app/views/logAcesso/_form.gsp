<%@ page import="br.com.twittergrails.LogAcesso" %>



<div class="form-group ${hasErrors(bean: logAcessoInstance, field: 'descricao', 'has-error')} required">
    <label for="descricao">
        <g:message code="logAcesso.descricao.label" default="Descricao"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="form-control" name="descricao" required="" value="${logAcessoInstance?.descricao}"/>

</div>

<div class="form-group ${hasErrors(bean: logAcessoInstance, field: 'usuario', 'has-error')} required">
    <label for="usuario">
        <g:message code="logAcesso.usuario.label" default="Usuario"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="usuario" name="usuario.id" from="${br.com.twittergrails.Usuario.list()}" optionKey="id" required=""
              value="${logAcessoInstance?.usuario?.id}" class="form-control"/>

</div>

