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
        <title>Pesquisa</title>
        
          <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>tables</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <style>
        
        h1{
            font-size: 2.5rem;
            color: #FFF0F5;
            text-align: center;
            margin-bottom: 20px;
        }
        
        body {
            background-image: url(res/img/bgPadrao.jpg)
        }

        tr {
            color: #FFF0F5;
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
    
    <script>
        
		 var flagOrdenaTitulo = false;
        var flagOrdenaDataRegistro = false;
        var flagOrdenaAtivo= false;
        var flagOrdenaQtd = false;
        var flagOrdenaAutor = false;
        var flagOrdenaEditora = false;
        var flagOrdenaDataPublic = false;
        var flagOrdenaDescricao = false;
        var flagOrdenaIdioma = false;
        var flagOrdenaGenero = false;
        var flagOrdenaPreco = false;
        var flagOrdenaUsuario = false;

        
        window.onload=function(){
            

            document.getElementById("botao").onclick=function(){ ordenar("titulo"); }
			
			document.getElementById("botao2").onclick=function(){ ordenar("ativo"); }
        }
		
		
		function ordenar(strBotaoClicado){
            
			
           
			var array = [];
			
			
			if( strBotaoClicado == "titulo" ){
				for(var i = document.getElementsByClassName("titulo").length-1; i > 0 ; i--){

					document.getElementsByClassName("linha")[i].setAttribute("value", document.getElementsByClassName(strBotaoClicado)[i].innerText)  ; 
					array.push(document.getElementsByClassName("linha")[i].outerHTML);
					console.log(i +" ,"+ document.getElementsByClassName("linha")[i].outerHTML);
				}

					if(flagOrdenaTitulo == false){
					array.sort();

					flagOrdenaTitulo = true;

					flagOrdenaDataRegistro = false;
					flagOrdenaAtivo= false;
					flagOrdenaQtd = false;
					flagOrdenaAutor = false;
					flagOrdenaEditora = false;
					flagOrdenaDataPublic = false;
					flagOrdenaDescricao = false;
					flagOrdenaIdioma = false;
					flagOrdenaGenero = false;
					flagOrdenaPreco = false;
					flagOrdenaUsuario = false;
					}

					else{
					array.sort(function(a, b){return a-b});				
					flagOrdenaTitulo = false;



					flagOrdenaDataRegistro = false;
					flagOrdenaAtivo= false;
					flagOrdenaQtd = false;
					flagOrdenaAutor = false;
					flagOrdenaEditora = false;
					flagOrdenaDataPublic = false;
					flagOrdenaDescricao = false;
					flagOrdenaIdioma = false;
					flagOrdenaGenero = false;
					flagOrdenaPreco = false;
					flagOrdenaUsuario = false;
					}
				
				
				
					
			}
			
			else if( strBotaoClicado == "ativo"){
				
				for(var i = document.getElementsByClassName("titulo").length-1; i > 0 ; i--){
				
				document.getElementsByClassName("linha")[i].setAttribute("value", document.getElementsByClassName(strBotaoClicado)[i].innerText);//AQUI 
				array.push(document.getElementsByClassName("linha")[i].outerHTML);
				console.log(i +" ,"+ document.getElementsByClassName("linha")[i].outerHTML);
					
				}
				
				
				if(flagOrdenaAtivo == false){//AQUI 
					
					array.sort();
				
					flagOrdenaAtivo = true;//AQUI 
					
					flagOrdenaTitulo = false;
					flagOrdenaDataRegistro = false;
					flagOrdenaQtd = false;
					flagOrdenaAutor = false;
					flagOrdenaEditora = false;
					flagOrdenaDataPublic = false;
					flagOrdenaDescricao = false;
					flagOrdenaIdioma = false;
					flagOrdenaGenero = false;
					flagOrdenaPreco = false;
					flagOrdenaUsuario = false;
					
				}
				else{
				
					array.sort(function(a, b){return a-b});
					flagOrdenaAtivo = false;//AQUI
					
					
					flagOrdenaTitulo = false;
					flagOrdenaDataRegistro = false;
					flagOrdenaQtd = false;
					flagOrdenaAutor = false;
					flagOrdenaEditora = false;
					flagOrdenaDataPublic = false;
					flagOrdenaDescricao = false;
					flagOrdenaIdioma = false;
					flagOrdenaGenero = false;
					flagOrdenaPreco = false;
					flagOrdenaUsuario = false;
				
				}
				
				
				
			}
			
			else if( strBotaoClicado == "idProduto"){
				
				for(var i = document.getElementsByClassName("titulo").length-1; i > 0 ; i--){
				
				document.getElementsByClassName("linha")[i].setAttribute("value", document.getElementsByClassName(strBotaoClicado)[i].innerText);//AQUI 
				array.push(document.getElementsByClassName("linha")[i].outerHTML);
				console.log(i +" ,"+ document.getElementsByClassName("linha")[i].outerHTML);
					
				}
				
				
				if(flagOrdenaUsuario == false){//AQUI 
					
					array.sort();
				
					flagOrdenaAtivo = false;//AQUI 
					
					flagOrdenaTitulo = false;
					flagOrdenaDataRegistro = false;
					flagOrdenaQtd = false;
					flagOrdenaAutor = false;
					flagOrdenaEditora = false;
					flagOrdenaDataPublic = false;
					flagOrdenaDescricao = false;
					flagOrdenaIdioma = false;
					flagOrdenaGenero = false;
					flagOrdenaPreco = false;
					flagOrdenaUsuario = true;//
					
				}
				else{
				
					array.sort(function(a, b){return a-b});
					flagOrdenaAtivo = false;//AQUI
					
					
					flagOrdenaTitulo = false;
					flagOrdenaDataRegistro = false;
					flagOrdenaQtd = false;
					flagOrdenaAutor = false;
					flagOrdenaEditora = false;
					flagOrdenaDataPublic = false;
					flagOrdenaDescricao = false;
					flagOrdenaIdioma = false;
					flagOrdenaGenero = false;
					flagOrdenaPreco = false;
					flagOrdenaUsuario = false;//
				
				}
				
			}
			
			else if( strBotaoClicado == "dataRegistro"){
				
				for(var i = document.getElementsByClassName("titulo").length-1; i > 0 ; i--){
				
				document.getElementsByClassName("linha")[i].setAttribute("value", document.getElementsByClassName(strBotaoClicado)[i].innerText);//AQUI 
				array.push(document.getElementsByClassName("linha")[i].outerHTML);
				console.log(i +" ,"+ document.getElementsByClassName("linha")[i].outerHTML);
					
				}
				
				
				if(flagOrdenaDataRegistro == false){//AQUI 
					
					array.sort();
				
					flagOrdenaAtivo = false;//AQUI 
					
					flagOrdenaTitulo = false;
					flagOrdenaDataRegistro = true;//
					flagOrdenaQtd = false;
					flagOrdenaAutor = false;
					flagOrdenaEditora = false;
					flagOrdenaDataPublic = false;
					flagOrdenaDescricao = false;
					flagOrdenaIdioma = false;
					flagOrdenaGenero = false;
					flagOrdenaPreco = false;
					flagOrdenaUsuario = true;
					
				}
				else{
				
					array.sort(function(a, b){return a-b});
					flagOrdenaAtivo = false;//AQUI
					
					
					flagOrdenaTitulo = false;
					flagOrdenaDataRegistro = false;//
					flagOrdenaQtd = false;
					flagOrdenaAutor = false;
					flagOrdenaEditora = false;
					flagOrdenaDataPublic = false;
					flagOrdenaDescricao = false;
					flagOrdenaIdioma = false;
					flagOrdenaGenero = false;
					flagOrdenaPreco = false;
					flagOrdenaUsuario = false;
				
				}
				
			}
			
			else if( strBotaoClicado == "qtd"){
				
				for(var i = document.getElementsByClassName("titulo").length-1; i > 0 ; i--){
				
				document.getElementsByClassName("linha")[i].setAttribute("value", document.getElementsByClassName(strBotaoClicado)[i].innerText);//AQUI 
				array.push(document.getElementsByClassName("linha")[i].outerHTML);
				console.log(i +" ,"+ document.getElementsByClassName("linha")[i].outerHTML);
					
				}
				
				
				if(flagOrdenaQtd == false){//AQUI 
					
					array.sort();
				
					flagOrdenaAtivo = false;//AQUI 
					
					flagOrdenaTitulo = false;
					flagOrdenaDataRegistro = false;
					flagOrdenaQtd = true;//
					flagOrdenaAutor = false;
					flagOrdenaEditora = false;
					flagOrdenaDataPublic = false;
					flagOrdenaDescricao = false;
					flagOrdenaIdioma = false;
					flagOrdenaGenero = false;
					flagOrdenaPreco = false;
					flagOrdenaUsuario = false;
					
				}
				else{
				
					array.sort(function(a, b){return a-b});
					flagOrdenaAtivo = false;//AQUI
					
					
					flagOrdenaTitulo = false;
					flagOrdenaDataRegistro = false;
					flagOrdenaQtd = false;//
					flagOrdenaAutor = false;
					flagOrdenaEditora = false;
					flagOrdenaDataPublic = false;
					flagOrdenaDescricao = false;
					flagOrdenaIdioma = false;
					flagOrdenaGenero = false;
					flagOrdenaPreco = false;
					flagOrdenaUsuario = false;
				
				}
			}
			
			else if( strBotaoClicado == "auto"){
				
				for(var i = document.getElementsByClassName("titulo").length-1; i > 0 ; i--){
				
				document.getElementsByClassName("linha")[i].setAttribute("value", document.getElementsByClassName(strBotaoClicado)[i].innerText);//AQUI 
				array.push(document.getElementsByClassName("linha")[i].outerHTML);
				console.log(i +" ,"+ document.getElementsByClassName("linha")[i].outerHTML);
					
				}
				
				
				if(flagOrdenaAutor == false){//AQUI 
					
					array.sort();
				
					flagOrdenaAtivo = false;
					
					flagOrdenaTitulo = false;
					flagOrdenaDataRegistro = false;
					flagOrdenaQtd = false;
					flagOrdenaAutor = true;//
					flagOrdenaEditora = false;
					flagOrdenaDataPublic = false;
					flagOrdenaDescricao = false;
					flagOrdenaIdioma = false;
					flagOrdenaGenero = false;
					flagOrdenaPreco = false;
					flagOrdenaUsuario = false;
					
				}
				else{
				
					array.sort(function(a, b){return a-b});
					flagOrdenaAtivo = false;//AQUI
					
					
					flagOrdenaTitulo = false;
					flagOrdenaDataRegistro = false;
					flagOrdenaQtd = false;
					flagOrdenaAutor = false;//
					flagOrdenaEditora = false;
					flagOrdenaDataPublic = false;
					flagOrdenaDescricao = false;
					flagOrdenaIdioma = false;
					flagOrdenaGenero = false;
					flagOrdenaPreco = false;
					flagOrdenaUsuario = false;
				
				}
				
			}
			
			else if( strBotaoClicado == "editora"){
				
				for(var i = document.getElementsByClassName("titulo").length-1; i > 0 ; i--){
				
				document.getElementsByClassName("linha")[i].setAttribute("value", document.getElementsByClassName(strBotaoClicado)[i].innerText);//AQUI 
				array.push(document.getElementsByClassName("linha")[i].outerHTML);
				console.log(i +" ,"+ document.getElementsByClassName("linha")[i].outerHTML);
					
				}
				
				
				if(flagOrdenaEditora == false){//AQUI 
					
					array.sort();
				
					flagOrdenaAtivo = false;
					
					flagOrdenaTitulo = false;
					flagOrdenaDataRegistro = false;
					flagOrdenaQtd = false;
					flagOrdenaAutor = false;
					flagOrdenaEditora = true;
					flagOrdenaDataPublic = false;
					flagOrdenaDescricao = false;
					flagOrdenaIdioma = false;
					flagOrdenaGenero = false;
					flagOrdenaPreco = false;
					flagOrdenaUsuario = false;
					
				}
				else{
				
					array.sort(function(a, b){return a-b});
					flagOrdenaAtivo = false;//AQUI
					
					
					flagOrdenaTitulo = false;
					flagOrdenaDataRegistro = false;
					flagOrdenaQtd = false;
					flagOrdenaAutor = false;//
					flagOrdenaEditora = false;
					flagOrdenaDataPublic = false;
					flagOrdenaDescricao = false;
					flagOrdenaIdioma = false;
					flagOrdenaGenero = false;
					flagOrdenaPreco = false;
					flagOrdenaUsuario = false;
				
				}
				
			}
			
			else if( strBotaoClicado == "dataPublicacao"){}
			
			else if( strBotaoClicado == "decricao"){}
			
			else if( strBotaoClicado == "idioma"){}
			
			else if( strBotaoClicado == "genero"){}
			
			else if( strBotaoClicado == "preco"){}
			
			else if( strBotaoClicado == "idUsuario"){}
			
			else{alert("erro")};
			
			
		   
           
           
           
           
           
           
           
           
           
           
           
           
			
			
			
			
			
			console.log(array);
			document.getElementById("tblProduto").innerHTML = "<tr class='linha'>"
                +"<th scope='col' class='idProduto'> id</th>"
                +"<th scope='col' class='dataRegistro'> dataRegistro </th>"
                +"<th scope='col' class='ativo'> ativo </th>"
                +"<th scope='col' class='qtd'> quantidade </th>"
                +"<th scope='col' class='titulo' id='botao'> titulo </th>"
                +"<th scope='col' class='auto'> autor </th>"
                +"<th scope='col' class='editora'> editora </th>"
                +"<th scope='col' class='dataPublicacao'> dataPublicacao</th>"
                +"<th scope='col' class='decricao'> descrição</th>"
                +"<th scope='col' class='idioma'> idioma</th>"
                +"<th scope='col' class='genero'> genero</th>"
                +"<th scope='col' class='preco'> preço</th>"
                +"<th scope='col' class='idUsuario'> id_usuario</th>"
                        +"</tr>";
			
			
             document.getElementById("tblProduto").innerHTML += array.join("");
            
             
			
        }
        
        
    </script>
    
    
        <%ArrayList<Produto> produtos = (ArrayList<Produto>)session.getAttribute("produtos");%>
        
    </head>
    <body>
        
        <form id="caixa2" method="post" action="PesquisarLivrosServlet">
  			<div class="form-row align-items-center">
    			<div class="col-auto my-1">
      					<select class="custom-select mr-sm-2" id="tipoPesquisa" name="opcaoPesquisa">
                                                        <option  value="Titulo">Título</option>
                                                        <option  value="Autor">Autor</option>
                                                        <option  value="Editora">Editora</option>
                                                        <option  value="Genero">Genero</option>
      					</select>
    			</div>
 
				<div class="col-auto col-md-8">
					<input class="form-control col-md-10" type="text" placeholder="Search" name="palavraChave">		
				</div>
					<button type="submit" class="btn btn-primary" id="botao1">Pesquisa</button>
  				</div>
       </form>
        <button type="button" class="btn btn-primary" id="botao">Ordena</button>
        
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
        
        
        <table class="table table-striped table table-hover" >
            
			<tbody id="tblProduto">
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
					<th scope="col" class='idUsuario'> id_usuario</th>
				</tr>
        
				<% 


				   for(int i = 0; i < produtos.size();i++){

					  out.println( "<tr class='item linha'>"+
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
						"<td class='preco'>R$"+produtos.get(i).getPreco()+"</td>"+
						"<td class='idUsuario'>"+produtos.get(i).getId_usuario()+"</td>"+"</tr>");
				   }
				%>
			
		</tbody>
        <table>
	</body>
</html>
