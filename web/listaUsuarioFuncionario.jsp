<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Usuario"%>
<%@page import="model.Produto"%>
<%@page import="model.Funcionario"%>
<%@page import="java.util.ArrayList"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!-- Meta tags Obrigatorias -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Lista de Funcionarios</title>
        <link href="res/css/bootstrap.min.css" rel="stylesheet">
        <link href="res/css/modern-business.css" rel="stylesheet">
        <script src="res/jquery-3.3.1.js"></script>
        <script src="res/js/alteraCadastro.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="res/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/util.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/main.css"/>

        <style>

            #nav{background: #090446;}

            .navbar .navbar-nav li a{
                color: #FEB95F !important;
                font-weight: 400;
            }

            .navbar .navbar-nav li a:hover{
                color: white !important;
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
                margin-top: 4%;
            }

            #corAmarelo{color:#FEB95F;}

            #corBranca{color: white;}

            #link{color:  #090446 !important;}

            #principal{
                width: 80%;
                border: 1px solid black;
                margin-left: 10%;
                margin-bottom: 5%;
            }

            #dados{
                width: 70%;
                margin-left: 15%;
                margin-bottom: 12%;
                clear: both;
            }

            h1{
                margin-top: 7%;
                margin-bottom: 5%;
                text-align: center;
            }

            #cod , #pesquisa{float: right;}

            #pesquisa{
                color: #FEB95F;
                background: #090446;
            }

            #cod{margin-right: 3%;}

            a{color: blue;}

            a:hover{color: red;}

            td{color: red;}

        </style>

    </head>
    <body>
        <nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top" id="nav">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">DropBooks</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contato.jsp">Contato</a>
                        </li>
                        <li class="nav-item">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" ></a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                                <a class="dropdown-item" href="cadastroFuncionario.jsp" id='link'>Cadastra Funcionario</a>
                                <a class="dropdown-item" href="cadastro.html" id='link'>Cadastra Usuarios</a>
                                <a class="dropdown-item" href="listaUsuarioFuncionario.html" id='link'>Pesquisa de Funcionario</a>
                                <a class="dropdown-item" href="listaUsuarioUsuario.html" id='link'>Pesquisa de Usuario</a>
                                <a class="dropdown-item" href="#" id='link'>Gerencia de Anuncios</a>
                                <a class="dropdown-item"  href="#" id='link'>Gerencia de FAQ</a>
                                <a class="dropdown-item"  href="#" id='link'>Gerencia de Finaças</a>
                                <a id='link' class="dropdown-item" name=Sair href=SairServlet>Sair</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


        <h1>Pesquisa de Usu�rios</h1>      

        <form action="PesquisarUsuariosServlet" method="GET">
            <input type="hidden" name="acao" value="${param.acao}" />


            <div id="dados">
                <input type="submit" id="pesquisa" value="Pesquisar" class="btn btn-primary" />
                <input type="text" class="form-control col-md-6 mb-4 border border-dark"  id="cod" name="pesquisa" value="${param.pesquisa}" placeholder="Nome">
            </div>


        </form>

        <table class="table table-striped table table-hover sortable" id="tabela">

            <tr>
                <th scope="col">ID</th>
                <th scope="col">Nome</th>
                <th scope="col">Email</th>
                <th scope="col">N�vel</th>
                <th scope="col">Status</th>
                <th scope="col"></th>
            </tr>


            <c:forEach items="${lista}" var="usuario">
                <tr>
                    <td>${usuario.id}</td>
                    <td>${usuario.nomeRazao}</td>
                    <td>${usuario.email}</td>
                    <td>${usuario.nivel_usuario}</td>
                    <td>${usuario.ativo}</td>
                    <td><a href="alterarFuncionarioAdm.jsp?id=${usuario.id}">Editar</a></td>
                </tr>
            </c:forEach>

            <c:if test="${empty lista}">
                <tr>
                    <td colspan="2">Nenhum usu�rio localizado</td>
                </tr>

            </c:if>
        </table>


        <!-- Footer -->
        <footer class="bg6 p-t-45 p-b-43 p-l-45 p-r-45" id="footer">
            <div class="flex-w p-b-90">

                <div class="w-size6 p-t-30 p-l-15 p-r-15 respon3">
                    <h4 id="corAmarelo">Problemas</h4>
                    <div>
                        <p class="s-text7 w-size27" id="corBranca">
                            Caso Tenha Qualquer Problema na Compra ou Venda do Seu livro Entre em Contato Para que seja Resolvido.
                            Agradecemos sua Visita. Volte Sempre !
                        </p>
                    </div>
                </div>

                <div class="w-size7 p-t-30 p-l-15 p-r-15 respon4">

                    <h4  class="s-text12 p-b-30" id="corAmarelo">Categorias</h4>

                    <ul>
                        <li class="p-b-9">
                            <a href="#" id="corBranca">Fic��o</a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" id="corBranca">Terror</a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" id="corBranca">Romance</a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" id="corBranca">Academicos</a>
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
                <div class="t-center s-text8 p-t-20">Copyright@ 2018 Todos Direitos Reservados <i class="fa fa-heart-o" aria-hidden="true"></i> by DropBooks</div>
            </div>
        </footer>

        <script src="res/vendor/jquery/jquery.min.js"></script>
        <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.8/jquery.mask.js"></script>
    </body>
</html>
