package br.com.twittergrails


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsuarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Usuario.list(params), model: [usuarioInstanceCount: Usuario.count()]
    }

    def show(Usuario usuarioInstance) {
        respond usuarioInstance
    }

    def create() {
        respond new Usuario(params)
    }

    @Transactional
    def save(Usuario usuarioInstance) {
        usuarioInstance.validaSenha(params.senha, params.confirmacaoSenha)

        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view: 'create'
            return
        }

        usuarioInstance.save flush: true

        (new LogAcessoController()).registrarLog("Novo usuário criado")

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { respond usuarioInstance, [status: CREATED] }
        }
    }

    def edit(Usuario usuarioInstance) {
        respond usuarioInstance
    }

    @Transactional
    def update(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view: 'edit'
            return
        }

        usuarioInstance.save flush: true

        (new LogAcessoController()).registrarLog("Dados do usuário alterados")

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect controller:"post", action: "create", method: "GET"
            }
            '*' { respond usuarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Usuario usuarioInstance) {

        if (usuarioInstance == null) {
            notFound()
            return
        }

        usuarioInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def login() {

    }

    @Transactional
    def logar (Usuario usuarioInstance) {
        Usuario usuario = Usuario.findByLoginAndSenha(usuarioInstance.login,usuarioInstance.senha)
        if (!usuario) {
            flash.message = message(code: 'default.login.label', default: 'Login inválido!')
            redirect(action: 'login')
        } else {
            session["usuario"] = usuario
            (new LogAcessoController()).registrarLog("Login realizado no sistema")
            redirect(controller:'post',action:'create')
        }


    }

    @Transactional
    def logoff() {

        (new LogAcessoController()).registrarLog("Realizou logoff do sistema")
        session.invalidate()
        redirect(action: "login")
    }

    def buscar() {
        def listaUsuarios = Usuario.findAllByLoginIlike("%${params.busca}%")
        render(template:'/layouts/usuarios' , model:[listaUsuarios : listaUsuarios, buscaRealizada : params.busca])
    }

    @Transactional
    def seguir() {
        def usuarioLogado = Usuario.findById(session['usuario'].id)
        def usuario = Usuario.findById(params.hiddenId)

        def notificacao = new Notificacao()
        if (usuario.usuarios.contains(usuarioLogado)) {
            usuario?.removeFromUsuarios(usuarioLogado)
            notificacao.descricao = usuarioLogado.login + " deixou de seguir você"
            (new LogAcessoController()).registrarLog("Deixou de seguir usuário: " + usuario?.login)
        } else {
            usuario?.addToUsuarios(usuarioLogado).save flush:true
            notificacao.descricao = usuarioLogado.login + " está seguindo você"
            (new LogAcessoController()).registrarLog("Seguiu usuário: " + usuario?.login)
        }
        notificacao.usuario = usuario
        notificacao.save(flush: true)

        if (params.hiddenBusca) {
            def listaUsuarios = Usuario.findAllByLoginIlike("%${params.hiddenBusca}%")
            render(template:'/layouts/usuarios' , model:[listaUsuarios : listaUsuarios, buscaRealizada :params.hiddenBusca])
        }
    }
}
