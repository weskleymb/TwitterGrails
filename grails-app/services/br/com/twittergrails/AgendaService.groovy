package br.com.twittergrails

import grails.transaction.Transactional

@Transactional
class AgendaService {

    def buscarDadosPorNome(nome) {
		Agenda.findAllByNomeIlike("%${nome}%")
	}
	
	
}
