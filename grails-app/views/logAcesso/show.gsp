<%@ page import="br.com.twittergrails.LogAcesso" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'logAcesso.label', default: 'LogAcesso')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header"><g:message code="default.show.label" args="[entityName]"/></h1>
    </div>
    <!-- /.col-lg-12 -->
</div>

<div class="row">
    <ol class="breadcrumb">
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li class="active"><g:message code="default.show.label" args="[entityName]"/></li>
    </ol>
    <g:if test="${flash.message}">
        <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span
                    class="sr-only">Close</span></button>
            ${flash.message}
        </div>
    </g:if>
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-clock-o fa-fw"></i><g:message code="default.show.label" args="[entityName]"/>
            </div>

            <div class="panel-body">

                <g:if test="${logAcessoInstance?.dateCreated}">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <g:message code="logAcesso.dateCreated.label" default="Date Created"/>
                        </div>

                        <div class="panel-body">

                        <g:formatDate date="${logAcessoInstance?.dateCreated}"/></span>

                        </div>
                    </div>
                </g:if>

                <g:if test="${logAcessoInstance?.descricao}">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <g:message code="logAcesso.descricao.label" default="Descricao"/>
                        </div>

                        <div class="panel-body">

                            <g:fieldValue bean="${logAcessoInstance}" field="descricao"/>

                        </div>
                    </div>
                </g:if>

                <g:if test="${logAcessoInstance?.usuario}">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <g:message code="logAcesso.usuario.label" default="Usuario"/>
                        </div>

                        <div class="panel-body">

                        <g:link controller="usuario" action="show"
                                id="${logAcessoInstance?.usuario?.id}">${logAcessoInstance?.usuario?.encodeAsHTML()}</g:link></span>

                        </div>
                    </div>
                </g:if>


                <g:link class="btn btn-warning" action="index"><g:message code="default.list.label"
                                                                          args="[entityName]"/></g:link>
                <g:link class="btn btn-default" action="edit" resource="${logAcessoInstance}"><g:message
                        code="default.button.edit.label" default="Edit"/></g:link>
                <g:form url="[resource: logAcessoInstance, action: 'delete']" method="DELETE">
                    <g:actionSubmit class="btn btn-danger pull-right" action="delete"
                                    value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
