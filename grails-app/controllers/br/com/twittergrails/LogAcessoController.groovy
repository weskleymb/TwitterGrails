package br.com.twittergrails


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LogAcessoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LogAcesso.list(params), model: [logAcessoInstanceCount: LogAcesso.count()]
    }

    def show(LogAcesso logAcessoInstance) {
        respond logAcessoInstance
    }

    def create() {
        respond new LogAcesso(params)
    }

    @Transactional
    def save(LogAcesso logAcessoInstance) {
        if (logAcessoInstance == null) {
            notFound()
            return
        }

        if (logAcessoInstance.hasErrors()) {
            respond logAcessoInstance.errors, view: 'create'
            return
        }

        logAcessoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'logAcesso.label', default: 'LogAcesso'), logAcessoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { respond logAcessoInstance, [status: CREATED] }
        }
    }

    def edit(LogAcesso logAcessoInstance) {
        respond logAcessoInstance
    }

    @Transactional
    def update(LogAcesso logAcessoInstance) {
        if (logAcessoInstance == null) {
            notFound()
            return
        }

        if (logAcessoInstance.hasErrors()) {
            respond logAcessoInstance.errors, view: 'edit'
            return
        }

        logAcessoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LogAcesso.label', default: 'LogAcesso'), logAcessoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { respond logAcessoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(LogAcesso logAcessoInstance) {

        if (logAcessoInstance == null) {
            notFound()
            return
        }

        logAcessoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LogAcesso.label', default: 'LogAcesso'), logAcessoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'logAcesso.label', default: 'LogAcesso'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def registrarLog(String descricao) {
        def log = new LogAcesso()
        log.descricao = descricao
        log.usuario = session['usuario']
        log.save(flush: true)
    }
}
