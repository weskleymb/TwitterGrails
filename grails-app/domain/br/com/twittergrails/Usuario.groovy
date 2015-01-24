package br.com.twittergrails

import grails.transaction.Transactional

class Usuario {

    String login
    String senha
    String nome
    String descricaoPessoal
    String confirmacaoSenha

    static hasMany = [usuarios:Usuario,notificacoes:Notificacao,posts:Post]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        login nullable: false
/*        senha (nullable: false, validator: { senha, obj ->
            validaSenha() ? true : ['invalid.matchingpasswords']
        })*/
        nome nullable: false
        descricaoPessoal()
    }

    static transients = ['confirmacaoSenha']

    void validaSenha(String senha, String confirmacao) {
       if (senha != confirmacao) {
           this.errors.rejectValue("senha",'invalid.matchingpasswords',"A senha e sua confirmação diferem!")
       }
    }

    @Transactional
    boolean seguidorExiste(Usuario u) {
        def usuarioAtual = Usuario.findById(this.id)
        def usuarioLogado = Usuario.findById(u.id)
        usuarioAtual.usuarios.contains(usuarioLogado)
    }

    def String toString() {
        this.login
    }
}
