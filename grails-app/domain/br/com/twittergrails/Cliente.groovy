package br.com.twittergrails

class Cliente {

    String nome
    int idade
    String endereco
    String bairro
    String cidade
    String uf

    static constraints = {
        nome()
        idade()
        endereco()
        bairro()
    }
}
