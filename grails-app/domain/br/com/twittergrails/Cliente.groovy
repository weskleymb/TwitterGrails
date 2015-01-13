package br.com.twittergrails

class Cliente {

    String nome
    int idade
    String endereco
    String bairro
    String cidade

    static constraints = {
        nome()
        idade()
        endereco()
        bairro()
    }
}
