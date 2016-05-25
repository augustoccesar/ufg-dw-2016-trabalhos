function deleteRecord(matricula, nome){
  $("#aluno_record_" + matricula).remove();
  Materialize.toast('Aluno ' + nome + ' deletado.', 2000)
};

$(document).ready(function(){
  var delete_button = function(matricula, nome){
     return "<a onClick='deleteRecord(\"" + matricula + "\", \"" + nome + "\")' class='waves-effect waves-light btn red'><i class='material-icons'>delete</i></a>"
  }

  $("#edit_link").on("click", function(){
    $("#form_edit").removeClass('hide').addClass('show');
    $("#list_div").removeClass('show').addClass('hide');
  });

  $("#list_link").on("click", function(){
    $("#form_edit").removeClass('show').addClass('hide');
    $("#list_div").removeClass('hide').addClass('show');
  });

  $("#submit_button").on("click", function(){
    var matricula = $("#matricula").val();
    var nome = $("#nome").val();
    var email = $("#email").val();
    if((matricula == "" || matricula == undefined) || (nome == "" || nome == undefined) || (email == "" || email == undefined)){
      alert("Preencha o formulario.");
    }else{
      $("#list_table").children("tbody").append("<tr id='aluno_record_" + matricula + "'><td>" + matricula + "</td><td>" + nome + "</td><td>" + email + "</td><td>" + delete_button(matricula, nome) + "</td></tr>");
      $("#matricula").val("");
      $("#nome").val("");
      $("#email").val("");
      $("#list_link").click();
    }
  });
});
