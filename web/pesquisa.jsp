<%-- 
    Document   : pesquisa
    Created on : 09/09/2018, 22:39:59
    Author     : vinim
--%>

<%@page import="model.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
          <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>tables</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <style>
        body {
            background-image: url(res/img/bgPadrao.jpg)
        }

        tr {
            color: #FFF0F5;
        }

        .table-hover>tbody>.item:hover {
            background: #4169E1;

        }
    </style>
    </head>
    <body>
        
        <table class="table table-striped table table-hover">
            <tr>
                <th scope="col"> id</th>
                <th scope="col"> dataRegistro </th>
                <th scope="col"> ativo </th>
                <th scope="col"> quantidade </th>
                <th scope="col"> titulo </th>
                <th scope="col"> autor </th>
                <th scope="col"> editora </th>
                <th scope="col"> dataPublicacao</th>
                <th scope="col"> descrição</th>
                <th scope="col"> idioma</th>
                <th scope="col"> genero</th>
                <th scope="col"> preço</th>
                <th scope="col"> id_usuario</th>
            </tr>
        
        <% 
           ArrayList<Produto> produtos = (ArrayList<Produto>)session.getAttribute("produtos");
        
           for(int i = 0; i < produtos.size();i++){
               
              out.println( "<tr class='item'>"+
                "<td>"+produtos.get(i).getId()+"</td>"+
                "<td>"+produtos.get(i).getDataRegistro()+"</td>"+
                "<td>"+produtos.get(i).getAtivo()+"</td>"+
                "<td>"+produtos.get(i).getQuantidade()+"</td>"+
                "<td>"+produtos.get(i).getTitulo()+"</td>"+
                "<td>"+produtos.get(i).getAutor()+"</td>"+
                "<td>"+produtos.get(i).getEditora()+"</td>"+
                "<td>"+produtos.get(i).getDataPublicacao()+"</td>"+
                "<td>"+produtos.get(i).getDescricao()+"</td>"+
                "<td>"+produtos.get(i).getIdioma()+"</td>"+
                "<td>"+produtos.get(i).getGenero()+"</td>"+
                "<td>R$"+produtos.get(i).getPreco()+"</td>"+
                "<td>"+produtos.get(i).getId_usuario()+"</td>"+"</tr>");
           }
        %>
        </table>
    </body>
</html>
