<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>Cadastrar Produtos</title>


		<!-- Bootstrap core CSS -->
		<link href="res/css/bootstrap.min.css" rel="stylesheet">

		<!-- Custom styles for this template -->
		<link href="res/css/modern-business.css" rel="stylesheet">
                <!-- Custom styles for this template -->
                <link href="res/css/modern-business.css" rel="stylesheet">

		<script src="res/jquery-3.3.1.js"></script>
		<link href="res/js/dist/dropdown.js" rel="stylesheet">
                
		<style>

		#caixa2{
			margin-top: 5%;
			margin-left: 20%;
			margin-bottom: 3%;
			clear: both;

		}

		#container1{
			width: 70%;
			height: 800px;
			margin:  0 auto;
			margin-top: 4%;
			margin-bottom: 7%;

		}

		.container1, .container2{
			display: block;
			float: left;
			width: 40%;
			height: 70%;
			margin-left: 7%;
			margin-bottom: 5%;
			margin-top: 5%;

		}

		.dropdown1{
			padding-top: 30px;
			padding-right: 60px;
			margin-left: 5%;


		}

		h4{text-align: center;}

		#botao{
			clear: both;
			margin-left: 15%;
		}

		#btnCad, #btnCanc{margin-left: 15%;}
			
			#texto{
				font-size: 18px;
				color: black;
			}	
		</style> 
                <%
                    String email = request.getSession().getAttribute("email").toString();
		   
                    Usuario user = new UsuarioDAO().getUsuario(email);
                    
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
                                                        <a class="nav-link" href="Contato.jsp">Contato</a>
                                                </li>
                                              
                                                <li class="nav-item">
                                                    <li class="nav-item dropdown"> 
                                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%= user.getNomeRazao()%></a>
                                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                                                    <a class="dropdown-item" href="alterarCadastro.jsp">Alterar Dados</a>
                                                    <a class="dropdown-item" href="catalogoLivro.jsp">Meu Catalogo</a>
                                                    <a class="dropdown-item" href="cadastroProduto.jsp">Cadastra Catalogo</a>
                                                    <a class="dropdown-item" href="Senha.jsp">Alterar Senha</a>
                                                    <a class="dropdown-item" name=Sair href=SairServlet>Sair</a>
                                                    </div>
                                                </li>
                			</ul>
				</div>
			</div>
		</nav>
		
		<form id="caixa2">
			<div class="form-row align-items-center">
				<div class="col-auto my-1">
					<select class="custom-select mr-sm-2 border border-dark" id="tipoPesquisa">
						<option selected>Titulo</option>
						<option>Autor</option>
						<option>Editora</option>
						<option>Genero</option>
				</select>
				</div>
				<div class="col-auto col-md-6">
					<input class="form-control mr-sm-2  border border-dark" type="search" placeholder="Pesquisar" aria-label="Pesquisar" name="pesquisa">
				</div>
				<button type="submit" class="btn btn-primary" id="botao1" name="botao1">Pesquisa</button>
			</div>
		</form> 

		<form method="post" id= "container1" action="CadastroProdutoServlet">
			
			<h4>Cadastro de Livro</h4>
			
			<div class="container1">
				<div  class="form-signin"> 
					<!-- Titulo do livro -->
					<div class="form-group">
						<label id="texto" >Titulo do Livro</label>
						<input type="text" class="form-control  border border-dark" id="nameLivro" name="nameLivro" required>
					</div>   
					
					<!-- Titulo do livro -->
					<div class="form-group">
						<label id="texto">Autor</label>
						<input type="text" class="form-control  border border-dark" id="nameAutor" name="nameAutor" required>
					</div>
					
					<!--Editora -->
					<div class="form-group">
						<label id="texto">Editora</label>
						<input type="text" class="form-control  border border-dark" id="nameEditora" name="nameEditora" required>
					</div>
					
					<!--Ano de Lançamento e Genero -->
					<div class="form-group">
						<div class="row">
							<div class="col">
								<label id="texto">Ano de Lançamento</label>
								<input type="date" class="form-control  border border-dark" id="anoLancamento" name="anoLancamento" required>
							</div>

							<div class="dropdown1">
								<select class="btn  dropdown-toggle  border border-dark" name="genero">
									<option selected>Romântico</option>
									<option>Literatura</option>
									<option>Suspense</option>

								</select>
							</div>
						</div>    
					</div>
					
					<!-- Fale um pouco -->
					<div class="form-group">
						<label id="texto">Fale um pouco sobre o conteúdo</label>
						<textarea class="form-control  border border-dark" id="descricao" name="descricao" placeholder="Descrição do produto" rows="3"></textarea>
					</div>
				</div>
			</div>

			<div class="container2">
				<div class="form-signin">
					
					<!-- Idioma -->
					<div class="form-group">
						<label id="texto">Idioma</label>
						<input type="text" class="form-control  border border-dark" id="idiomaLivro" name="idiomaLivro" required>
					</div>
					
					<!-- Quantidade -->
					<div class="form-group">
						<label id="texto">Quantidade</label>
						<input type="number" class="form-control  border border-dark" id="qtdLivro" name="qtdLivro" required>
					</div>
					
					<!-- Valor de cada Livro-->	
					<div class="form-group">
						<label id="texto">Valor do Livro</label>
						<input type="text" class="form-control  border border-dark" id="valorLivro" name="valorLivro" required>
					</div>
					
					<!-- Opção de Frente -->
					<label id="texto">Opções de frete </label>
					<div id="radio1">
						<div class="custom-control custom-radio">   
							<input type="radio" id="customRadio1" name="customRadio" class="custom-control-input" value="frete_gratis">
							<label class="custom-control-label" id="texto">Frete grátis</label>
						</div>
					</div>
					<div id="radio2">
						<div class="custom-control custom-radio">
							<input type="radio" id="customRadio2" name="customRadio" class="custom-control-input" value="frete_comprador">
							<label class="custom-control-label" id="texto">Frete por conta do comprador</label>
						</div>
					</div>
					
				</div>
			</div>
			
			<div id="botao">
				<button id="btnCad" type="submit" class="btn btn-primary">Cadastrar Livro</button>
				<button id="btnCanc" type="button" class="btn btn-primary">Cancelar</button>
			</div>

		</form>
		
		<!-- Footer -->
		<footer class="py-5 bg-primary">
			<div class="container">
				<p class="m-0 text-center text-white">Copyright &copy; DropBooks</p>
			</div>
		<!-- /.container -->
		</footer>

	<!-- Foi colocado no final para a página carregar mais rápido -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/popper.js"></script>
	<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
	<script src="res/js/bootstrap.min.js"></script>
	<!-- Só faz o nossos placeholders de imagens funcionarem. Não precisar copiar a próxima linha! -->
	<script src="res/js/bootstrap.bundle.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script src="res/vendor/jquery/jquery.min.js"></script>
        <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	</body>
</html>
