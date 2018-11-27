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
        
        <style>
            .box-imagem > input{
                display:none;
            }
            .box-imagem{
                cursor: pointer;
            }
            
            /**/
             .foto-hover2 {
                position: absolute;
                width: 90%;
                height: 100%;
                background: url(res/img/pencil-white.svg) center center / 50px no-repeat rgba(0, 0, 0, .5);
                opacity: 0;
                top: 0;
                
             }
             .foto-hover2:hover{
                 opacity: 1;
             }
            
            /**/
             .foto-hover3 {
                position: absolute;
                width: 90%;
                height: 100%;
                background: url(res/img/pencil-white.svg) center center / 50px no-repeat rgba(0, 0, 0, .5);
                opacity: 0;
                top: 0;
                
             }
             .foto-hover3:hover{
                 opacity: 1;
             }
            
            /**/
             .foto-hover4 {
                position: absolute;
                width: 90%;
                height: 100%;
                background: url(res/img/pencil-white.svg) center center / 50px no-repeat rgba(0, 0, 0, .5);
                opacity: 0;
                top: 0;
                
             }
             .foto-hover4:hover{
                 opacity: 1;
             }
            
            /**/
             .foto-hover5 {
                position: absolute;
                width: 90%;
                height: 100%;
                background: url(res/img/pencil-white.svg) center center / 50px no-repeat rgba(0, 0, 0, .5);
                opacity: 0;
                top: 0;
                
             }
             .foto-hover5:hover{
                 opacity: 1;
             }
             /**/
             .foto-hover-principal {
                position: absolute;
                width: 96%;
                height: 100%;
                background: url(res/img/pencil-white.svg) center center / 50px no-repeat rgba(0, 0, 0, .5);
                opacity: 0;
                top: 0;
                
             }
             .foto-hover-principal:hover{
                 opacity: 1;
             }
             
             .info, #foto, #nomeP{
                   color: #090446;
             }
             
             #alterar{
                background: #090446;
                color:#FEB95F;
            } 
            
        </style>
        
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
            //document.getElementById("<= prod.getIdioma() %>").selected = true;
            
            /*function previewFile(){
       var preview = document.querySelector('#img-1'); //selects the query named img
       var file    = document.querySelector('#imagem_1').files[0]; //sames as here
       var reader  = new FileReader();

       reader.onloadend = function () {
           preview.src = reader.result;
       }

       if (file) {
           reader.readAsDataURL(file); //reads the data as a URL
       } else {
           preview.src = "";
       }
  }
  
	function teste(){
		document.getElementById("imagem_1").click();
	
	}*/
        
        $(window).load(function() {
            //$(".imagens:eq(1)").children(2);
            $(".box-imagem").click( function(){
                
                
                //var file    = this.children[1].files[0]; //sames as here
                //var file    = this.children[1]; //sames as here
                var file    = this.querySelector("input"); //sames as here
                var preview = this.querySelector("img"); //selects the query named img
                
                file.click();
                
                file.onchange = function(){
                
                    var reader  = new FileReader();

                     reader.onloadend = function () {
                        preview.src = reader.result;
                     }

                    if (file.files[0]) {
                        reader.readAsDataURL(file.files[0]); //reads the data as a URL
                    } else {
                        preview.src = "";
                    }
                }
            });
            
        });
        
        
        
        
            
            
        </script>
        
    </head>

    <body>
        <!-- Navigation -->
        <div id="header"></div>

        <!-- Page Content -->
        <div class="container">

            <!-- Portfolio Item Heading -->
            <h1 class="my-4" id="nomeP"><%=prod.getTitulo()%>

            </h1>

            <!-- Portfolio Item Row -->
            <div class="row">

                <div class="col-md-8 box-imagem">
                    <div class="foto-hover-principal"></div>
                    <img class="img-fluid" src="./imagens?id_prod=<%=prod.getId()%>&img=1" alt="">
                    <input type="file" class="form-control  border border-dark" id="imagem_1" name="imagem_1" accept="image/*" required  >
                </div>

                <div class="col-md-4">
                    <h3 class="my-3 info">Informações do produto</h3>     
                    
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
                                    <option value="<%= prod.getIdioma() %>" id="<%= prod.getIdioma() %>" selected><%= prod.getIdioma() %></option>
                                    <option value="Portugues" >Portugues</option>
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
                                <button type="submit" class="btn btn-primary border border-dark"  id="alterar">Alterar Informações</button>
                        </form>



                </div>
                <!-- /.row -->

                <!-- Related Projects Row -->
                <h3 class="my-4" id="foto">Fotos Produtos</h3>

                <div class="row">

                    <div class="col-md-3 col-sm-6 mb-4 box-imagem" >
                            <div class="foto-hover2"></div>
                            <img id="img-1" class="img-fluid" src="./imagens?id_prod=<%=prod.getId()%>&img=2" alt="">
                            <input type="file" class="form-control  border border-dark" id="imagem_2" name="imagem_2" accept="image/*" required  >
                        
                    </div>
                    
                            

                    <div class="col-md-3 col-sm-6 mb-4 box-imagem">
                            <div class="foto-hover3"></div>
                            <img class="img-fluid" src="./imagens?id_prod=<%=prod.getId()%>&img=3" alt="">
                            <input type="file" class="form-control  border border-dark" id="imagem_3" name="imagem_3" accept="image/*" required  >
                    </div>

                    <div class="col-md-3 col-sm-6 mb-4 box-imagem">
                            <div class="foto-hover4"></div>
                            <img class="img-fluid" src="./imagens?id_prod=<%=prod.getId()%>&img=4" alt="">
                            <input type="file" class="form-control  border border-dark" id="imagem_4" name="imagem_4" accept="image/*" required  >
                    </div>

                    <div class="col-md-3 col-sm-6 mb-4 box-imagem">
                            <div class="foto-hover5"></div>
                            <img class="img-fluid" src="./imagens?id_prod=<%=prod.getId()%>&img=5" alt="">
                            <input type="file" class="form-control  border border-dark" id="imagem_5" name="imagem_4" accept="image/*" required  >
                        
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

