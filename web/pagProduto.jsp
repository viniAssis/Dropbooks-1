<%-- 
    Document   : pagProduto
    Created on : 15/10/2018, 16:22:22
    Author     : vinim
--%>

<%@page import="modelDAO.ProdutoDAO"%>
<%@page import="model.Produto"%>
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

        <title> Item</title>

        <!-- Bootstrap core CSS -->
        <link href="res/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="res/css/portfolio-item.css" rel="stylesheet">

        <%
            Produto prod = new ProdutoDAO().getProduto(Integer.parseInt(request.getParameter("id")));
        
        %>
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
                                //VARIAVEIS QUE VÃO PREENCHER OS CAMPOS VAZIOS COM OS DADOS DO USUARIO(SE ESTIVER LOGADO)
                                String _email = "";
                                String _nome = "";
                                //IDENTIFICA SE O USUARIO ESTA LOGADO E TRAZ SEUS DADOS PARA A PAGINA, SE NAO ESTIVER LOGADO, MOSTRA O LINK PARA QUE O IMUNDO POSSA SE LOGAR
                                if (session.getAttribute("email") != null) {

                                    String email = request.getSession().getAttribute("email").toString();

                                    Usuario user = new UsuarioDAO().getUsuario(email);
                                    _email += user.getEmail();
                                    _nome += user.getNomeRazao();
                                    
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
        

        <!-- Page Content -->
        <div class="container">

            <!-- Portfolio Item Heading -->
            <h1 class="my-4"><%=prod.getTitulo()%>

            </h1>

            <!-- Portfolio Item Row -->
            <div class="row">

                <div class="col-md-8">
                    <img class="img-fluid" src="./imagens?id_prod=<%=prod.getId()%>&img=1" alt="">
                </div>

                <div class="col-md-4">
                    <h3 class="my-3">Descrição</h3>
                    <p><label><%=prod.getDescricao()%> </label></p>
                    <h3 class="my-3">Detalhes</h3>

                    <ul>
                        <li>Autor: <%=prod.getAutor()%></li>
                        <li>Editora: <%=prod.getEditora()%></li>
                        <li>Data de registro no sistema: <%=prod.getDataRegistro()%></li>
                        <li>Data de publicação: <%=prod.getDataPublicacao()%></li>
                        <li>Genero: <%=prod.getGenero()%></li>
                        <li>Idioma: <%=prod.getIdioma()%></li>
                        <li>Preco: R$<%=prod.getPreco()%></li>
                        <li>Quantidade de livros: <%=prod.getQuantidade()%></li>

                    </ul>
                    <div class="my-3 cep">
                        <p>Calcular Frete</p>
                        <div class="col-xs-2  button2">
                            <input class="form-control" id="frete" type="text" placeholder="_____-___" />
                        </div>

                        <button class="button button1" name="CalculaCEP" value="Calcular">OK</button>

                    </div>
                    <div class="compra"> 
                        <input type="button" class="btn btn-info " value="Comprar" id="btnComprar">
                        <button type="button" class="btn btn-secondary">Adicionar Carrinho</button>
                    </div>



                </div>
                <!-- /.row -->

                <!-- Related Projects Row -->
                <h3 class="my-4">Fotos Produtos</h3>

                <div class="row">

                    <div class="col-md-3 col-sm-6 mb-4">
                        <a href="#">
                            <img class="img-fluid" src="./imagens?id_prod=<%=prod.getId()%>&img=2" alt="">
                        </a>
                    </div>

                    <div class="col-md-3 col-sm-6 mb-4">
                        <a href="#">
                            <img class="img-fluid" src="./imagens?id_prod=<%=prod.getId()%>&img=3" alt="">
                        </a>
                    </div>

                    <div class="col-md-3 col-sm-6 mb-4">
                        <a href="#">
                            <img class="img-fluid" src="./imagens?id_prod=<%=prod.getId()%>&img=4" alt="">
                        </a>
                    </div>

                    <div class="col-md-3 col-sm-6 mb-4">
                        <a href="#">
                            <img class="img-fluid" src="./imagens?id_prod=<%=prod.getId()%>&img=5" alt="">
                        </a>
                    </div>


                </div>

                <!-- /.row -->

            </div>
            <!-- /.container -->
        </div>

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

