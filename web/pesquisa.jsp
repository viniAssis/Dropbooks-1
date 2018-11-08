<%-- 
    Document   : pesquisa
    Created on : 09/09/2018, 22:39:59
    Author     : vinim
--%>

<%@page import="model.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa</title>
        
          <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>tables</title>
    <script src="res/js/src/sorttable.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->
      <script src="//code.jquery.com/jquery-1.10.2.js"></script>
      <script>
         $(function(){
            $("#header").load("MenuNavBar.jsp");
            $("#footer").load("Footer.jsp");
         });
      </script>
      <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->
    <!-- Custom styles for this template -->
        <link href="res/css/modern-business.css" rel="stylesheet">
    
    <style>
        
        h1{
            font-size: 2.5rem;
            
            text-align: center;
            margin-bottom: 20px;
        }
        
        body {
            color: black;
        }
        tr {
            cursor: pointer;
        }
        .table-hover>tbody>.item:hover {
            background: #4169E1;
        }
        
        #caixa2{
			margin-top: 5%;
			margin-left: 25%;
			margin-bottom: 3%;
			clear: both;
		}
    </style>
    
    
    
        <%ArrayList<Produto> produtos = (ArrayList<Produto>)session.getAttribute("produtos");%>
        
    </head>
    <body>
        <div id="header"></div>   
        
        
        
        
        <form id="caixa2" method='post' action="PesquisarLivrosServlet">
            <div class="form-row align-items-center">
                <div class="col-auto my-1">
                    <select class="custom-select mr-sm-2 border border-dark" id="tipoPesquisa" name="opcaoPesquisa">
                        <option  value="Titulo">Título</option>
                        <option  value="Autor">Autor</option>
                        <option  value="Editora">Editora</option>
                        <option  value="Genero">Genêro</option>
                    </select>
                </div>
                <div class="col-auto col-md-6">
                    <input class="form-control mr-sm-2 border border-dark" type="search" placeholder="Pesquisar" aria-label="Pesquisar" name="palavraChave">
                </div>
                <button type="submit" class="btn btn-primary" id="botao1" name="botao1">Pesquisa</button>
            </div>
        </form>
        <button type="button" class="btn btn-primary" id="botao">Ordena Titulo</button>
        <button type="button" class="btn btn-primary" id="botao2">Ordena Ativo</button>
        <button type="button" class="btn btn-primary" id="botao3">Ordena Preço</button>
        
        <h1><%      
                    
                    
                    if(produtos.size() > 0){
                        
                            String opcao = String.valueOf(session.getAttribute("opcao"));
                            String palavraChave = String.valueOf(session.getAttribute("palavraChave"));
                            if(opcao.equals("Titulo"))
                               out.println("Resultados por titulos com o termo '"+ palavraChave +"' : "+produtos.size()+" livros!"); 
                                
                            else if(opcao.equals("Autor"))
                                out.println("Resultados por Autor com o termo '"+ palavraChave +"' : "+produtos.size()+" livros!");
                                
                            else if(opcao.equals("Editora"))
                                out.println("Resultados por Editora com o termo '"+ palavraChave +"' : "+produtos.size()+" livros!");
                            
                            else if(opcao.equals("Genero"))
                                out.println("Resultados por Genero com o termo '"+ palavraChave +"' : "+produtos.size()+" livros!");
 
                    }
                    else
                        out.println("Nenhum livro encontrado");
            
            
            %></h1>
        
        
        <table class="table table-striped table table-hover sortable" >
            <thead>
                <tr class='linha'>
					<th scope="col" class='idProduto'> id</th>
					<th scope="col" class='dataRegistro'> dataRegistro </th>
					<th scope="col" class='ativo'> ativo </th>
					<th scope="col" class='qtd'> quantidade </th>
					<th scope="col" class='titulo'> titulo </th>
					<th scope="col" class='auto'> autor </th>
					<th scope="col" class='editora'> editora </th>
					<th scope="col" class='dataPublicacao'> dataPublicacao</th>
					<th scope="col" class='decricao'> descrição</th>
					<th scope="col" class='idioma'> idioma</th>
					<th scope="col" class='genero'> genero</th>
					<th scope="col" class='preco'> preço</th>
					<th scope="col" class='Vendedor'> Vendedor</th>
		</tr>
            </thead>
			<tbody id="tblProduto">
				
        
				<% 
				   for(int i = 0; i < produtos.size();i++){
					  out.println( 
                                                  
                                                 
                                                  "<tr class='item linha' onclick=' location.href= &#39 pagProduto.jsp?id="+ produtos.get(i).getId() +" &#39'>"+
                                                
						"<td class='idProduto'>"+produtos.get(i).getId()+"</td>"+
						"<td class='dataRegistro'>"+produtos.get(i).getDataRegistro()+"</td>"+
						"<td class='ativo'>"+produtos.get(i).getAtivo()+"</td>"+
						"<td class='qtd'>"+produtos.get(i).getQuantidade()+"</td>"+
						"<td class='titulo'>"+produtos.get(i).getTitulo()+"</td>"+
						"<td class='auto'>"+produtos.get(i).getAutor()+"</td>"+
						"<td class='editora'>"+produtos.get(i).getEditora()+"</td>"+
						"<td class='dataPublicacao'>"+produtos.get(i).getDataPublicacao()+"</td>"+
						"<td class='decricao'>"+produtos.get(i).getDescricao()+"</td>"+
						"<td class='idioma'>"+produtos.get(i).getIdioma()+"</td>"+
						"<td class='genero'>"+produtos.get(i).getGenero()+"</td>"+
						"<td class='preco'>"+produtos.get(i).getPreco()+"</td>"+
						"<td class='Vendedor'>"+produtos.get(i).getId_usuario()+"</td>"+
                                                
                                                "</tr>");
				   }
				%>
			
		</tbody>
        </table>
            
        
                                
        <!-- footer -->
        <div id="footer"></div>
                                
            <script src="res/vendor/jquery/jquery.min.js"></script>
    <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	</body>
</html>