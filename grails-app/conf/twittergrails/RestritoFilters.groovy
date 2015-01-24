package twittergrails

class RestritoFilters {

    def filters = {

        all(controller:'*', action:'*', uriExclude:'/assets/**') {
            before = {
                if (!session.usuario && !actionName.equals('login')
                    && !request.forwardURI.endsWith('TwitterGrails/')
                    && !request.forwardURI.contains('/index.gsp')
                    && !actionName.equals('logar')
                         && !(actionName.equals('create') && controllerName.equals('usuario') )
                         && !(actionName.equals('save') && controllerName.equals('usuario') ) ) {
                    redirect(controller: 'usuario', action: 'login')
                    return false
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
