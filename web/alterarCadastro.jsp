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

		<!-- Bootstrap core CSS -->
		<link href="res/css/bootstrap.min.css" rel="stylesheet">

		<!-- Custom styles for this template -->
		<link href="res/css/modern-business.css" rel="stylesheet">

		<script src="res/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="res/jquery-3.3.1.js"></script>		
		<style>
			#form1{
				width: 60%;
				margin: 0 auto;
				margin-bottom: 5%;
				margin-top: 5%;	
			}
			
			#nome{
				text-align: center;
			}

			#caixa2{
				margin-top: 5%;
				margin-left: 25%;
				margin-bottom: 3%;
				clear: both;
			}
			
			#btnAlterar{			
				margin-left: 30%;
				width: 40%;
				margin-top: 30px;
			}
			
			#texto{
				font-size: 20px;
				color: black;
			}

		</style>
		
		<% 
		//	Usuario user = new Usuario();

			String email = request.getSession().getAttribute("email").toString();
		   
			Usuario user = new UsuarioDAO().getUsuario(email);

                        String masc = null;
                        String fem = null;

                        if(user.getSexo().equals("M") || user.getSexo().equals("m")){
                        masc = "checked";
                        }else{
                        fem = "checked";
                        }
		%>


		
		
	</head>
	<body>

		<!-- Navigation -->
		<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-primary fixed-top">
			<div class="container">
				<a class="navbar-brand" href="index.jsp">DropBooks</a>
				<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item">
							<a class="nav-link" href="index.jsp">Home</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="catalogoLivro.jsp">Livro</a>
						</li>
                                                   
					</ul>
				</div>
			</div>
		</nav>

		<form id="caixa2">
			<div class="form-row align-items-center">
				<div class="col-auto my-1">
					<select class="custom-select mr-sm-2" id="tipoPesquisa">
						<option selected>Titulo</option>
						<option>Autor</option>
						<option>Editora</option>
						<option>Genero</option>
					</select>
				</div>
				<div class="col-auto col-md-6">
					<input class="form-control mr-sm-2" type="search" placeholder="Pesquisar" aria-label="Pesquisar" name="pesquisa">
				</div>
				<button type="submit" class="btn btn-primary" id="botao1" name="botao1">Pesquisa</button>
			</div>
		</form>

		<h3 id="nome">Olá, <%= user.getNomeRazao()%> </h3>

		<form id="form1" action="AlterarUsuarioServlet">

			<!-- Email -->
			<div class="form-group row">
				<label id="texto" class="col-sm-3 col-form-label ">Email:</label>
				<div class="col-sm-9">
					<input type="email"readonly class="form-control border border-dark" id="inputEmail3" name="hEmail" value="<%= user.getEmail()%>">
				</div>
			</div>

			<!-- Nome/Razão Social -->
			<div class="form-group row">
				<label class="col-sm-3 col-form-label" id="texto">Nome/Razão Social:</label>
				<div class="col-sm-9">
					<input type="text" class="form-control  border border-dark" id="inputNome" name="hNome" value="<%= user.getNomeRazao()%>" >
				</div>
			</div>
			
			<!-- Data de Nascimento -->
			<div class="form-group row">
				<label class="col-sm-3 col-form-label" id="texto">Data de Nascimento:</label>
				<div class="col-sm-3">
					<input type="date" class="form-control  border border-dark" id="inputData" name="hData" value="<%= user.getDataNascimento()%>">
				</div>
			</div>
			
			<!-- Sexo  -->
			<div class="form-group row">	
				<label id="texto" class="col-sm-3 col-form-label">Sexo:</label>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="sexoPessoa" id="sxFem" value="F" <% out.print(fem); %> required>
					<label class="form-check-label" id="texto">Feminino</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="sexoPessoa" id="sxMas" value="M" <% out.print(masc); %> required>
					<label class="form-check-label" id="texto">Masculino</label>
				</div>
			</div>

			<!-- Telefone  -->
			<div class="form-group row">
				<label id="texto" class="col-sm-3 col-form-label">Telefone:</label>
				<div class="col-4">
					<input type="text" class="form-control  border border-dark" placeholder="xx xxxxx-xxxx" id="inputTelefone" name="hTelefone" value="<%= user.getTelefone()%>">
				</div>
			</div>

			<!-- CEP, Endereço e Numero  -->
			<div class="form-row">
				<div class="form-group col-md-4">
					<label id="texto">CEP</label>
					<input type="text" class="form-control  border border-dark" id="inputCEP" name="hCEP" value="<%= user.getCep()%>">
				</div>
				<div class="form-group col-md-4">
					<label id="texto">Endereço</label>
					<input type="text" class="form-control  border border-dark" id="inputCidade" name="hBairro" value="<%= user.getBairro()%>">
				</div>
				<div class="form-group col-md-4">
					<label id="texto">Numero</label>
					<input type="text" class="form-control  border border-dark" id="inputNumero" name="hNumero" value="<%= user.getNumero()%>">
				</div>
			</div>

			<!-- Estado, Complemento e Bairro -->
			<div class="form-row">
				<div class="form-group col-md-4">
					<label id="texto">Estado</label>
					<input type="text" class="form-control  border border-dark" id="inputNumero" name="hEstado"  value="<%= user.getEstado()%>">
				</div> 
				<div class="form-group col-md-4">
					<label id="texto">Complemento</label>
					<input type="text" class="form-control  border border-dark " id="inputCity" name="hComplemento" value="<%= user.getComplemento()%>">
				</div>
				<div class="form-group col-md-4">
					<label id="texto">Bairro</label> 
					<input type="text" class="form-control  border border-dark"  id="inputBairro" name="hBairro" value="<%= user.getBairro()%>">
				</div>
			</div>
			
			<!-- Cidade  -->
			<div class="form-row">
				<div class="form-group col-md-3">
					<label id="texto">Cidade</label> 
					<input type="text" class="form-control  border border-dark" id="inputCity" name="hCidade" value="<%= user.getCidade()%>">
				</div>
			</div>
			
			<button type="submit" class="btn btn-primary" id="btnAlterar" >Alterar</button>

		</form>	
				<!-- Footer -->
		<footer class="py-5 bg-primary">
		  <div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; DropBooks</p>
		  </div>
		  <!-- /.container -->
		</footer>


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