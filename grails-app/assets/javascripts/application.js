// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require bootstrap
//= require_tree .
//= require_self

var agenda = {
    init : function() {
        $("#frmAgenda").submit(agenda.submit);
        agenda.loadLista();
    },
    submit : function(e) {
        e.preventDefault();
        console.log("Preparando para enviar!");
        $.ajax({
            url:"/TwitterGrails/agenda/save",
            type: "POST",
            data: $("#frmAgenda").serialize()
        }).done( function() {
            $("#frmAgenda input[type='text'],textarea").val("");
            agenda.loadLista();
        });
        console.log("Concluído!");
    },
    loadLista : function() {
        $.ajax({
            url: "/TwitterGrails/agenda/listAll",
            type: "GET",
            contentType: "application/json"
        }).done(function(data) {
            $("#tblAgenda tbody").html("");
            $.each(data,function(idx,agenda){
                var html = "<tr data-id=\""+agenda.id+"\">";
                html += "<td>"+agenda.nome+"</td>";
                if (agenda.grupo) {
                    html += "<td>"+agenda.nome+"</td>";
                } else {
                    html += "<td> - </td>";
                }
                html += "<td>&nbsp;</td>";
                html += "</tr>";
                $("#tblAgenda tbody").append(html);
            });
        });
    }

};

$(document).ready(function() {
   agenda.init();
});