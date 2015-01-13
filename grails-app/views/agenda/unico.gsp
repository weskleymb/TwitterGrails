<%@ page import="br.com.twittergrails.Grupo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
	</head>
	<body>
	<div class="row">
          <div class="col-lg-12">
              <h1 class="page-header">Agenda Página Única</h1>
          </div>
          <!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-primary">
		            <div class="panel-heading">
	                	<i class="fa fa-clock-o fa-fw"></i>Form Agenda
		            </div>
		            <div class="panel-body">
		            	<form id="frmAgenda" role="form">
		            		<div class="form-group">
		            			<label for="nome">Nome</label>
		            			<input type="text" class="form-control" id="nome" name="nome">
		            		</div>
		            		<div class="form-group">
		            			<label for="observacao">Observação</label>
		            			<textarea name="observacao" id="observacao" class="form-control"></textarea>
		            		</div>
		            		<div class="form-group">
		            			<label for="grupo">Grupo</label>
		            			<g:select name="grupo.id" from="${br.com.twittergrails.Grupo?.list()}" noSelection="${ ['':'-- Selecione --'] }" optionKey="id" />
		            		</div>
							<input type="submit" value="Enviar" class="btn btn-primary">
		            	</form>
		            </div>
		        </div>
		</div>
		<div class="col-lg-6">
			<div class="panel panel-primary">
	            <div class="panel-heading">
                	<i class="fa fa-clock-o fa-fw"></i>Agenda Listagem
	            </div>
	            <div class="panel-body">
	            	<table class="table table-striped" id="tblAgenda">
						<thead>
							<tr>
								<th>Nome</th>
								<th>Grupo</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
	            	</table>
	            </div>
	        </div>
		</div>
	</div>
</body>