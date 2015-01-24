<%@ page import="br.com.twittergrails.Usuario" %>
<g:if test="${listaUsuarios}">

    <hr size="1">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <g:each in="${listaUsuarios}" status="i" var="usuario">
                <tr>
                    <td style="text-align: left">${usuario.login}</td>
                    <g:if test="${usuario.seguidorExiste(session['usuario'])}">
                         <td style="text-align: right">
                             <g:form>
                                 <g:hiddenField name="hiddenId" value="${usuario.id}"></g:hiddenField>
                                 <g:hiddenField name="hiddenBusca" value="${buscaRealizada}"></g:hiddenField>
                                 <g:submitToRemote name="seguir" value="Deixar de Seguir" url="[controller: 'usuario', action: 'seguir']" update="usuarios"></g:submitToRemote>
                             </g:form>
                         </td>
                    </g:if>
                    <g:else>
                         <td style="text-align: right">
                             <g:form>
                                 <g:hiddenField name="hiddenId" value="${usuario.id}"></g:hiddenField>
                                 <g:hiddenField name="hiddenBusca" value="${buscaRealizada}"></g:hiddenField>
                                 <g:submitToRemote name="seguir" value="Seguir" url="[controller: 'usuario', action: 'seguir']" update="usuarios"></g:submitToRemote>
                             </g:form>
                         </td>
                    </g:else>
                </tr>
                <tr><td colspan="2"><hr size="1"></td> </tr>
        </g:each>
    </table>

</g:if>