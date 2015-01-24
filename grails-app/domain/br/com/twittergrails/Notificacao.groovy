package br.com.twittergrails

class Notificacao {

    String descricao
    Date dateCreated
    Usuario usuario

    static constraints = {
        descricao(nullable: false)
        usuario(nullable: false)
    }
}
