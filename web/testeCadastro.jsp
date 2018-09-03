<%-- 
    Document   : testeCadastro
    Created on : Sep 1, 2018, 1:25:04 PM
    Author     : Ricardo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Produto" %>
<%@page import="modelDAO.ProdutoDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <%  
            
        //TESTE PARA RETORNAR UM PRODUTO
            
            // Para trazer um produto, pegue-o pelo ID do mesmo
            
            Produto teste = ProdutoDAO.getProduto("1");
            out.println(teste.getDescricao());
            out.println(teste.getDataPublicacao());
            
        //TESTE PARA CADASTRAR UM PRODUTO
            
            Produto teste2 = new Produto();
            teste2.setAtivo(1);
            teste2.setAutor("Veneceos");
            
            // Povo, criei o método toSqlDate() pra ajudar na conversão de Strings pra SQL Date 
            
            teste2.setDataPublicacao(Produto.toSqlDate("21/06/2018"));
            teste2.setDataRegistro(Produto.toSqlDate("01/09/2018"));
            
            //TODAS AS CLASSES MODELO DEVERÃO IMPLEMENTAR (extends) A CLASSE UTILITÁRIO                     -- Ricardo
            
            teste2.setDescricao("*Bate os beiço*");
            teste2.setEditora("Sua mãe");
            teste2.setGenero("Ação");
            teste2.setId_usuario(1);
            teste2.setIdioma("Alemão");
            teste2.setPreco(192.5f);
            teste2.setQuantidade(3);
            teste2.setTitulo("Oi?");
            
            //ProdutoDAO.setProduto(teste2);
            
            //out.println(teste2.getDataPublicacao());
            
        //TESTE PARA RETORNAR TODOS OS LIVROS COM O TITULO = TERMO PESQUISADO
        
            ArrayList<Produto> produtos = ProdutoDAO.getProdutosPorTermo("S");
            for(int i =0; i<produtos.size(); i++){
                out.println(produtos.get(i).getTitulo());
            }
            
        //TESTE PARA RETORNAR TODOS OS LIVROS DE DETERMINADO USUARIO
        
            ArrayList<Produto> produtos2 = ProdutoDAO.getProdutos("1");
            for(int i =0; i<produtos2.size(); i++){
                out.println(produtos2.get(i).getTitulo());
            }
        %>
    </body>
</html>
