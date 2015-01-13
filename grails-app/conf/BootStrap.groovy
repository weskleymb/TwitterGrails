import br.com.twittergrails.Grupo
import grails.util.GrailsUtil

class BootStrap {

    def init = { servletContext ->
		def devel = GrailsUtil.developmentEnv
		
		if (devel) {
			new Grupo(descricao: "Familia").save(failOnError: true)
			new Grupo(descricao: "Amigos").save(failOnError: true)
			new Grupo(descricao: "Inimigos").save(failOnError: true)
			new Grupo(descricao: "Alunos").save(failOnError: true)
		}
    }
    def destroy = {
    }
}
