package br.com.twittergrails

class Cliente {

    String nome
    int idade
    String endereco
    String bairro

    static constraints = {
        nome()
        idade()
        endereco()
        bairro()
    }
}
