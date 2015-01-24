package br.com.twittergrails


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PostController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Post.list(params), model: [postInstanceCount: Post.count()]
    }

    def show(Post postInstance) {
        respond postInstance
    }

    def create() {
        def usuario = Usuario.findById(session['usuario'].id)
        def sql = "from Post p join fetch p.usuario u where u.id = :id"
        sql += " or u.id in ( select us.id from Usuario us join us.usuarios s where s.id = :id ) "
        sql += " order by p.dateCreated desc "
        def posts = usuario ? Post.findAll(sql, [id:usuario.id]) : []
   //     respond new Post(params)
        def notificacoes = Notificacao.findAllByUsuario(usuario, [max: 10, sort: "dateCreated", order: "desc"])
        [listaNotificacoes:notificacoes, postList : posts]
    }

    @Transactional
    def save(Post postInstance) {

        def usuario = Usuario.findById(session['usuario'].id)
        usuario.addToPosts(postInstance).save flush: true

        postInstance.usuario = usuario

        if (postInstance == null) {
            notFound()
            return
        }

        if (postInstance.hasErrors()) {
         //   respond postInstance.errors, view: 'create'
            def posts = usuario ? Post.findAllByUsuario(usuario) : []
            //  [postList : posts]
            render(template:'tweets' , model:[postList : posts, postInstance : postInstance])
            return
        }

        postInstance.save flush: true

        (new LogAcessoController()).registrarLog("Novo post criado")

        def sql = "from Post p join fetch p.usuario u where u.id = :id"
        sql += " or u.id in ( select us.id from Usuario us join us.usuarios s where s.id = :id ) "
        sql += " order by p.dateCreated desc "
        def posts = usuario ? Post.findAll(sql, [id:usuario.id]) : []
      //  [postList : posts]
        render(template:'tweets' , model:[postList : posts])
//        redirect(action:'create')

/*        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'post.label', default: 'Post'), postInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { respond postInstance, [status: CREATED] }
        }*/
    }

    def edit(Post postInstance) {
        respond postInstance
    }

    @Transactional
    def update(Post postInstance) {
        if (postInstance == null) {
            notFound()
            return
        }

        if (postInstance.hasErrors()) {
            respond postInstance.errors, view: 'edit'
            return
        }

        postInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Post.label', default: 'Post'), postInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { respond postInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Post postInstance) {

        if (postInstance == null) {
            notFound()
            return
        }

        postInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Post.label', default: 'Post'), postInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'post.label', default: 'Post'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
