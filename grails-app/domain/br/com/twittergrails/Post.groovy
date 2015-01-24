package br.com.twittergrails

class Post {

    String descricao
    Date dateCreated

    static belongsTo = [usuario:Usuario]

    static constraints = {
        descricao (nullable: false)
        usuario (nullable: false)
    }
}
