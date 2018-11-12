<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Dropbooks - Checkout</title>

        <link href="res/css/bootstrap.min.css" rel="stylesheet">
        <link href="res/css/modern-business.css" rel="stylesheet">           
        <link rel="stylesheet" type="text/css" href="res/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/util.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/main.css"/>

        <style>
            #nav{
                background: #090446 !important;
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
            .caixa1{
                padding: 20px 30px;
                box-sizing: border-box;
                margin-left: 20%;
                width: 60%;
                margin-top: 20px;
                margin-bottom: 10px;  
            }
            .action-button {
                width: 30px;
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
            .list-group-item{
                background-color: #6495ED;
                box-shadow: 0px 3px 7px rgba(0, 0, 0, 0.4);
                color: black;
                text-align: left;
                font-size: 18px;

            }
            #finalizarPedido{
                width: 200px;
                border-radius: 25px;
            }
            #footer{
                background: #090446;
            }
        </style>

        <%
            String email = "";
            Usuario user = null;
            boolean logado = false;

            if (request.getSession().getAttribute("email") != null) {
                email = request.getSession().getAttribute("email").toString();
                user = new UsuarioDAO().getUsuario(email);
                logado = true;
            } else {
                response.sendRedirect("login.jsp");
            }
        %>
    </head>
    <body class="bg-light" onload="loadShoppingCart(<%=user.getCep()%>)">

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
                                if (logado) {
                                    out.print("</li>");
                                    out.print("<li class=nav-item>");
                                    out.print("<li class='nav-item dropdown'> "
                                            + "<a class='nav-link dropdown-toggle' href='#' id='navbarDropdownPortfolio' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>" + user.getNomeRazao() + "</a>"
                                            + "<div class='dropdown-menu dropdown-menu-right' aria-labelledby='navbarDropdownPortfolio'>");
                                    if (!user.getNivel_usuario().equals("1")) {
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

        <div class="caixa1">
            <div id="formPgto">
                <h4 class="mb-3"></h4>
                <div class="row">
                    <div class="col-lg-6 mb-6">
                        <strong>Resumo do pedido</strong>
                        <div id="order">
                            
                        </div>
                    </div>
                    <br />
                    <div class="col-lg-4 mb-6">
                        <strong>Endereço de entrega:</strong>
                        <br />
                        <%
                            if (logado) {
                                out.print(user.getLogradouro() + ", " + user.getNumero());

                                if (user.getComplemento() != "") {
                                    out.print(", " + user.getComplemento() + "<br />");
                                } else {
                                    out.print("<br />");
                                }

                                out.print(user.getBairro() + "<br />");
                                out.print(user.getCidade() + " - " + user.getEstado() + "<br />");
                                out.print("CEP: " + user.getCep() + "<br />");
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>

        <div class="caixa1">
            <div id="formPgto">
                <h4 class="mb-3">Pagamento</h4>
                <form>
                    <div class="d-block my-3">
                        <div class="custom-control custom-radio">
                            <input id="credito" name="formaPagamento" value="Crédito" type="radio" class="custom-control-input" checked required>
                            <label class="custom-control-label" for="credito">Cartão de crédito</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input id="debito" name="formaPagamento" value="Débito" type="radio" class="custom-control-input" required>
                            <label class="custom-control-label" for="debito">Cartão de débito</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input id="paypal" name="formaPagamento" value= "Paypal" type="radio" class="custom-control-input" required>
                            <label class="custom-control-label" for="paypal">PayPal</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="cc-nome">Nome no cartão</label>
                            <input type="text" class="form-control" id="cc-nome" placeholder="" required>
                            <small class="text-muted">Nome completo, como mostrado no cartão.</small>
                            <div class="invalid-feedback">
                                O nome que está no cartão é obrigatório.
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="cc-numero">Número do cartão de crédito</label>
                            <input type="text" class="form-control" id="cc-numero"  name="cc-numero" placeholder="" required>
                            <div class="invalid-feedback">
                                O número do cartão de crédito é obrigatório.
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mb-3">
                            <label for="cc-expiracao">Data de expiração</label>
                            <input type="text" class="form-control" id="cc-expiracao" name="cc-expiracao" placeholder="" required>
                            <div class="invalid-feedback">
                                Data de expiração é obrigatória.
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label for="cc-cvv">CVV</label>
                            <input type="text" class="form-control" id="cc-cvv"  name="cc-cvv" placeholder="" required>
                            <div class="invalid-feedback">
                                Código de segurança é obrigatório.
                            </div>
                        </div>
                    </div>
                    <hr class="mb-4">
                    <div class="input-group">
                        <div class="input-group-append">
                            <button type="button" name="finalizarPedido" id="finalizarPedido" class="btn action-button btn-block">Finalizar Compra</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

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
                <a href="#"><img class="h-size2" src="res/images/icons/paypal.png" alt="IMG-PAYPAL" /></a>
                <a href="#"><img class="h-size2" src="res/images/icons/visa.png" alt="IMG-VISA" /></a>
                <a href="#"><img class="h-size2" src="res/images/icons/mastercard.png" alt="IMG-MASTERCARD" /></a>
                <a href="#"><img class="h-size2" src="res/images/icons/express.png" alt="IMG-EXPRESS" /></a>
                <a href="#"><img class="h-size2" src="res/images/icons/discover.png" alt="IMG-DISCOVER"/></a>
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

        <!-- Principal JavaScript do Bootstrap
        ================================================== -->
        <!-- Foi colocado no final para a página carregar mais rápido -->
        <!-- Bootstrap core JavaScript -->
        <script src="res/vendor/jquery/jquery.min.js"></script>
        <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="res/js/checkout.js"></script>
    </body>
</html>
