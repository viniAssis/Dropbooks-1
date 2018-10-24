<%@page import="model.Utilitarios"%>
<%@page import="modelDAO.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page import="java.util.ArrayList"%>
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
    
     <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="res/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/util.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/main.css"/>

    <title>DropBooks</title>

		 
		 <!-- Bootstrap core CSS -->
    <link href="res/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="res/css/modern-business.css" rel="stylesheet">
    
    <style>
        
        .card-img-top{
            max-width: 500px;
            max-height: 300px;
        }
        
        #caixa2{
                margin-top: 5%;
                margin-left: 25%;
                margin-bottom: 3%;
                clear: both;
            }
            
                   #nav{
                                background: #090446;
                            }
                            .navbar .navbar-nav li a{
                                color: #FEB95F !important;
                                font-weight: 400;
                            }
                            .navbar .navbar-nav li a:hover{
                                color: #FEB95F !important;
                                font-weight: 400;
                                transform: scale(1);
                            }
                            .navbar-brand{
                                color: #FEB95F !important;
                                font-size: 24px;
                                font-weight: 700;
                            }
            #footer{
                background: #090446;
            }
            #corAmarelo{
                color:#FEB95F ;
            }
            #corBranca{
                color: white;
            }
           
            
    </style>
	  
  </head>
  
  

  <body>

    <!-- Navigation -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark  fixed-top" id="nav">
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
                                            + "<div class='dropdown-menu dropdown-menu-right' aria-labelledby='navbarDropdownPortfolio'>");
                                            if(!user.getNivel_usuario().equals("1")){
                                            out.print("<a class='dropdown-item' href='alterarFuncionarioAdm.jsp' id='link'>Alterar o Funcionário</a>"
                                                    + "<a class='dropdown-item' href='cadastroFuncionario.jsp' id='link'>Cadastrar Funcionário</a>"
                                                    + "<a class='dropdown-item' href='listaUsuarioFuncionario.jsp' id='link'>Lista de Funcionários</a>");               
                                            }
                                    out.print("<a class='dropdown-item' href='carrinho.jsp' id='link'>Carrinho</a>"
                                            + "<a class='dropdown-item' href='alterarCadastro.jsp' id='link'>Alterar Dados</a>"
                                            + "<a class='dropdown-item' href='catalogoLivro.jsp' id='link'>Meu Catalogo</a>"
                                            + "<a class='dropdown-item' href='cadastroProduto.jsp' id='link'>Cadastra Catalogo</a>"
                                            + "<a id='link' class='dropdown-item' href=Senha.jsp>Alterar Senha</a>"
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
        <footer class="bg6 p-t-45 p-b-43 p-l-45 p-r-45" id="footer">
            <div class="flex-w p-b-90">
                <div class="w-size6 p-t-30 p-l-15 p-r-15 respon3">
                    <h4	 id="corAmarelo">
                        Problemas
                    </h4>
                    <div>
                        <p class="s-text7 w-size27" id="corBranca">
                            Caso Tenha Qualquer Problema na Compra ou Venda do Seu livro Entre em Contato Para que seja Resolvido.
                            Agradecemos sua Visita. Volte Sempre !
                        </p>
                    </div>
                </div>
                <div class="w-size7 p-t-30 p-l-15 p-r-15 respon4">
                    <h4  class="s-text12 p-b-30" id="corAmarelo">
                        Categorias
                    </h4>
                    <ul>
                        <li class="p-b-9">
                            <a href="#" id="corBranca">
                                Ficção
                            </a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" id="corBranca">
                                Terror
                            </a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" id="corBranca">
                                Romance
                            </a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" id="corBranca">
                                Academicos
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="w-size7 p-t-30 p-l-15 p-r-15 respon4">
                    <h4 class="s-text12 p-b-30"  id="corAmarelo">Livros</h4>
                    <ul>
                        <li class="p-b-9"><a href="#" id="corBranca">Busca</a></li>
                        <li class="p-b-9"><a href="#" id="corBranca">Sobre Nós</a></li>
                        <li class="p-b-9"><a href="#" id="corBranca">Email</a></li>
                        <li class="p-b-9"><a href="#" id="corBranca">Local</a></li>
                    </ul>
                </div>
                <div class="w-size7 p-t-30 p-l-15 p-r-15 respon4">
                    <h4 class="s-text12 p-b-30"  id="corAmarelo">Ajuda</h4>
                    <ul>
                        <li class="p-b-9">
                            <a href="#" class="s-text7" id="corBranca">Dicas</a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" class="s-text7" id="corBranca">Como Vender</a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" class="s-text7" id="corBranca">Como Comprar</a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" class="s-text7" id="corBranca">FAQs</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="t-center p-l-15 p-r-15">
                <a href="#"><img class="h-size2" src="res/images/icons/paypal.png" alt="IMG-PAYPAL"></a>
                <a href="#"><img class="h-size2" src="res/images/icons/visa.png" alt="IMG-VISA"></a>
                <a href="#"><img class="h-size2" src="res/images/icons/mastercard.png" alt="IMG-MASTERCARD"></a>
                <a href="#"><img class="h-size2" src="res/images/icons/express.png" alt="IMG-EXPRESS"></a>
                <a href="#"><img class="h-size2" src="res/images/icons/discover.png" alt="IMG-DISCOVER"></a>
                <div class="t-center s-text8 p-t-20">
                    Copyright © 2018 Todos Direitos Reservados <i class="fa fa-heart-o" aria-hidden="true"></i> by DropBooks
                </div>
            </div>
        </footer>

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

