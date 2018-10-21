
<<<<<<< HEAD
window.onload = function () {
    
      aparecerCaixa();

    $(document).ready(function () {
        $('#telefone').mask('(99) 99999-9999'); 
        $('#cpf').mask('999.999.999-99');
        $('#cnpj').mask('99.999.999/9999-99');
        $('#cep').mask('99999-999');

    });

    document.getElementById("cpf").onkeypress = function () {
        return Onlynumbers(event);
    };

    document.getElementById("telefone").onkeypress = function () {
        return Onlynumbers(event);
    };

    document.getElementById("cep").onkeypress = function () {
        return Onlynumbers(event);
    };

    document.getElementById("cnpj").onkeypress = function () {
        return Onlynumbers(event);
    };

    document.getElementById("numero").onkeypress = function () {
        return Onlynumbers(event);
    };


    document.getElementById("complemento").onkeypress = function () {
        return Onlychars(event);
    };

    document.getElementById("bairro").onkeypress = function () {
        return Onlychars(event);
    };

    document.getElementById("estado").onkeypress = function () {
        return Onlychars(event);
    };

    document.getElementById("cidade").onkeypress = function () {
        return Onlychars(event);
    };

    document.getElementById("nomeRazao").onkeypress = function () {
        return Onlychars(event);
    };

    document.getElementById("logradouro").onkeypress = function () {
        return Onlychars(event);
    };


    var email = $("#email").val();

    var emailDisponivel = "nao";


    document.getElementById("email").onchange = function (events) {



        email = $("#email").val();

        $.ajax({
            type: 'POST',
            url: "ConsultaEmail",
            data: {
                email: email

            },
            success: function (results) {
                if (results === "Ja existente") {

                    $("#email").css("border-color", "red");
                    emailDisponivel = "nao";
                    console.log(emailDisponivel);

                } else if (results === "Valido") {
                    $("#email").css("border-color", "lightgreen");
                    emailDisponivel = "sim";
                    console.log(emailDisponivel);

=======
        





 
        
window.onload=function(){
            aparecerCaixa();
            
            //alert("JQUERY dentro do .js");
                    
      
                
              //document.getElementById("cpf").onkeypress   = function(){return Onlynumbers(event);};
             // document.getElementById("cnpj").onkeypress   = function(){return Onlynumbers(event);};
              document.getElementById("numero").onkeypress   = function(){return Onlynumbers(event);};
              //document.getElementById("ddd").onkeypress   = function(){return Onlynumbers(event);};
              document.getElementById("telefone").onkeypress   = function(){return Onlynumbers(event);};
              
              var email = $("#email").val();
              
              var emailDisponivel = "nao";
                 
                
            document.getElementById("email").onchange = function(events){
    
                
                   
                email = $("#email").val();
                
                $.ajax({
                                type:'POST',
                                url : "ConsultaEmail",
                                data : {
                                    email : email
                                    
                                },
                                success : function(results){
                                    if(results === "Ja existente"){
                                        $("#email").css("border-color", "red");
                                        emailDisponivel = "nao";
                                        console.log(emailDisponivel);
                                        
                                    }else if(results === "Valido"){
                                        $("#email").css("border-color", "lightgreen");
                                        emailDisponivel = "sim";
                                        console.log(emailDisponivel);
                                                         
                                    }
                                    
                                    if(email === ""){
                                    $("#email").css("border-color", "inherit");
                                    emailDisponivel = "vazio";
                                    console.log(emailDisponivel);
                                    }   
                                }
                 });             
            };
            
            document.getElementById("reemail").onchange = function(events){
                
                if(emailIgual() === true){
                    $("#reemail").css("border-color","lightgreen");
                }
                else{
                    $("#reemail").css("border-color","red");
                }
            };
            
            document.getElementById("repsenha").onchange = function(events){
                if(senhaIgual() === true){
                     $("#repsenha").css("border-color","lightgreen");
>>>>>>> fbf5294909c8d8168ef54e9406f72964e1f17219
                }

                if (email === "") {
                    $("#email").css("border-color", "inherit");
                    emailDisponivel = "vazio";
                    console.log(emailDisponivel);
                }
            }

<<<<<<< HEAD
=======
            document.getElementById("form").onsubmit = function(){
                  
                    var valid = campoVazio();/* Valida se ambos o campos, cpf e cnpf, estão vazios*/
                  
                  
                    var fisico = document.getElementById("idFisico");
                    var juridico = document.getElementById("idJuridico");
            	
                    var cpf = document.getElementById("cpf");
                    var nome = document.getElementById("nome");
                    var data = document.getElementById("data");
                    var masc = document.form.sexo[0];
                    var femi = document.form.sexo[1];
				
                    var cnpj = document.getElementById("cnpj");
                    var nomeRazao = document.getElementById("nomeRazao");  
                    var valid1 = true;
                    var fisicoValid = true;
                    var juridicoIValid = true;
                        
                        
                        
                  
                  

                        email = $("#email").val();
                     
                         /*Consulta email*/
                         $.ajax({
                                type:'POST',
                                url : "ConsultaEmail",
                                data : {
                                    email : email,
                                    
                                },
                                success : function(results){
                                    if(results === "Ja existente"){
                                        $("#email").css("border-color", "red");
                                        emailDisponivel = "nao";
                                        
                                        
                                    }else if(results === "Valido"){
                                        $("#email").css("border-color", "lightgreen");
                                        emailDisponivel = "sim";
                                        
                                                         
                                    }
                                    
                                    if(email === ""){
                                    $("#email").css("border-color", "inherit");
                                    emailDisponivel = "vazio";
                                    }   
                                    
                                }
                         });
                  
                                        
                                        if(emailDisponivel === "nao" || emailDisponivel === "vazio"){
                                            $("#email").focus();
                                            alert("Email invalido");
                                            return false;
                                        }
                                            
                                        if(emailIgual() === false){
                                            alert("email divergente");
                                            $("#reemail").focus();                                           
                                            $("#reemail").css("border-color","red");
                                            return false;
                                        }
                                        else{
                                             $("#reemail").css("border-color","lightgreen"); 
                                        }
                                        
                                        if(senhaIgual() === false){
                                            
                                            $("#repsenha").focus();
                                            $("#repsenha").css("border-color","red");
                                            return false;
                                            
                                        }
                                        else{
                                           $("#repsenha").css("border-color","lightgreen"); 
                                        }
                                        
                                        var opcao = "";
                                        if(valid === false)/* Valida se ambos o campos, cpf e cnpf, estão vazios*/
                                        {
                                            if(fisico.checked){
						cpf.focus();
						cpf.placeholder = "Obrigatório";
                                                opcao = "cpf";
                                            }
                                            if(juridico.checked){
						cnpj.focus();
						cnpj.placeholder = "Obrigatório";
                                                opcao = "cnpj";
                                            }
					
						
                                            valid1 = false;
                                            return valid1;
                                        }
                                        
                                        
                                        
                                        if(validarCpf() === false){
                                            return false;
                                        }
                                        
                                        if(validarCnpj() === false){
                                            return false;
                                        }
                
                                        
                                        if(fisico.checked){
                                            if(!masc.checked && !femi.checked){
						masc.focus();
						 fisicoValid = false;
						return fisicoValid;
                                            }
					
                                            if(nome.value == ""){
						nome.focus();
						nome.placeholder = "Obrigatório";
						 fisicoValid = false;
                                                 return fisicoValid;
                                            }
                                            
                                            if(data.value == ""){
						data.focus();
						 fisicoValid = false;
                                                 return fisicoValid;
                                            }
                                            
                                        }
                                            
                                
                                
                                        if(juridico.checked){
                                            if(nomeRazao.value == ""){
						nomeRazao.focus();
						nomeRazao.placeholder = "Obrigatório";
						juridicoIValid = false;
                                                return juridicoIValid;
                                            }
                                        }
                                        
                                        alert(cpf.value +" eeeeeeee "+cnpj.value);
                                        
                                       if(valid1 === false || fisicoValid === false || juridicoIValid === false || emailDisponivel === "nao" || emailDisponivel === "vazio" ){
                                                
                                                
                                                if(emailDisponivel === "nao"|| emailDisponivel === "vazio"){
                                                    $("#email").focus();
                                                }
                                                return false;
                                                
                                                
                                        }
                                            
                                        document.getElementById("form").submit;    
                                            
                  
              
                  
                  
                  
                    
                    
              };
                  
        };
        
>>>>>>> fbf5294909c8d8168ef54e9406f72964e1f17219

        });



    };

    document.getElementById("reemail").onchange = function (events) {

        if (emailIgual() === true) {
            $("#reemail").css("border-color", "lightgreen");
        } else {
            $("#reemail").css("border-color", "red");
        }
    };

    document.getElementById("repsenha").onchange = function (events) {
        if (senhaIgual() === true) {
            $("#repsenha").css("border-color", "lightgreen");
        } else
        {

            $("#repsenha").css("border-color", "red");
        }

    };

    document.getElementById("form").onsubmit = function () {

        var valid = campoVazio();/* Valida se ambos o campos, cpf e cnpf, estão vazios*/


        var fisico = document.getElementById("idFisico");
        var juridico = document.getElementById("idJuridico");

        var cpf = document.getElementById("cpf");
        var nome = document.getElementById("nome");
        var data = document.getElementById("data");
        var masc = document.form.sexo[0];
        var femi = document.form.sexo[1];

        var cnpj = document.getElementById("cnpj");
        var nomeRazao = document.getElementById("nomeRazao");
        var valid1 = true;
        var fisicoValid = true;
        var juridicoIValid = true;






        /*email = $("#email").val();*/

        /*Consulta email
         $.ajax({
         type:'POST',
         url : "ConsultaEmail",
         data : {
         email : email,
         
         },
         success : function(results){
         if(results === "Ja existente"){
         $("#email").css("border-color", "red");
         emailDisponivel = "nao";
         
         
         }else if(results === "Valido"){
         $("#email").css("border-color", "lightgreen");
         emailDisponivel = "sim";
         
         
         }
         
         if(email === ""){
         $("#email").css("border-color", "inherit");
         emailDisponivel = "vazio";
         }   
         
         }
         });*/


        if (emailDisponivel === "nao" || emailDisponivel === "vazio") {
            $("#email").focus();
            alert("Email invalido");
            return false;
        }

        if (emailIgual() === false) {
            alert("email divergente");
            $("#reemail").focus();
            $("#reemail").css("border-color", "red");
            return false;
        } else {
            $("#reemail").css("border-color", "lightgreen");
        }

        if (senhaIgual() === false) {

            $("#repsenha").focus();
            $("#repsenha").css("border-color", "red");
            return false;

        } else {
            $("#repsenha").css("border-color", "lightgreen");
        }

        var opcao = "";
        if (valid === false)/* Valida se ambos o campos, cpf e cnpf, estão vazios*/
        {
            if (fisico.checked) {
                cpf.focus();
                cpf.placeholder = "Obrigatório";
                opcao = "cpf";
            }
            if (juridico.checked) {
                cnpj.focus();
                cnpj.placeholder = "Obrigatório";
                opcao = "cnpj";
            }


            valid1 = false;
            return valid1;
        }



        if (validarCpf() === false) {
            return false;
        }

        if (validarCnpj() === false) {
            return false;
        }


        if (fisico.checked) {
            if (!masc.checked && !femi.checked) {
                masc.focus();
                fisicoValid = false;
                return fisicoValid;
            }

            if (nome.value == "") {
                nome.focus();
                nome.placeholder = "Obrigatório";
                fisicoValid = false;
                return fisicoValid;
            }

            if (data.value == "") {
                data.focus();
                fisicoValid = false;
                return fisicoValid;
            }

        }



        if (juridico.checked) {
            if (nomeRazao.value == "") {
                nomeRazao.focus();
                nomeRazao.placeholder = "Obrigatório";
                juridicoIValid = false;
                return juridicoIValid;
            }
        }

        alert(cpf.value + " eeeeeeee " + cnpj.value);

        /*if(valid1 === false || fisicoValid === false || juridicoIValid === false || emailDisponivel === "nao" || emailDisponivel === "vazio" ){
         
         
         if(emailDisponivel === "nao"|| emailDisponivel === "vazio"){
         $("#email").focus();
         }
         return false;
         
         
         }*/

        document.getElementById("form").submit;








    };/*on submit*/



};

$("#form").submit(function() {
    if($("#campo").val()== null || $("#campo").val() ==""){
        alert('campo vazio');      
        return false;
    }
});

function aparecerCaixa() {
    var fisico = document.getElementById("idFisico");
    var juridico = document.getElementById("idJuridico");
    var caixaFisico = document.getElementById("fisico");
    var caixaJuridico = document.getElementById("juridico");

    var cpf = document.getElementById("cpf");
    var nomeFis = document.getElementById("nome");
    var dataNasci = document.getElementById("data");
    var chMasculino = document.getElementById("masculino");
    var chFeminino = document.getElementById("feminino");

    var cnpj = document.getElementById("cnpj");
    var nomeRazao = document.getElementById("nomeRazao");


    fisico.onclick = function () {
        caixaFisico.style.display = "block";
        caixaJuridico.style.display = "none";
        cnpj.value = "";
        nomeRazao.value = "";
    };

    juridico.onclick = function () {



        caixaFisico.style.display = "none";
        caixaJuridico.style.display = "block";
        cpf.value = "";
        nomeFis.value = "";
        dataNasci.value = "";
        chMasculino.checked = false;
        chFeminino.checked = false;
    };

}

function campoVazio() {
    var cpf = document.getElementById("cpf");
    var cnpj = document.getElementById("cnpj");
    var fisico = document.getElementById("idFisico");
    var juridico = document.getElementById("idJuridico");

    var teste = false;
    if (cpf.value == "" && cnpj.value == "") {

        teste = false;


    } else {
        teste = true;
    }
    return teste;

}

function senhaIgual() {
    if (document.getElementById("senha").value === document.getElementById("repsenha").value) {
        return true;
    } else {
        return false;
    }

}

function emailIgual() {
    if (document.getElementById("email").value === document.getElementById("reemail").value) {
        return true;
    } else {
        return false;
    }

}

function validarCpf() {
    if (document.getElementById("idFisico").checked) {
        if (document.getElementById("cpf").value.length > 0 && document.getElementById("cpf").value.length < 11) {
            alert("Erro: escreva todo CPF");
            document.getElementById("cpf").style.borderColor = "red";
            return false;
        } else {
            return true;
        }
    }

}

function validarCnpj() {
    if (document.getElementById("idJuridico").checked) {
        if (document.getElementById("cnpj").value.length > 0 && document.getElementById("cnpj").value.length < 14) {
            alert("Erro: escreva todo CNPJ");
            document.getElementById("cnpj").style.borderColor = "red";
            return false;
        } else {
            return true;
        }
    }

}

function Onlynumbers(e) {
    var tecla = new Number();
    if (window.event) {
        tecla = e.keyCode;
    } else if (e.which) {
        tecla = e.which;
    } else {
        return true;
    }
    if ((tecla >= "97") && (tecla <= "122")) {
        return false;
    }
}

function Onlychars(e) {
    var tecla = new Number();
    if (window.event) {
        tecla = e.keyCode;
    } else if (e.which) {
        tecla = e.which;
    } else {
        return true;
    }
    if ((tecla >= "48") && (tecla <= "57")) {
        return false;
    }
}























        
