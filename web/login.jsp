
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="res/css/bootstrap.min.css" rel="stylesheet">
        <link href="res/css/style.css" rel="stylesheet">
        <script src="res/js/jquery.js"></script>
        <script src="res/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="res/jquery-3.3.1.js">
    <script type="text/javascript">
            $(document).ready(function(){
                    $('#enviar').click(function(){

            alert("");
            var email = $("#email").val();
            var senha = $("#senha").val();
            $.ajax({
            type:'POST',
                    url : "ServletLogin",
                    data : {
                    email : email,
                            senha : senha
            },
                    success : function(results){
                    if (results === "1"){
                    $("#email").css("color", "red");
                    }else if(results === "2"){
                            $("#senha").css("color", "red");
                             }els e{
                            $("#email").css("color", "green");
                    $("#senha").css("color", "green");
                     }
                    }
                    });
                    });
                    });
                                </script>
                                
        <style>
                                    
		#caixa2{
			margin-top: 5%;
			margin-left: 20%;
			margin-bottom: 3%;
			clear: both;

		}
                
                #container{
                    margin-top: 3%;
                         margin-bottom: 10%;
                         margin-left: 15%;
                }
        </style>
    </head>
    <body>
      		<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-primary fixed-top">
				<div class="container">
                                    <a class="navbar-brand" href="index.jsp">DropBooks</a>
					<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarResponsive">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item">
								<a class="nav-link" href="index.jsp">Home</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">Livro</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="Contato.jsp">Contato</a>
							</li>
							<!--
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">	Blog</a>
								<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
									<a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
									<a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
									<a class="dropdown-item" href="blog-post.html">Blog Post</a>
								</div>
							</li>

							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Portfolio</a>
								<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
									<a class="dropdown-item" href="portfolio-1-col.html">1 Column Portfolio</a>
									<a class="dropdown-item" href="portfolio-2-col.html">2 Column Portfolio</a>
									<a class="dropdown-item" href="portfolio-3-col.html">3 Column Portfolio</a>
									<a class="dropdown-item" href="portfolio-4-col.html">4 Column Portfolio</a>
									<a class="dropdown-item" href="portfolio-item.html">Single Portfolio Item</a>
								</div>
							</li>

							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Blog</a>
								<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
									<a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
									<a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
									<a class="dropdown-item" href="blog-post.html">Blog Post</a>
								</div>
							</li>

							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Other Pages</a>
								<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
									<a class="dropdown-item" href="full-width.html">Full Width Page</a>
									<a class="dropdown-item" href="sidebar.html">Sidebar Page</a>
									<a class="dropdown-item" href="faq.html">FAQ</a>
									<a class="dropdown-item" href="404.html">404</a>
									<a class="dropdown-item" href="pricing.html">Pricing Table</a>
								</div>
							</li>-->
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
 

        <div class="container col-lg-6" >
            <div class="row">
                <div class="formLogin col-md-8" id="container">
                    <p class="h3 text-center">Identifique-se</p>
                    <form action="Login" method="post">
                        <div class="form-group">
                            <label for="labelLogin">Email</label>
                            <input type="text" class="form-control" name="email" aria-describedby="email"
                                  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"  required="required"                                  
                                   placeholder="email@dominio.com"/>
                        </div>
                        <div class="form-group">
                            <label for="labelSenha">Senha</label>
                            <input type="password" class="form-control" name="senha" aria-describedby="senha" placeholder="*******">
                            <small class="text-left novaSenha "><a href="Senha.html">Esqueceu sua senha?</a></small>
                        </div>
                        <button type="submit" value="login" class="btn btn-primary btn-block">Enviar</button>
                    </form><hr>

                    <!--Adicionar link chamando um novo registro-->
                    <div class="goRegistro">
                        <label for="labelNovoReg">Primeira vez no Dropbooks?</label><br>
                         <a href="cadastro.html">
                        <button type="submit" class="btn btn-outline-primary btn-md btn-block">
                           Cadastre-se</button></a>
                    </div>
                </div><br>
            </div>
        </div>
        
            <!-- Footer -->
    <footer class="py-5 bg-primary">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; DropBooks</p>
      </div>
      <!-- /.container -->
    </footer>
    </body>

</html>
