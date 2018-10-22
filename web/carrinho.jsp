<%@page import="modelDAO.ProdutoDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.Produto"%>
<%@page import="model.ItemCart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!-- Meta tags Obrigatórias -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <title>Dropbooks - Meu Carrinho</title>

        <link rel="stylesheet" href="res/css/cadastro.css">
        <link href="res/css/bootstrap.min.css" rel="stylesheet">
        <link href="res/css/modern-business.css" rel="stylesheet">     
        <script src="res/js/contato.js"></script>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="res/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="res/vendor/animsition/css/animsition.min.css"/>
        <link rel="stylesheet" type="text/css" href="res/vendor/select2/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/util.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/main.css"/>

        <link rel="stylesheet" href="res/css/bootstrap.css">
        <style>
            #resumo{
                margin-top: 30px;
                font-family: arial;
                font-size: 20px;
                padding: 20px;
                color: blue;
            }

            .action-button {
                width: 150px;
                background: #090446;
                font-weight: bold;
                color: #FEB95F;
                border: 0 none;
                border-radius: 25px;
                cursor: pointer;
                padding: 10px 5px;
                margin: 10px 5px;
                box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.15);
            }
            .ccontainer{
                border: 1px solid black;
                background: white;
                border: 0 none;
                border-radius: 0px;
                box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
                padding: 20px 30px;
                box-sizing: border-box;
                width: 120%;
                margin-top: 10px;
                margin-bottom: 10px;  

            }
            #formPgto{
                border: 1px solid black;
                background: white;
                border: 0 none;
                border-radius: 0px;
                box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
                padding: 20px 30px;
                box-sizing: border-box;
                width: 100%;
                margin-top: 10px;
                margin-bottom: 10px;  

            }
            .caixa{
                width: 50%;
                float: left;
            }
            img{
                padding: 15px;
            }

            #titulo{
                padding: 15px;
            }
            #idQtde{
                background-color: lightgrey;
                width: 20%;
                border-radius: 5px;
                box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.2);
                margin-left: 3px;
            }
        </style>
    </head>

    <body class="bg-light" onload="loadShoppingCart()">
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

                                if (session.getAttribute("email") != null) {

                                    String email = request.getSession().getAttribute("email").toString();

                                    Usuario user = new UsuarioDAO().getUsuario(email);

                                    out.print("</li>");
                                    out.print("<li class=nav-item>");
                                    out.print("<li class='nav-item dropdown'> "
                                            + "<a class='nav-link dropdown-toggle' href='#' id='navbarDropdownPortfolio' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"+ user.getNomeRazao() +"</a>"
                                            + "<div class='dropdown-menu dropdown-menu-right' aria-labelledby='navbarDropdownPortfolio'>"
                                            + "<a class='dropdown-item' href='carrinho.jsp'>Carrinho</a>"
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

        <!--meu carrinho-->
        <div class="container">
            <div id="resumo" class="row">
                <div id="order" class="col-md-4 order-md-2 mb-4">
                </div>
                <div class="col-md-8 order-md-1">
                    <h4 class="mb-3">Meu Carrinho</h4>
                    <div id="list-cart">
                        <!-- Dados do carrinho inseridos com Javascript -->
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="py-5 bg-primary">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; DropBooks</p>
            </div>
        </footer>

        <!-- Principal JavaScript do Bootstrap
        ================================================== -->
        <!-- Foi colocado no final para a página carregar mais rápido -->
        <!-- Bootstrap core JavaScript -->
        <script src="res/vendor/jquery/jquery.min.js"></script>
        <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script>
            function loadShoppingCart() {
                var xhttp = new XMLHttpRequest();
                var jsonCart;
                xhttp.onreadystatechange = function() {
                    if (this.readyState === 4 && this.status === 200) {
                        console.log("J: " + this.responseText);
                        jsonCart = JSON.parse(this.responseText);
                        listarCarrinho(jsonCart);
                   }
                };
                xhttp.open("GET", "GetShoppingCartServlet", true);
                xhttp.setRequestHeader("Content-type", "application/json");
                xhttp.send();
            }
            
            var listarCarrinho = function (json) {
                var html = "";
                var htmlOrder = "";
                
                if (json.length > 0) {
                    
                    htmlOrder += '<h4 class="d-flex justify-content-between align-items-center mb-3">';
                    htmlOrder += '<span class="text-muted">Resumo do Pedido</span>';
                    htmlOrder += '<span class="badge badge-secondary badge-pill" id="qtdeProdutos"  name="qtdeProdutos">' + json.length + '</span>';
                    htmlOrder += '</h4>';
                    htmlOrder += '<ul class="list-group mb-3">';
                    
                    for (var i = 0; i < json.length; i++) {
                        html += '<div class="caixa">';
                        html += '<img src=" ' + json[i].produto.imagem_1 + ' " width="150" height ="200" alt=""/>';
                        html += '<div id="titulo">';
                        html += '<label id="idTitulo" name="idTitulo">' + json[i].produto.titulo + '</label>';
                        html += '<br/>';
                        html += '<label id="idAutor" name="idAutor">Autor: ' + json[i].produto.autor + '</label>';
                        html += '<br/>';
                        html += '<label>Quantidade:</label>';
                        html +='<input id="idQtde" name="idQtde" type="number" onchange="atualizarQuantidade(this)" value="' + json[i].quantidade + '">';
                        html += '<br/>';
                        html += '<a href="#" onclick="">Excluir</a>';
                        html += '</div>';
                        html += '</div>';
                        
                        htmlOrder += '<li class="list-group-item d-flex justify-content-between lh-condensed">';
                        htmlOrder += '<div>';
                        htmlOrder += '<h6 class="my-0" id="idTitulo"  name="idTitulo">' + json[i].produto.titulo + '</h6>';
                        htmlOrder += '<small class="text-muted" id="idAutor"  name="idAutor">Autor: ' + json[i].produto.autor + '</small>';
                        htmlOrder += '</div>';
                        htmlOrder += '<span class="text-muted" id="idValor" name="idValor">R$ ' + json[i].produto.preco + '</span>';
                        htmlOrder += '</li>';
                    }
                    
                    htmlOrder += '<li class="list-group-item d-flex justify-content-between">';
                    htmlOrder += '<span>Valor Total</span>';
                    htmlOrder += '<strong id="valorTotal" name="valorTotal"></strong>';
                    htmlOrder += '</li>';
                    htmlOrder += '<li class="nav-item d-flex">';
                    htmlOrder += '<a class="nav-link" href="" >Continuar comprando</a>';
                    htmlOrder += '</li>';
                    htmlOrder += '</ul>';
                    htmlOrder += '<input type="button" name="finalizarPedido" class="action-button  btn-block" value="Finalizar Pedido"/>';
                } else {
                    html = "<h4>Seu carrinho está vazio</h4>"
                }
                
                document.getElementById("list-cart").innerHTML = html;
                document.getElementById("order").innerHTML = htmlOrder;
            };

            function excluir(id) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (this.readyState === 4 && this.status === 200) {
                        document.location.reload();
                   }
                };
                xhttp.open("GET", "RemoverItemCarrinhoServlet?livro=" + id, true);
                xhttp.send(); 
            }
            
            function atualizarQuantidade(event, id) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (this.readyState === 4 && this.status === 200) {
                        document.location.reload();
                    }
                };
                xhttp.open("GET", "AtualizarCarrinhoServlet?livro=" + id + "&qtd="+ event.value, true);
                xhttp.send(); 
            }
        </script>
    </body>
</html>
