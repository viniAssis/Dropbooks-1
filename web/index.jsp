<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>DropBooks</title>

		 
		 <!-- Bootstrap core CSS -->
    <link href="res/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="res/css/modern-business.css" rel="stylesheet">
    
    <style>
        #caixa2{
                margin-top: 5%;
                margin-left: 25%;
                margin-bottom: 3%;
                clear: both;
            }
    </style>
	  
  </head>
  
  

  <body>

    <!-- Navigation -->
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
                            <a class="nav-link" href="Contato.jsp">Contato</a>
                        </li>
                        <li class="nav-item">
                            <%
                                   
                                if(session.getAttribute("email") != null) {

                                    String email = request.getSession().getAttribute("email").toString();

                                    Usuario user = new UsuarioDAO().getUsuario(email);
                             
                                    out.print("</li>");
                                    out.print("<li class=nav-item>");
                                    out.print("<li class='nav-item dropdown'> "
                                            + "<a class='nav-link dropdown-toggle' href='#' id='navbarDropdownPortfolio' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"+ user.getNomeRazao() +"</a>"
                                            + "<div class='dropdown-menu dropdown-menu-right' aria-labelledby='navbarDropdownPortfolio'>"
                                            + "<a class='dropdown-item' href='alterarCadastro.jsp'>Alterar Dados</a>"
                                            + "<a class='dropdown-item' href='catalogoLivro.jsp'>Meu Catalogo</a>"
                                            + "<a class='dropdown-item' href='cadastroProduto.jsp'>Cadastra Catalogo</a>"
                                            + "<a class='dropdown-item' href=Senha.jsp>Alterar Senha</a>"
                                            + "<a class='dropdown-item' name=Sair href=SairServlet>Sair</a>"
                                            + "</div>"
                                            + "</li>");
                                    
                                } else {
                                    out.print("<a class=nav-link href=login.jsp>Login/Cadastrar</a>");
                                }        
                            %>   
                        </li>               
                    </ul>
                </div>
            </div>
        </nav>

    <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active" style="background-image: url('res/img/cr-1.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3> Direito</h3>
              <p>Livros Sobre Direito</p>
            </div>
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('res/img/cr-2.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>Economia</h3>
              <p>Administração e Contabilidade</p>
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('res/img/cr-3.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>Dicas De Leitura</h3>
              <p>Esta Perdido ? Nossa Equipe Pode te Ajudar</p>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </header>

    
                        
                        
    <!-- Page Content -->
    <div class="container">

      <h1 class="my-4">Bem Vindo DropBooks  Nossos Produdos</h1>
      
      <form id="caixa2" method='post' action="PesquisarLivrosServlet">
            <div class="form-row align-items-center">
                <div class="col-auto my-1">
                    <select class="custom-select mr-sm-2 border border-dark" id="tipoPesquisa" name="opcaoPesquisa">
                        <option  value="Titulo">Título</option>
                        <option  value="Autor">Autor</option>
                        <option  value="Editora">Editora</option>
                        <option  value="Genero">Genêro</option>
                    </select>
                </div>
                <div class="col-auto col-md-6">
                    <input class="form-control mr-sm-2 border border-dark" type="search" placeholder="Pesquisar" aria-label="Pesquisar" name="palavraChave">
                </div>
                <button type="submit" class="btn btn-primary" id="botao1" name="botao1">Pesquisa</button>
            </div>
        </form>
      
      <!-- Marketing Icons Section -->
      <div class="row">
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header">Harry Potter</h4>
            <div class="card-body">
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">Leia Mais</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header">O Mago</h4>
            <div class="card-body">
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis ipsam eos, nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur, sed eveniet, magni nostrum sint fuga.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">Leia Mais</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header"> A Sutil Arte de Ligar o Foda se</h4>
            <div class="card-body">
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">Leia Mais</a>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->

      <!-- Portfolio Section -->
      <h2> Produtos Novos</h2>

      <div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="res/img/img-3.jpg" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#"> Stephen King - Achados e Perdidos</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                 <a href="#" class="btn btn-primary">Leia Mais</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="res/img/img-1.jpg" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#"> Box - Harry Potter</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                 <a href="#" class="btn btn-primary">Leia Mais</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="res/img/img-2.jpg" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#"> Livro - P/todos garatos que ja Amei</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
                 <a href="#" class="btn btn-primary">Leia Mais</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="res/img/img-4.jpg" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Dan Brow </a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                 <a href="#" class="btn btn-primary">Leia Mais</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="res/img/img-5.jpg" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Watchmen</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                 <a href="#" class="btn btn-primary">Leia Mais</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="res/img/img-6.jpg" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#"> Box - A cronica do Matador de Rei</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque earum nostrum suscipit ducimus nihil provident, perferendis rem illo, voluptate atque, sit eius in voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
                 <a href="#" class="btn btn-primary">Leia Mais</a>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->

      <!-- Features Section -->
      <div class="row">
        <div class="col-lg-6">
          <h2> Gostou de Um Nossos Produtos  ?</h2>
          <p> Saiba avaliar siga essas caracterisitas basicas para uma boa Compra</p>
          <ul>
            <li>
              <strong> Folhas em bom estados</strong>
            </li>
            <li>Capa</li>
            <li>Mais 1 Livro da Mesmo autor + BOX</li>
            <li>Status do Vendedor</li>x    
            <li>Localização</li>
          </ul>
          <p>Caso Haja Problemas na Compra Entre em Contato  no Menu há Cima na Pagina de Contato</p>
        </div>
        <div class="col-lg-6">
          <img class="img-fluid rounded" src="https://media.giphy.com/media/TZ3Y3sUWzrquY/giphy.gif" alt="">
        </div>
      </div>
      <!-- /.row -->

      <hr>

      <!-- Call to Action Section -->
      <div class="row mb-4">
        <div class="col-md-8">
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
        </div>
        <div class="col-md-4">
          <a class="btn btn-lg btn-secondary btn-block bg-primary" href="#"> Deseja ver Mais </a>
        </div>
      </div>

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-primary">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy;  DropBooks 2x018</p>
      </div>
      <!-- /.container -->
    </footer>


    <!-- Bootstrap core JavaScript -->
    <script src="res/vendor/jquery/jquery.min.js"></script>
    <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    

  </body>

</html>

