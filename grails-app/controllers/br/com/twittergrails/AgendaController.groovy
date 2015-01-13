package br.com.twittergrails

import grails.converters.JSON

class AgendaController {

    def scaffold = true
	
	def agendaService
	
	def lista(String nome) {
		render agendaService.buscarDadosPorNome(nome) as JSON
	}

	def unico() {

	}

	def listAll() {
		def lista = []
		Agenda?.list()?.each{
			def ag = [:]
			ag.put("id",it.id)
			ag.put("grupo",it?.grupo?.descricao)
			ag.put("nome",it.nome)
			lista.add(ag)
		}
		render lista as JSON
	}
}
