
<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page import="modelDAO.ProdutoDAO"%>
<%@page import="model.Produto"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Catalogo do Livro</title>

        <!-- Principal CSS do Bootstrap -->
        <link href="res/css/bootstrap.min.css" rel="stylesheet">
        <link href="res/js/dist/dropdown.js" rel="stylesheet">
        <style>
            .cabecalho{
                height: 40px;	
                width: 100%; 
                margin-bottom: 5%;
                margin: auto;
            }

            .login, .nome{
                float: right;
                font-size: 18px;
                color: white;
            }

            .nome{margin-right: 25%;}

            /**#container1{
                    height: 800px;
                    width: 90%;
                    margin-left: 5%;
                    background: #CFCFCF;
                    margin-top: 30px;
                    border-radius: 100px 100px 0 0 ;
            }**/

            .titulo{
                padding-top: 5%;
                text-align: center;
                margin-bottom: 7%
            }

            body{ background-image: url(res/img/bgPadrao.jpg); }           

            #caixa2{
                margin-top: 5%;
                margin-left: 20%;
                margin-bottom: 10%;
                clear: both;
            }

            table{width: 100%;}

            #conteudo{
                width: 200px;
                padding: 15px;
                margin: 50px auto;
                display: table;

            }



            .modal-body{ background: #179588; }

            .modal-header{
                text-align: center;
                background-color: #C1839F;
            }

            .toggle {
                margin-bottom: 40px;
                padding: 30px;

            }

            .toggle > input { display: none; }

            .toggle > label {
                position: relative;
                display: block;
                height: 20px;
                width: 44px;
                background: #898989;
                border-radius: 100px;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .toggle > label:after {
                position: absolute;
                left: -2px;
                top: -3px;
                display: block;
                width: 26px;
                height: 26px;
                border-radius: 100px;
                background: #fff;
                box-shadow: 0px 3px 3px rgba(0,0,0,0.05);
                content: '';
                transition: all 0.3s ease;
            }

            .toggle > label:active:after { transform: scale(1.15, 0.85); }

            .toggle > input:checked ~ label { background: #6fbeb5; }

            .toggle > input:checked ~ label:after {
                left: 20px;
                background: #179588;
            }

            .form-group{
                margin-left: 5%;
                display: block;
                width: 250px;
            }

            .modal-body{ background: #179588; }

            .modal-header{
                text-align: center;
                background-color: #C1839F;
            }

            .sliderCheck{ margin-top: 10px; }

            .switch {
                position: relative;
                display: inline-block;
                width: 60px;
                height: 34px;
            }

            .switch input {display:none;}

            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #ccc;
                transition: .4s;
            }

            .slider:before {
                position: absolute;
                content: "";
                height: 26px;
                width: 26px;
                left: 4px;
                bottom: 4px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

            input:checked + .slider { background-color: #2196F3; }

            input:focus + .slider { box-shadow: 0 0 1px #2196F3; }

            input:checked + .slider:before { transform: translateX(26px);}

            .slider.round { border-radius: 34px; }

            .slider.round:before { border-radius: 50%; }

            .container_1{

                margin-left: 20%;
            }

            .caixa{
                border: 1px solid grey;
                background: #FFFFF0;
                height:75%;
                width: 20%;
                margin-left: 4%;
                overflow: auto;
                text-align: center;
                display: table;
                float: left;
                margin-top: 2%;
                box-shadow: 0 2px 4px 2px #D3D3D3;
                margin-bottom: 10%;
            }

            img{
                margin-top: 5%;
                width: 200px;
                height: 230px;
            }
            .dropdown-toggle{
                background-color: #C1839F;
                color: white;   
                margin-left: 10px;

            }
            #dropdown1 , #dropdown2  {

                margin-top: 5%;	
                margin-bottom: 5%;	
                width: 25%;
                float: left;
                margin-left: 15%;
            }


            .input-group{
                margin-top: 5%;

            }
            .input{
                width: 100%;
                border-radius: 5px;
                box-shadow: 0 1px 2px 1px #D3D3D3;
                margin: 3px;


            }
            .formLivro{
                text-align:left;
                padding: 3px;
                font-size: 20px;
                margin-left: 10px;
                color: black;

            }

            #idEditar, #idExcluir{
                margin-top: 2%;
                margin-left: 5%;
                margin-bottom: 2%;
                width: 30%;
                background: #008B8B;
                border: #C1839F;
                color: white;
            }



            nav >a{
                margin-top: 3%;
                font-size: 22px;
                color: white;
            }


            #menu a:hover{
                color: black;
            }

            a:hover{
                color: black;
                text-decoration: none;
            }


            #botao1{
                background: #008B8B;
                border:  #008B8B;
                margin-left: 3%;

            }

            .desativar{
                color: black;
                margin-left: 120%;
            }

            #idConfirmar, #idFechar, #edcatalogo{
                background: #C1839F;
                border: #C1839F;
            }

        </style> 
        <script type="text/javascript">
            function redireciona(param) {
                location.href = param;
            }
            
            
        </script>
        
        <style>
            .login,.nome{
                float: right;
                font-size: 18px;
                color: white;
            }
        </style>

        <%

                
            // ID do produto
            int id = 1;
            // Está criando um produto, passado pelo ID
            Produto prod = new ProdutoDAO().getProduto(id);
           
            String titulo, autor, editora, publicacao, descricao, genero, idioma, status = null;
            float valor;
            
            if(prod != null) {
              titulo = prod.getTitulo();
              autor = prod.getAutor();
              valor = prod.getPreco();
              editora = prod.getEditora();
              publicacao = String.valueOf(prod.getDataPublicacao());
              descricao = prod.getDescricao();
              genero = prod.getGenero();
              idioma = prod.getIdioma();
              //foto = prod.getFoto();
              
              
              
              
                // Retorna o status do produto
                if (prod.getAtivo() == 1) {
                    status = "checked";
                } else if (prod.getAtivo() == 0) {
                    status = null;
                } else {

                }
             
            
            } else {
              titulo = "";
              autor = "";
              valor = 0.0f;
              publicacao = "";
              editora = "";
              descricao = "";
              genero = "";
              idioma = "";
              //foto = "";
            }
            


            

            
            
            

        %>

    </head>
    <body>   
        <div class="container-fluid">

            <!--<div class="cabecalho">
                
                <%
                    //if(session.getAttribute("email") != null){
                        
                       //String email = request.getSession().getAttribute("email").toString();

                       //Usuario user = new UsuarioDAO().getUsuario(email);    
                       //out.print("<a class=nav-item nav-link href=alterarCadastro.jsp>Bem Vindo(a) "+user.getNomeRazao() +"</a>");
                   //}else{
                      // out.print("<a class=nav-item nav-link href=login.jsp>Login</a>");
                      // out.print("<a class=nav-item nav-link href=cadastro.html>Registrar-se</a>");
                    //}
                
                
                %> --> 
                
                <!--<a href="#" class="login">Login/Registra-se</a>-->
                
                
               <!-- <span class="nome">Droopboks</span>
            </div>--> 
               
              <nav class="navbar navbar-expand-md  ">	
    <a class="navbar-brand" href="#">Dropbooks</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
     <span class="navbar-toggler-icon"></span>
 </button>

 <div class="collapse navbar-collapse " id="navbarNavAltMarkup">
     <div class="navbar-nav ml-auto">
            <%

                   if(session.getAttribute("email") != null){
                        
                       String email = request.getSession().getAttribute("email").toString();

                       Usuario user = new UsuarioDAO().getUsuario(email);    
                       out.print("<a class=nav-item nav-link href=alterarCadastro.jsp>Bem Vindo(a) "+user.getNomeRazao() +"</a>");
                    }else{
                       out.print("<a class=nav-item nav-link href=login.jsp>Login</a>");
                       out.print("<a class=nav-item nav-link href=cadastro.html>Registrar-se</a>");
                    }
   
            %>  
    </div><!-- fim da class que ajusta o nav  -->
</div><!-- Fim do nav collapse-->
</nav> <!--fim do nav--><br> 
               
            <form id="caixa2" method="post" name="PesquisarLivrosServlet">
                <div class="form-row align-items-center" >
                    <div class="col-auto my-1">
                        <select class="custom-select mr-sm-2" id="tipoPesquisa" name="opcaoPesquisa">
                            <option  value="Titulo">Título</option>
                            <option  value="Autor">Autor</option>
                            <option  value="Editora">Editora</option>
                            <option  value="Genero">Genero</option>
                        </select>
                    </div>

                    <div class="col-auto col-md-5">
                        <input class="form-control mr-sm-2" type="search" placeholder="Pesquisar" aria-label="Pesquisar" name="pesquisa">
                    </div>
                    <button type="submit" class="btn btn-primary" id="botao1" name="botao1">Pesquisa</button>
                </div>
            </form>


            <nav class="nav nav-pills flex-column flex-sm-row" id="menu">
                <a class="flex-sm-fill text-sm-center nav-link" href="home.jsp">Home</a>
                <a class="flex-sm-fill text-sm-center nav-link" href="#">Livro</a>
                <a class="flex-sm-fill text-sm-center nav-link" href="#">FAQ</a>
                <a class="flex-sm-fill text-sm-center nav-link" href="contato.jsp">Contato</a>
            </nav>
        </div>

        <div id= "container1">

            <h4 class="titulo">Catálogo do Livro</h4>
            <div id="container" >	
                <table>
                    <tr>
                        <td class="caixa">
                            <img src="https://images.livrariasaraiva.com.br/imagemnet/imagem.aspx/?pro_id=2870760&qld=90&l=430&a=-1" width="200" height = "200"  alt="">
                            <p> Titulo: <span name="titulo" id="texto"><%= titulo %></span></p>
                            <p> Autor:  <span name="autor" id="autor"><%= autor %></span></p>
                            <p> Valor: R&#36;: <span name="valor" id="valor"><%= valor %></span></p>

                            <!-- Botão para acionar modal BOTAO EDITAR -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ExemploModalCentralizado" name="editar" id="idEditar">
                                Editar
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="ExemploModalCentralizado" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Editar Catálogo</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <center>
                                                <form method="post" action="AlterarProdutoServlet" name="ed_catalogo">
                                                    <table>
                                                        <tr>
                                                            <td class="formLivro">Titulo do Livro:</td>
                                                            <td style="color:black">
                                                                <input type="text" class="input" name="namelivro" id="namelivro" placeholder="" value="<%= titulo %>">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Nome do Autor: </td>
                                                            <td style="color:black">
                                                                <input type="text" class="input" name="nameAutor" id="nameAutor" placeholder="" value="<%= autor %>">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Nome da Editora: </td>
                                                            <td style="color:black">
                                                                <input type="text" class="input" name="nameEditora" id="nameEditora" placeholder="" value="<%= editora %>">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Ano de Lançamento: </td>
                                                            <td style="color:black">
                                                                <input type="date" class="input" name="anoLancamento" id="anoLancamento" placeholder=""  value="<%= publicacao %>">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Valor do Livro: </td>
                                                            <td style="color:black">
                                                                <input type="text"  class="input" name="valor" id="idValor" placeholder="" value="<%= valor %>">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Descrição: </td>
                                                            <td style="color:black">
                                                                <textarea class="form-control input" id="descricao" name="descricaoProduto" value="" placeholder="" rows="3" ><%= descricao %></textarea>
                                                            </td>
                                                        </tr>

                                                    </table>
                                                    <div class="dropdown" id="dropdown1">
                                                        <button class="btn  dropdown-toggle" type="button" id="idGenero" name="menuGenero" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" value="<%= genero %>">Gênero</button>
                                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                            <a class="dropdown-item" href="#" name="drama" id="drama">Drama</a>
                                                            <a class="dropdown-item" href="#" name="acao" id="acao">Ação</a>
                                                            <a class="dropdown-item" href="#" name="aventura" id="aventura">Aventura</a>
                                                            <a class="dropdown-item" href="#" name="comedia" id="comedia">Comédia</a>
                                                            <a class="dropdown-item" href="#" name="fantasia" id="fantasia">Fantasia</a>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown" id="dropdown2">    
                                                        <button class="btn  dropdown-toggle" type="button" id="idIdioma" name="menuIdioma" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" value="<%= idioma %>">Idioma</button>
                                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                            <a class="dropdown-item" href="#" name="idiomaPortugues" id="idiomaPortugues">Português</a>
                                                            <a class="dropdown-item" href="#" name="idiomaIngles" id="idiomaIngles">Inglês</a>
                                                        </div>
                                                    </div>

                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="inputGroupFileAddon01">Alterar Foto</span>
                                                        </div>
                                                        <div class="custom-file">
                                                            <input type="file" class="custom-file-input" id="inputFoto" name="inputFoto"aria-describedby="inputGroupFileAddon01">
                                                            <label class="custom-file-label" for="inputGroupFile01"></label>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <button type="submit" class="btn btn-primary" name="editar_catalogo" id="edcatalogo">Editar Catálogo</button>
                                                </form>
                                            </center>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Botão para acionar modal BOTAO EXCLUIR -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalExemplo" name="excluir" id="idExcluir">
                                Excluir
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="modalExemplo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Atenção !!!</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            Você tem certeza que quer excluir esse livro do seu catálogo? 
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" name="confirmar" id="idConfirmar" onClick="redireciona('ExcluirProdutoServlet');">Sim</button>
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal" name="fechar" id="idFechar">Fechar</button>  
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="sliderCheck">
                                <label class="switch">
                                    <input type="checkbox" name="statusCheckbox1" <%= status %> onClick="redireciona('StatusProdutoServlet');">
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </td>

                        <td class="caixa">
                            <img src="https://images.livrariasaraiva.com.br/imagemnet/imagem.aspx/?pro_id=2870760&qld=90&l=430&a=-1" width="200" height = "200"  alt="">
                            <p> Titulo: <span name="titulo" id="texto"> </span></p>
                            <p> Autor:  <span name="autor" id="autor"></span></p>
                            <p> Valor: R&#36;: <span name="valor" id="valor">0.0</span></p>

                            <!-- Botão para acionar modal BOTAO EDITAR -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ExemploModalCentralizado" name="editar" id="idEditar">
                                Editar
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="ExemploModalCentralizado" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Editar Catálogo</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <center>
                                                <form method="post" action" "name="ed_catalogo">
                                                      <table>
                                                        <tr>
                                                            <td class="formLivro">Titulo do Livro:</td>
                                                            <td style="color:black">
                                                                <input type="text" class="input" name="namelivro" id="namelivro" placeholder="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Nome do Autor: </td>
                                                            <td style="color:black">
                                                                <input type="text" class="input" name="nameAutor" id="nameAutor" placeholder="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Nome da Editora: </td>
                                                            <td style="color:black">
                                                                <input type="text" class="input" name="nameEditora" id="nameEditora" placeholder="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Ano de Lançamento: </td>
                                                            <td style="color:black">
                                                                <input type="date" class="input" name="anoLancamento" id="anoLancamento" placeholder="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Valor do Livro: </td>
                                                            <td style="color:black">
                                                                <input type="text"  class="input" name="valor" id="idValor" placeholder="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Descrição: </td>
                                                            <td style="color:black">
                                                                <textarea class="form-control input" id="descricao" name="descricaoProduto" placeholder="Descrição do produto" rows="3"></textarea>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Estado de conservação: </td>
                                                            <td style="color:black">
                                                                <textarea class="form-control input" id="descricao" name="estadoProduto" placeholder="Estado do Produto" rows="3"></textarea>
                                                            </td>    
                                                        </tr> 
                                                    </table>
                                                    <div class="dropdown" id="dropdown1">
                                                        <button class="btn  dropdown-toggle" type="button" id="idGenero" name="menuGenero" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Gênero</button>
                                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                            <a class="dropdown-item" href="#" name="drama" id="drama">Drama</a>
                                                            <a class="dropdown-item" href="#" name="acao" id="acao">Ação</a>
                                                            <a class="dropdown-item" href="#" name="aventura" id="aventura">Aventura</a>
                                                            <a class="dropdown-item" href="#" name="comedia" id="comedia">Comédia</a>
                                                            <a class="dropdown-item" href="#" name="fantasia" id="fantasia">Fantasia</a>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown" id="dropdown2">    
                                                        <button class="btn  dropdown-toggle" type="button" id="idIdioma" name="menuIdioma" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Idioma</button>
                                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                            <a class="dropdown-item" href="#" name="idiomaPortugues" id="idiomaPortugues">Português</a>
                                                            <a class="dropdown-item" href="#" name="idiomaIngles" id="idiomaIngles">Inglês</a>
                                                        </div>
                                                    </div>

                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="inputGroupFileAddon01">Alterar Foto</span>
                                                        </div>
                                                        <div class="custom-file">
                                                            <input type="file" class="custom-file-input" id="inputFoto" name="inputFoto"aria-describedby="inputGroupFileAddon01">
                                                            <label class="custom-file-label" for="inputGroupFile01"></label>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <button type="button" class="btn btn-primary" name="editar_catalogo" id="edcatalogo">Editar Catálogo</button>
                                                </form>
                                            </center>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Botão para acionar modal BOTAO EXCLUIR -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalExemplo" name="excluir" id="idExcluir">
                                Excluir
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="modalExemplo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Atenção !!!</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            Você tem certeza que quer excluir esse livro do seu catálogo? 
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" name="confirmar" id="idConfirmar">Sim</button>
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal" name="fechar" id="idFechar">Fechar</button>  
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="sliderCheck">
                                <label class="switch">
                                    <input type="checkbox" name="statusCheckbox2">
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </td>


                        <td class="caixa">
                            <img src="https://images.livrariasaraiva.com.br/imagemnet/imagem.aspx/?pro_id=2870760&qld=90&l=430&a=-1" width="200" height = "200"  alt="">
                            <p> Titulo: <span name="titulo" id="texto"> </span></p>
                            <p> Autor:  <span name="autor" id="autor"></span></p>
                            <p> Valor: R&#36;: <span name="valor" id="valor">0.0</span></p>

                            <!-- Botão para acionar modal BOTAO EDITAR -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ExemploModalCentralizado" name="editar" id="idEditar">
                                Editar
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="ExemploModalCentralizado" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Editar Catálogo</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <center>
                                                <form method="post" action" "name="ed_catalogo">
                                                      <table>
                                                        <tr>
                                                            <td class="formLivro">Titulo do Livro:</td>
                                                            <td style="color:black">
                                                                <input type="text" class="input" name="namelivro" id="namelivro" placeholder="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Nome do Autor: </td>
                                                            <td style="color:black">
                                                                <input type="text" class="input" name="nameAutor" id="nameAutor" placeholder="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Nome da Editora: </td>
                                                            <td style="color:black">
                                                                <input type="text" class="input" name="nameEditora" id="nameEditora" placeholder="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Ano de Lançamento: </td>
                                                            <td style="color:black">
                                                                <input type="date" class="input" name="anoLancamento" id="anoLancamento" placeholder="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Valor do Livro: </td>
                                                            <td style="color:black">
                                                                <input type="text"  class="input" name="valor" id="idValor" placeholder="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Descrição: </td>
                                                            <td style="color:black">
                                                                <textarea class="form-control input" id="descricao" name="descricaoProduto" placeholder="Descrição do produto" rows="3"></textarea>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Estado de conservação: </td>
                                                            <td style="color:black">
                                                                <textarea class="form-control input" id="descricao" name="estadoProduto" placeholder="Estado do Produto" rows="3"></textarea>
                                                            </td>    
                                                        </tr> 
                                                    </table>
                                                    <div class="dropdown" id="dropdown1">
                                                        <button class="btn  dropdown-toggle" type="button" id="idGenero" name="menuGenero" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Gênero</button>
                                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                            <a class="dropdown-item" href="#" name="drama" id="drama">Drama</a>
                                                            <a class="dropdown-item" href="#" name="acao" id="acao">Ação</a>
                                                            <a class="dropdown-item" href="#" name="aventura" id="aventura">Aventura</a>
                                                            <a class="dropdown-item" href="#" name="comedia" id="comedia">Comédia</a>
                                                            <a class="dropdown-item" href="#" name="fantasia" id="fantasia">Fantasia</a>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown" id="dropdown2">    
                                                        <button class="btn  dropdown-toggle" type="button" id="idIdioma" name="menuIdioma" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Idioma</button>
                                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                            <a class="dropdown-item" href="#" name="idiomaPortugues" id="idiomaPortugues">Português</a>
                                                            <a class="dropdown-item" href="#" name="idiomaIngles" id="idiomaIngles">Inglês</a>
                                                        </div>
                                                    </div>

                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="inputGroupFileAddon01">Alterar Foto</span>
                                                        </div>
                                                        <div class="custom-file">
                                                            <input type="file" class="custom-file-input" id="inputFoto" name="inputFoto"aria-describedby="inputGroupFileAddon01">
                                                            <label class="custom-file-label" for="inputGroupFile01"></label>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <button type="button" class="btn btn-primary" name="editar_catalogo" id="edcatalogo">Editar Catálogo</button>
                                                </form>
                                            </center>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Botão para acionar modal BOTAO EXCLUIR -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalExemplo" name="excluir" id="idExcluir">
                                Excluir
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="modalExemplo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Atenção !!!</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            Você tem certeza que quer excluir esse livro do seu catálogo? 
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" name="confirmar" id="idConfirmar">Sim</button>
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal" name="fechar" id="idFechar">Fechar</button>  
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="sliderCheck">
                                <label class="switch">
                                    <input type="checkbox" name="statusCheckbox3">
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </td>


                        <td class="caixa">
                            <img src="https://images.livrariasaraiva.com.br/imagemnet/imagem.aspx/?pro_id=2870760&qld=90&l=430&a=-1" width="200" height = "200"  alt="">
                            <p> Titulo: <span name="titulo" id="texto"> </span></p>
                            <p> Autor:  <span name="autor" id="autor"></span></p>
                            <p> Valor: R&#36;: <span name="valor" id="valor">0.0</span></p>

                            <!-- Botão para acionar modal BOTAO EDITAR -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ExemploModalCentralizado" name="editar" id="idEditar">
                                Editar
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="ExemploModalCentralizado" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Editar Catálogo</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <center>
                                                <form method="post" action" "name="ed_catalogo">
                                                      <table>
                                                        <tr>
                                                            <td class="formLivro">Titulo do Livro:</td>
                                                            <td style="color:black">
                                                                <input type="text" class="input" name="namelivro" id="namelivro" placeholder="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Nome do Autor: </td>
                                                            <td style="color:black">
                                                                <input type="text" class="input" name="nameAutor" id="nameAutor" placeholder="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Nome da Editora: </td>
                                                            <td style="color:black">
                                                                <input type="text" class="input" name="nameEditora" id="nameEditora" placeholder="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Ano de Lançamento: </td>
                                                            <td style="color:black">
                                                                <input type="date" class="input" name="anoLancamento" id="anoLancamento" placeholder="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Valor do Livro: </td>
                                                            <td style="color:black">
                                                                <input type="text"  class="input" name="valor" id="idValor" placeholder="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Descrição: </td>
                                                            <td style="color:black">
                                                                <textarea class="form-control input" id="descricao" name="descricaoProduto" placeholder="Descrição do produto" rows="3"></textarea>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formLivro">Estado de conservação: </td>
                                                            <td style="color:black">
                                                                <textarea class="form-control input" id="descricao" name="estadoProduto" placeholder="Estado do Produto" rows="3"></textarea>
                                                            </td>    
                                                        </tr> 
                                                    </table>
                                                    <div class="dropdown" id="dropdown1">
                                                        <button class="btn  dropdown-toggle" type="button" id="idGenero" name="menuGenero" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Gênero</button>
                                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                            <a class="dropdown-item" href="#" name="drama" id="drama">Drama</a>
                                                            <a class="dropdown-item" href="#" name="acao" id="acao">Ação</a>
                                                            <a class="dropdown-item" href="#" name="aventura" id="aventura">Aventura</a>
                                                            <a class="dropdown-item" href="#" name="comedia" id="comedia">Comédia</a>
                                                            <a class="dropdown-item" href="#" name="fantasia" id="fantasia">Fantasia</a>
                                                        </div>
                                                    </div>
                                                    <div class="dropdown" id="dropdown2">    
                                                        <button class="btn  dropdown-toggle" type="button" id="idIdioma" name="menuIdioma" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Idioma</button>
                                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                            <a class="dropdown-item" href="#" name="idiomaPortugues" id="idiomaPortugues">Português</a>
                                                            <a class="dropdown-item" href="#" name="idiomaIngles" id="idiomaIngles">Inglês</a>
                                                        </div>
                                                    </div>

                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="inputGroupFileAddon01">Alterar Foto</span>
                                                        </div>
                                                        <div class="custom-file">
                                                            <input type="file" class="custom-file-input" id="inputFoto" name="inputFoto"aria-describedby="inputGroupFileAddon01">
                                                            <label class="custom-file-label" for="inputGroupFile01"></label>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <button type="button" class="btn btn-primary" name="editar_catalogo" id="edcatalogo">Editar Catálogo</button>
                                                </form>
                                            </center>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Botão para acionar modal BOTAO EXCLUIR -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalExemplo" name="excluir" id="idExcluir">
                                Excluir
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="modalExemplo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Atenção !!!</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            Você tem certeza que quer excluir esse livro do seu catálogo? 
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" name="confirmar" id="idConfirmar">Sim</button>
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal" name="fechar" id="idFechar">Fechar</button>  
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="sliderCheck">
                                <label class="switch">
                                    <input type="checkbox" name="statusCheckbox4">
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </td>



                    </tr>
                </table>

            </div>



            <footer></footer>

            <!-- Principal JavaScript do Bootstrap
             ================================================== -->
            <!-- Foi colocado no final para a página carregar mais rápido -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://unpkg.com/popper.js"></script>
            <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
            <script src="res/js/bootstrap.min.js"></script>
            <!-- Só faz o nossos placeholders de imagens funcionarem. Não precisar copiar a próxima linha! -->
            <script src="res/js/bootstrap.bundle.min.js"></script>

        </div>
    </body>
</html>