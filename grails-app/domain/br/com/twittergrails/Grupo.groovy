package br.com.twittergrails

class Grupo {
	
	String descricao
	
	static hasMany = [agendas:Agenda]

    static constraints = {
		descricao()
		agendas()
    }

	String toString() {
		descricao
	}
}
