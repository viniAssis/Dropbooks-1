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
<html lang="pt-br">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script>
           $(function(){
              $("#header").load("MenuNavBar.jsp");
              $("#footer").load("Footer.jsp");
           });
        </script>
        <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->

        <title> Item</title>

        <!-- Bootstrap core CSS -->
        <link href="res/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="res/css/portfolio-item.css" rel="stylesheet">
        <%
            Produto prod = new ProdutoDAO().getProduto(Integer.parseInt(request.getParameter("id")));
            Usuario userProd = new UsuarioDAO().getUserById(prod.getId_usuario());
            if (session.getAttribute("email") != null) {

                String email = request.getSession().getAttribute("email").toString();
                Usuario user = new UsuarioDAO().getUsuario(email);
                
                if(user.getId() != prod.getId_usuario()){
                    response.sendRedirect("paginaNaoEncontrada.jsp");
                }
                
            }else{
                    response.sendRedirect("paginaNaoEncontrada.jsp");
               
            }
            response.setContentType("text/html;charset=UTF-8");
        %> 
       
        <script>
            document.getElementById("<%= prod.getIdioma() %>").selected = true;
        </script>
        
    </head>

    <body>
        <!-- Navigation -->
        <div id="header"></div>

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
                    <h3 class="my-3">Informações do produto</h3>     
                    
                        <form id="form1" action="AlterarProdutoServlet"> 
                            <ul>
                                <input style="display:none" type="text"  name="idProduto" id="idProduto"  maxlength="1" value="<%= prod.getId() %>"  required>
                                
                                <li>Título: <input type="text" class="form-control border border-dark" id="nameTitulo" name="nameTitulo" type="text" value="<%= prod.getTitulo() %>" required/></li>
                                
                                <li>Autor: <input type="text" class="form-control border border-dark" id="nameAutor" name="nameAutor" type="text" value="<%= prod.getAutor() %>" required/></li>
                                
                                <li>Editora: <input type="text" class="form-control border border-dark" name="nameEditora" id="nameEditora" value="<%= prod.getEditora() %>" required></li>


                                <li>Data de publicação: <input type="date" class="form-control border border-dark" name="nameData" id="nameData" class="cxs1" value="<%= prod.getDataPublicacao() %>" required></li>


                                <li>Genero: <input type="text" class="form-control border border-dark" name="menuGenero" id="menuGenero" value="<%= prod.getGenero()%>" required></li>


                                <li>Idioma:</li>
                                <select id="nameIdioma" name="menuIdioma" id="menuIdioma" class="form-control border border-dark" text="<%= prod.getIdioma() %>" required>
                                    <option value="<%= prod.getIdioma() %>" selected><%= prod.getIdioma() %></option>
                                    <option value="Portugues">Portugues</option>
                                    <option value="Ingles">Ingles</option>
                                    <option value="Espanhol">Espanhol</option>
                                </select>

                                <li>Preço: </li>
                                <input type="number" class="form-control border border-dark" name="namePreco" id="namePreco" value="<%= prod.getPreco()%>" step="0.010" required>
                                
                                <li>Quantidade de livros: </li>
                                <input type="number" class="form-control border border-dark" name="nameQuantidade" id="nameQuantidade" value="<%= prod.getQuantidade()%>" required>
                                
                                <li>Descrição do livro: </li>
                                <textarea class="form-control  border border-dark" id="nameDescricao" name="nameDescricao" rows="3" required><%= prod.getDescricao() %></textarea>
                                
                            </ul>
                                <button type="submit" class="btn btn-primary"  >Alterar Informações</button>
                        </form>



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
            <div id="footer"></div>
            
            <!-- Bootstrap core JavaScript -->
            <script src="res/vendor/jquery/jquery.min.js"></script>
            <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="res/js/calculoFrete.js"></script>
    </body>

</html>

