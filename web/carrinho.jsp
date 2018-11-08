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
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <title>Dropbooks - Meu Carrinho</title>

        <link href="res/css/bootstrap.min.css" rel="stylesheet">
        <link href="res/css/modern-business.css" rel="stylesheet">           
        <link rel="stylesheet" type="text/css" href="res/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="res/vendor/animsition/css/animsition.min.css"/>
        <link rel="stylesheet" type="text/css" href="res/vendor/select2/select2.min.css"/>
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

    <body class="bg-light" onload="loadShoppingCart()">
        <!-- Navigation -->
        <div id="header"></div>
        
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

        <!-- Principal JavaScript do Bootstrap
        ================================================== -->
        <!-- Foi colocado no final para a página carregar mais rápido -->
        <!-- Bootstrap core JavaScript -->
        <script src="res/vendor/jquery/jquery.min.js"></script>
        <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="res/js/carrinho.js"></script>
    </body>
</html>
