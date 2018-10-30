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

        <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script>
           $(function(){
              $("#header").load("MenuNavBar.jsp");
              $("#footer").load("Footer.jsp");
           });
        </script>
        <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->

        <!--  Session -->
        <%
            String email = request.getSession().getAttribute("email").toString();

            Usuario user = new UsuarioDAO().getUsuario(email);

            if (!user.getNivel_usuario().equals("1")) {
                response.sendRedirect("paginaNaoEncontrada.jsp");
            }

        %>
        
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
      <div id="header"></div> 

    <center><h1>Pesquisa de Usuários</h1></center>      

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
                <th scope="col">Nível</th>
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
                    <td colspan="2">Nenhum usuário localizado</td>
                </tr>

            </c:if>
        </table>


        <!-- Footer -->
        <div id="footer"></div>
        
        <script src="res/vendor/jquery/jquery.min.js"></script>
        <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.8/jquery.mask.js"></script>
    </body>
</html>
