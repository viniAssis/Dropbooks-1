<%-- 
    Document   : home
    Created on : Aug 26, 2018, 2:21:45 PM
    Author     : thiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuáiro conectado</title>
    </head>
    <body>
        <%
           /*validando se a pessao possui sessão, caso o parametro de null você é redirecionado para 
            a tela de login*/
            if (session.getAttribute("email") == null) {
                response.sendRedirect("login.jsp");
            }

        %>
        <h1>Usuário conectado!</h1>
      
        <a href="alterarCadastro.jsp">Alterar Cadastro</a>
    </body>
</html>
