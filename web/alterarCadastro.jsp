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

		*{
			color: black;
		}
		
		
		
		
		#form1{
			width: 60%;
			margin: 0 auto;
			margin-bottom: 5%;
			margin-top: 5%;	
			
		}

            .cabecalho{
                height: 40px;	
                width: 100%; 
                margin-bottom: 5%;
                margin: auto;
            }

            .login,.drop{
                float: right;
                font-size: 18px;
                color: white;
            }

            .drop{margin-right: 25%;}

            #caixa2{
                margin-top: 5%;
                margin-left: 25%;
                margin-bottom: 3%;
                clear: both;
            }

            .container{
                width: 40%;
                margin-left: 30%;
                margin-bottom:7%;
                margin-top: 5%;	
                background: #CFCFCF;
                border-radius: 15px 15px 15px 15px;
            }

            #texto{font-size: 20px;}

            .titulo1{
                color: black;
                padding: 3%;	
                text-align: center;	
                margin-bottom: 2%;

            }

            body{background-image: url(res/img/bgPadrao.jpg);}

            #botao1{
                background: #008B8B;
                border:  #008B8B;

            }

            #botao2{
                margin-bottom: 3%;
                width: 75%;
                background: #008B8B;


            } 

            .alerta{color: #C1839F;}

            nav >a{
                font-size: 22px;
                color: white;
				margin-bottom: 5%;
            }


            #menu a:hover{
                color: black;
            }

            a:hover{
                color: black;
                text-decoration: none;
            }
		
			h3{
			text-align: center;	
			margin-top: 5px;
			margin-bottom: 2%;
			color: black;
		}
		
		
		#caixa{
			
			float: left;
			width: 42%;
			margin-left: 5%;
		}
			.titulo{
			margin-left: 32%;
			margin-bottom: 3%;
			font-size: 20px;
		}
		
		#btnAlterar{
			margin: 0 auto;
			background: #C1839F;;
			color: black;
			margin-left: 30%;
			width: 40%;
			margin-top: 30px;
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

            String email = request.getSession().getAttribute("email").toString();

            
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
		
		<div class="cabecalho">
			<p class="login">Bem Vindo(a)<%= user.getNomeRazao()%></p>
			<span class="drop">Droopboks</span>
		</div>


		<form id="caixa2">
			<div class="form-row align-items-center">
				<div class="col-auto my-1">
					<select class="custom-select mr-sm-2" id="tipoPesquisa">
					<option>Titulo</option>
					<option>Autor</option>
					<option>Editora</option>
					<option>Genêro</option>
					</select>
				</div>

				<div class="col-auto col-md-5">
					<input class="form-control mr-sm-2" type="search" placeholder="Pesquisar" aria-label="Pesquisar" name="pesquisa">
				</div>
				<button type="submit" class="btn btn-primary" id="botao1" name="botao1">Pesquisa</button>
			</div>
		</form>

		<nav class="nav nav-pills flex-column flex-sm-row" id="menu">
			<a class="flex-sm-fill text-sm-center nav-link" href="#">Home</a>
			<a class="flex-sm-fill text-sm-center nav-link" href="#">Livro</a>
			<a class="flex-sm-fill text-sm-center nav-link" href="#">FAQ</a>
			<a class="flex-sm-fill text-sm-center nav-link" href="Contato.jsp">Contato</a>
		</nav>

		<h3 id="nome">Olá, <%= user.getNomeRazao()%> </h3>

		<form id="form1" action="AlterarUsuarioServlet">

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
			
			<button type="submit" class="btn btn-primary" id="btnAlterar" >Alterar</button>

		</form>	
	</div> 
	  
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