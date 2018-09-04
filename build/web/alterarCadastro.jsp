<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <!-- Meta tags Obrigatórias -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
 	<style>
	  
		#pesquisa{
			
			width: 50%;
		}
		
		#v-pills-tab{
			 width: 20%;
			float: left;
				
		}
	  	
		#form1{
			width: 60%;
			float: left;
			margin-left: 8%;
			margin-bottom: 5%;
			margin-top: 5%;	
			
		}
		
		#caixa{
			
			float: left;
			width: 42%;
			margin-left: 5%;
		}
		
		#botao{
			margin-top: 10%;
			margin-left: 40%;
			background-color:#582B11;
			border: 1px solid #582B11;
			font-size: 20px;
		}
		
		#texto{
			font-size: 20px;
		}
				
		.titulo{
			margin-left: 32%;
			margin-bottom: 3%;
			font-size: 20px;
		}
		
		.titulo2{
			
			color: #582B11;
			border: 1px solid #A57F60;
			padding: 0.5%;
			
		}
		
		hr{
			clear: both;
			margin-top: 5%;
		}
		
		#infor{
			width: 20%;
			float: left;
			margin-bottom: 2%;
		}
		
		#drop{
			margin-left: 5%;
		}
		
		#cabelho{
			margin-left: 30%;
			margin-bottom: 5%;
		}
		
		#caixa1{
			display: inline-block;
			float: right;
			margin-right: 2%;
		}
		
		#caixa2{
			margin-left: 25%;
			margin-bottom: 3%;
		}
		
		#menu1{
			margin-bottom: 5%;
		}
		
		.nav-item, a{
			background: #582B11;
			color: white;
			padding: 0.5%;
			font-size: 18px;
		}
		
		.nav-item, a:hover {
			color: #C6AD94;
		}
		
		h3{
			text-align: center;	
			margin-bottom: 2%;
			color: #A57F60;
		}
		
		.menu2> a {
			background: #582B11;
			color: white;
			padding: 3%;
			font-size: 18px;
			text-align: center;			
			border-bottom:3px solid #C6AD94;
		}
		
		.menu2{
			margin-top: 5%;
			
		}
		
		#corBotao{
			background-color:#582B11;
			border: 1px solid #582B11;
			color: white;
		}
			
		#links{
			background: #582B11;
			padding: 3%;
			font-size: 16px;
			margin-top: 2%;
			width: 120%;
		}
		
		footer{
			text-align: center;
			font-size: 20px;
			font-weight:  bold;
		}
		
	  </style>
          
          <script type="text/javascript" src="res/jquery-3.3.1.js"></script>
    <script type="text/javascript">
        $("#btnAlterar").click(function(){
            
            if(("#inputNome").val() == "" ){
                alert("Preencha o campo Nome");
            }
            
        });
                 
        
    </script>
          
          <% 
            //Usuario user = new Usuario();
            String email = "teste@teste.com";//request.getSession().getAttribute("email").toString();
            
            Usuario user = new UsuarioDAO().getUsuario(email);

            String masc = null;
            String fem = null;
            
            if(user.getSexo().equals("m")){
                masc = "checked";
            }else{
                fem = "checked";
            }
          %>
          
          
          
  </head>
  <body>
	  <div class="container-fluid">
		  
		<div id="cabelho">
		  	<img src="res/img/logo.png">
		  	<img src="res/img/nome.png" id="drop">
		  </div>
		  
		<section id="caixa1">
		 	<label id="nome"></label>
	  		<img src="res/img/carrinho.jpg" id="imagens">
		  </section>
		  
		<form id="caixa2">
  			<div class="form-row align-items-center">
    			<div class="col-auto my-1">
      					<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
        					<option>Titulo</option>
  							<option>Autor</option>
  							<option>Editora</option>
  							<option>Genêro</option>
      					</select>
    			</div>
 
				<div class="col-auto my-1" id="pesquisa">
					<input class="form-control col-md-15" type="text" placeholder="Search">		
				</div>
					<button class="btn btn-outline-success col-md-1" type="submit" id="corBotao">Pesquisar</button>
  			</div>
		</form>
		  
		<ul class="nav nav-pills nav-fill" id="menu1">
  			<li class="nav-item"> <a class="nav-link" href="teste.html">Home</a></li>
 			<li class="nav-item"> <a class="nav-link" href="#">Livros</a></li>
  			<li class="nav-item"> <a class="nav-link" href="#">FAQ</a> </li>
  			<li class="nav-item"> <a class="nav-link" href="#">Contato</a> </li>
  			<li class="nav-item"> <a class="nav-link" href="#">Meus Dados</a> </li>
			
		</ul>
		
		<h3 id="nome">Olá, <%= user.getNomeRazao()%> </h3>
		
		<div class="menu2" id="v-pills-tab" role="tablist" aria-orientation="vertical">
  			<a class="nav-link" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Meus Dados</a>
  			<a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Catálogo de Livros</a>
			<a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Acionar minhas vendas</a>
			<a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Minhas Compras</a>
		</div>
	  
                <form id="form1" action="AlterarUsuarioServlet">
			<h3 class="titulo2">Meus Dados</h3>
  			<div class="form-group row">
    			<label id="texto" class="col-sm-3 col-form-label">Email:</label>
    			<div class="col-sm-9">
                            <input type="email"readonly class="form-control" id="inputEmail3" name="hEmail" value="<%= user.getEmail()%>">
    			</div>
  			</div>
 
			
			<div class="form-group row">
    				<label class="col-sm-3 col-form-label" id="texto">Nome Completo:</label>
    				<div class="col-sm-9">
                                    <input type="text" class="form-control" id="inputNome" name="hNome" value="<%= user.getNomeRazao()%>" >
    				</div>
  				</div>
			
			<div class="form-group row">
    				<label class="col-sm-4 col-form-label" id="texto">Data de Nascimento:</label>
    				<div class="col-sm-3">
                                    <input type="date" class="form-control" id="inputData" name="hData" value="<%= user.getDataNascimento()%>">
    				</div>
  				</div>
			
			<div class="form-group row">	
				<label id="texto" class="col-sm-4 col-form-label">Sexo:</label>
				<div class="form-check form-check-inline">
  					<input class="form-check-input" type="radio" name="sexoPessoa" id="sxFem" value="F" <% out.print(fem); %> required>
  					<label class="form-check-label" id="texto">Feminino</label>
				</div>
				<div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="sexoPessoa" id="sxMas" value="M" <% out.print(masc); %> required>
  					<label class="form-check-label" id="texto">Masculino</label>
				</div>
			</div>
			
			<div class="form-group row">
    			<label id="texto" class="col-sm-4 col-form-label">Telefone:</label>
    			<div class="col-3">
                            <input type="text" class="form-control" placeholder="xx xxxxx-xxxx" id="inputTelefone" name="hTelefone" value="<%= user.getTelefone()%>">
		    	</div>
  			</div>
			
			<div class="form-row">
				<div class="form-group col-md-2">
      				<label id="texto">CEP</label>
                                <input type="text" class="form-control" id="inputCEP" name="hCEP" value="<%= user.getCep()%>">
				</div>
    			<div class="form-group col-md-6">
      				<label id="texto">Endereço</label>
                                <input type="text" class="form-control" id="inputCidade" name="hBairro" value="<%= user.getBairro()%>">
    			</div>
				<div class="form-group col-md-3">
      				<label id="texto">Numero</label>
                                <input type="text" class="form-control" id="inputNumero" name="hNumero" value="<%= user.getNumero()%>">
				</div>
  			</div>
			
			<div class="form-row">
				<div class="form-group col-md-4">
      				<label id="texto">Estado</label>
                                <select id="inputEstado" class="form-control" name="hEstado" value="<%= user.getEstado()%>">
        					<option selected>Acre</option>
        					<option selected>Alagoas</option>
        					<option selected>Amapá</option>
        					<option selected>Amazonas</option>
        					<option selected>Bahia</option>
        					<option selected>Ceará</option>
        					<option selected>Distrito Federal</option>
        					<option selected>Espírito Santo</option>
        					<option selected>Goiás</option>
        					<option selected>Maranhão</option>
        					<option selected>Mato Grosso</option>
        					<option selected>Mato Grosso do Sul</option>
        					<option selected>Minas Gerais</option>
        					<option selected>Pará</option>
        					<option selected>Paraíba</option>
        					<option selected>Paraná</option>
        					<option selected>Pernambuco</option>
        					<option selected>Piauí</option>
        					<option selected>Rio de Janeiro</option>
        					<option selected>Rio Grande do Norte</option>
        					<option selected>Rio Grande do Sul</option>
        					<option selected>Rondônia</option>
        					<option selected>Roraima</option>
        					<option selected>Santa Catarina</option>
        					<option selected>São Paulo</option>
        					<option selected>Sergipe</option>
        					<option selected>Tocantins</option>
        					
      					</select>
    			</div> 
    			<div class="form-group col-md-4">
      				<label id="texto">Complemento</label>
                                <input type="text" class="form-control" id="inputCity" name="hComplemento" value="<%= user.getComplemento()%>">
    			</div>
				<div class="form-group col-md-3">
      				<label id="texto">Bairro</label>
                                <input type="text" class="form-control" id="inputBairro" name="hBairro" value="<%= user.getBairro()%>">
				</div>
  			</div>
			
			<div class="form-row">
				<div class="form-group col-md-3">
      				<label id="texto">Cidade</label>
                                <input type="text" class="form-control" id="inputCity" name="hCidade" value="<%= user.getCidade()%>">
				</div>
				
  			</div>
			
			<h3 class="titulo2">Alterar Email ou Senha</h3>
			
  			<div id="caixa">
  				
  				<div class="form-group">
    				<label  class="titulo">Nova Senha</label>
    				<input type="password" class="form-control">
  				</div>
			  <div class="form-group">
    				<label  class="titulo">Repita a Senha</label>
    				<input type="password" class="form-control">
  				</div>
			</div>
			
			<div id="caixa">
  				
  				<div class="form-group">
    				<label class="titulo">Novo Email</label>
    				<input type="email" class="form-control">
  				</div>
			  <div class="form-group">
    				<label class="titulo">Repita o Email</label>
    				<input type="email" class="form-control">
  				</div>
  				
			</div>
			<button type="submit" class="btn btn-primary" id="btnAlterar" class="">Alterar</button>

		  </form>	
				
		 <hr>
		  
		<div id="infor">
		  	<div class="form-group col-md-7">
      			<label class="titulo">Contato</label><br/>
				<label id="texto">(11) 32585-9685</label>
				<a href="#" class="badge badge-info" id="links">Fale Conosco</a>
			</div>
		</div>
		
		<div id="infor">
		  	<div class="form-group col-md-5">
      			<label class="titulo">Serviços</label><br/>
				<a href="#" class="badge badge-info" id="links">Venda seu livro</a><br/>
				<a href="#" class="badge badge-info" id="links">FAQ</a>
				
			</div>
		</div>		
			
		 <div id="infor">
		  	<div class="form-group col-md-10">
      			<label class="titulo">Meio de Pagamento</label><br/>
				<!--<img src="" class="img-fluid" alt="Imagem responsiva">-->
			</div>
		</div>	
		    
		 <div id="infor">
		  	<div class="form-group col-md-10">
      			<label class="titulo">Certificação</label><br/>
				<!--<img src="" class="img-fluid" alt="Imagem responsiva">-->
			</div>
		</div>	  
		  
		 <div id="infor">
		  	<div class="form-group col-md-10">
      			<label 	class="titulo">Instituição</label><br/>
				<a href="#" class="badge badge-info" id="links">Sobre o DropBooks</a><br/>
				<a href="#" class="badge badge-info" id="links">Termos de Uso</a>
				<a href="#" class="badge badge-info" id="links">Segurança e Privacidade</a>
			</div>
		</div> 
		
	  </div> 
	  
	  <footer>Copyrigth&copy; - 2018 www.dropbooks.com, todos os direiro reservados</footer>
    <!-- JavaScript (Opcional) -->
    <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
    <script type="text/javascript">
        $(function(){
            $("#inputEstado").val("<% out.print(user.getEstado()); %>");
        });
        
        $(function(){
            $("#inputEstado").val("<% out.print(user.getEstado()); %>");
        });
        
    </script>
  </body>
</html>