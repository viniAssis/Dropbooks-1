<%@page import="modelDAO.ItemDAO"%>
<%@page import="model.Produto"%>
<%@page import="modelDAO.ProdutoDAO"%>
<%@page import="model.Item"%>
<%@page import="modelDAO.PedidoDAO"%>
<%@page import="model.Pedido"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.Utilitarios"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<html lang="pt-br">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>DropBooks</title>

        <script src="res/jquery-3.3.1.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.8/jquery.mask.js"></script>

        <!-- Bootstrap core CSS -->
        <link href="res/css/bootstrap.min.css" rel="stylesheet">
        <script src="res/js/bootstrap.min.js"></script>

        <!-- Custom styles for this template -->
        <link href="res/css/modern-business.css" rel="stylesheet">

        <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script>
            $(function () {
                $("#header").load("MenuNavBar.jsp");
                $("#footer").load("Footer.jsp");
            });
        </script>
        <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="res/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/util.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/main.css"/>

        <style>

            #corAmarelo{
                color:#FEB95F ;
            }

            #corBranca{
                color: white;
            }

            #img{
                width: 200px;
                height: 200px;
                margin-top: 20px;
            }

            #caixa{
                height: 100%;
                padding: 5px;
            }
            .row{
                background-color: blue;
                border: 1px solid black;
                border: 0 none;
                border-radius: 0px;
                box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
                padding: 10px 20px;
                margin-bottom: 30px;
                box-sizing: border-box;
                background-color: #DCDCDC;
                font-family: arial sans-serif;
                font-size: 20px;
            }
            label{
                margin: auto;
                padding-top: 20px;
            }
            .btn{
                width: 150px;
                background: #090446;
                font-weight: bold;
                color: #FEB95F;
                border: 0 none;
                border-radius: 25px;
                cursor: pointer;
                padding: 10px 5px;
                margin: 50px 5px;
                box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.15);
            }
        </style>

        <%
            String email = request.getSession().getAttribute("email").toString();
            Usuario user = new UsuarioDAO().getUsuario(email);


        %>
    </head>

    <body>

        <!-- Navigation -->
        <div id="header"></div>  

        <main role="main">
            <section class="jumbotron text-center">
                <div class="container">
                    <h1 class="jumbotron-heading">Meus Pedidos</h1>
                    <p class="lead text-muted">Histórico</p>
                </div>
            </section>

            <div class="album py-6">

        <% 
        
           ArrayList<Pedido> lista = new PedidoDAO().getPedidosDoCliente(user.getId());
            
           for(int i=0; i<lista.size(); i++) {
               
               //ArrayList<Item> itens = new ItemDAO().getItensDoPedido(lista.get(i).getId_pedido());
               //String nome = null;
               //for(int n=0; n<lista.get(i).getItens().size(); n++) {
                   
               //}
               
                out.print("<div class='container'>"
                        + "<div class='row'>"
                        + "<div class='col-sm-8' id='numeroPedido' name='numeroPedido'>N° do Pedido: "+ lista.get(i).getId_pedido() +"</div>"
                        + "<div class='col-sm-4' id='dataPedido'  name='dataPedido' >Data: "+ lista.get(i).getData_pedido() +"</div>"
                        + "<br/>"
                        + "<div class='col-sm'><img id='img' src='./imagens?id_prod="+ lista.get(i).getItens().get(0).getProduto().getId()+"&img=1'></div>"
                        + "<div class='col-sm'>"
                        + "<label id='namelivro' name='nameLivro'>Livro: "+ lista.get(i).getItens().get(0).getProduto().getTitulo() +"</label> </br>"
                        + "<label id='nameDescricao' name='nameDescricao'>Descrição: "+ lista.get(i).getItens().get(0).getProduto().getDescricao()+"</label>"
                        + "<br/>"
                        + "<label id='valorlivro' name='valorLivro'>Valor: "+ lista.get(i).getTotal() +"</label>"
                        + "</div>"
                        + "<div class='col-sm'>"
                        + "<label id='statuslivro' name='statusLivro'>Status: "+ lista.get(i).getStatus_pagamento() +"</label>"
                        + "<br/>"
                        + "<button type='button' class='btn btn-sm btn-outline-secondary' id='detalheProduto' onclick='location.href=&#39status.jsp?id="+ lista.get(i).getItens().get(0).getProduto().getId() +" &#39' name='detalheProduto'>+ DETALHES</button>"
                        + "</div>" 
                        + "</div>" 
                        + "</div>");
            }
        
        %>
 
                
                
            </div>
        </main>

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

        <script src="res/vendor/jquery/jquery.min.js"></script>
        <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="res/jquery-3.3.1.js"></script>
        <script src="res/vendor/bootstrap/js/bootstrap.js"></script>



    </body>

</html>