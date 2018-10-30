<%@page import="model.Utilitarios"%>
<%@page import="modelDAO.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
     <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="res/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/util.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/main.css"/>
      
      <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->
      <script src="//code.jquery.com/jquery-1.10.2.js"></script>
      <script>
         $(function(){
            $("#header").load("MenuNavBar.jsp");
            $("#footer").load("Footer.jsp");
         });
      </script>
      <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->
      
    <title>DropBooks</title>

		 
		 <!-- Bootstrap core CSS -->
    <link href="res/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="res/css/modern-business.css" rel="stylesheet">
    
 
    
  
	  
  </head>
  
  
  <body>
      
    <!-- Navigation -->
    <div id="header"></div>    
      
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

      <h1 class="my-4">Bem Vindo ao DropBooks!</h1>
      
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
      
      <h1 class="my-4">Populares</h1>
      
      <!-- Marketing Icons Section -->
      <%
          ArrayList<Produto> listaPop = ProdutoDAO.getProdutosPopulares();
      %>
      <div class="row">
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
              <h4 class="card-header"><% out.print(listaPop.get(0).getTitulo()); %></h4>
            <div class="card-body">
                <p class="card-text"><% out.print(Utilitarios.trimDesc(listaPop.get(0).getDescricao())); %></p>
            </div>
            <div class="card-footer">
              <a href="./pagProduto.jsp?id=<%=listaPop.get(0).getId()%>" class="btn btn-primary">Leia Mais</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header"><% out.print(listaPop.get(1).getTitulo()); %></h4>
            <div class="card-body">
              <p class="card-text"><% out.print(Utilitarios.trimDesc(listaPop.get(1).getDescricao())); %></p>
            </div>
            <div class="card-footer">
              <a href="./pagProduto.jsp?id=<%=listaPop.get(1).getId()%>" class="btn btn-primary">Leia Mais</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header"><% out.print(listaPop.get(2).getTitulo()); %></h4>
            <div class="card-body">
              <p class="card-text"><% out.print(Utilitarios.trimDesc(listaPop.get(2).getDescricao())); %></p>
            </div>
            <div class="card-footer">
              <a href="./pagProduto.jsp?id=<%=listaPop.get(2).getId()%>" class="btn btn-primary">Leia Mais</a>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->

      <!-- Portfolio Section -->
      <h2> Produtos Recentes</h2>
      <%
          ArrayList<Produto> listaRec = ProdutoDAO.getProdutosRecentes();
      %>
      <div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
              <a href="./pagProduto.jsp?id=<%=listaRec.get(0).getId()%>"><img class ="card-img-top" src="./imagens?id_prod=<%=listaRec.get(0).getId()%>&img=1" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="./pagProduto.jsp?id=<%=listaRec.get(0).getId()%>"><% out.print(listaRec.get(0).getTitulo()); %></a>
              </h4>
              <p class="card-text"><% out.print(Utilitarios.trimDesc(listaRec.get(0).getDescricao())); %></p>
                 <a href="./pagProduto.jsp?id=<%=listaRec.get(0).getId()%>" class="btn btn-primary">Leia Mais</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="./pagProduto.jsp?id=<%=listaRec.get(1).getId()%>"><img class ="card-img-top" src="./imagens?id_prod=<%=listaRec.get(1).getId()%>&img=1" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="./pagProduto.jsp?id=<%=listaRec.get(1).getId()%>"><% out.print(listaRec.get(1).getTitulo()); %></a>
              </h4>
              <p class="card-text"><% out.print(Utilitarios.trimDesc(listaRec.get(1).getDescricao())); %></p>
                 <a href="./pagProduto.jsp?id=<%=listaRec.get(1).getId()%>" class="btn btn-primary">Leia Mais</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="./pagProduto.jsp?id=<%=listaRec.get(2).getId()%>"><img class ="card-img-top" src="./imagens?id_prod=<%=listaRec.get(2).getId()%>&img=1" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="./pagProduto.jsp?id=<%=listaRec.get(2).getId()%>"><% out.print(listaRec.get(2).getTitulo()); %></a>
              </h4>
              <p class="card-text"><% out.print(Utilitarios.trimDesc(listaRec.get(2).getDescricao())); %></p>
                 <a href="./pagProduto.jsp?id=<%=listaRec.get(2).getId()%>" class="btn btn-primary">Leia Mais</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="./pagProduto.jsp?id=<%=listaRec.get(3).getId()%>"><img class ="card-img-top" src="./imagens?id_prod=<%=listaRec.get(3).getId()%>&img=1" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="./pagProduto.jsp?id=<%=listaRec.get(3).getId()%>"><% out.print(listaRec.get(3).getTitulo()); %></a>
              </h4>
              <p class="card-text"><% out.print(Utilitarios.trimDesc(listaRec.get(3).getDescricao())); %></p>
                 <a href="./pagProduto.jsp?id=<%=listaRec.get(3).getId()%>" class="btn btn-primary">Leia Mais</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="./pagProduto.jsp?id=<%=listaRec.get(4).getId()%>"><img class ="card-img-top" src="./imagens?id_prod=<%=listaRec.get(4).getId()%>&img=1" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="./pagProduto.jsp?id=<%=listaRec.get(4).getId()%>"><% out.print(listaRec.get(4).getTitulo()); %></a>
              </h4>
              <p class="card-text"><% out.print(Utilitarios.trimDesc(listaRec.get(4).getDescricao())); %></p>
                 <a href="./pagProduto.jsp?id=<%=listaRec.get(4).getId()%>" class="btn btn-primary">Leia Mais</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="./pagProduto.jsp?id=<%=listaRec.get(5).getId()%>"><img class ="card-img-top" src="./imagens?id_prod=<%=listaRec.get(5).getId()%>&img=1" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="./pagProduto.jsp?id=<%=listaRec.get(5).getId()%>"><% out.print(listaRec.get(5).getTitulo()); %></a>
              </h4>
              <p class="card-text"><% out.print(Utilitarios.trimDesc(listaRec.get(5).getDescricao())); %></p>
                 <a href="./pagProduto.jsp?id=<%=listaRec.get(5).getId()%>" class="btn btn-primary">Leia Mais</a>
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
  <div id="footer"></div>
  
        <!-- Back to top -->
        <div class="btn-back-to-top bg0-hov" id="myBtn">
            <span class="symbol-btn-back-to-top">
                <i class="fa fa-angle-double-up" aria-hidden="true"></i>
            </span>
        </div>

        <!-- Container Selection1 -->
        <div id="dropDownSelect1"></div>
    <!-- Bootstrap core JavaScript -->
    <script src="res/vendor/jquery/jquery.min.js"></script>
    <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    

  </body>

</html>

