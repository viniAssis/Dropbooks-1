<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Cadastrar Produtos</title>
        <link href="res/css/bootstrap.min.css" rel="stylesheet">
        <link href="res/css/modern-business.css" rel="stylesheet">
        <link href="res/css/modern-business.css" rel="stylesheet">
        <script src="res/jquery-3.3.1.js"></script>
        <link href="res/js/dist/dropdown.js" rel="stylesheet">
        <script src="res/jquery-1.10.2.js"></script>
        <script src="res/js/cadastroProduto.js"></script>
        <script>
            $(function () {
                $("#header").load("MenuNavBar.jsp");
                $("#footer").load("Footer.jsp");
            });
        </script>
        <style>

            #caixa2{
                margin-top: 5%;
                margin-left: 20%;
                margin-bottom: 3%;
                clear: both;

            }

            #container1{
                width: 70%;
                height: 800px;
                margin:  0 auto;
                margin-top: 4%;
                margin-bottom: 7%;

            }

            .container1, .container2{
                display: block;
                float: left;
                width: 40%;
                height: 70%;
                margin-left: 7%;
                margin-bottom: 5%;
                margin-top: 5%;

            }

            .dropdown1{
                padding-top: 30px;
                padding-right: 60px;
                margin-left: 5%;


            }

            h1{
                text-align: center;
                 color: #090446 !important;
            }

            #botao{
                clear: both;
                margin-left: 15%;
            }

            #btnCad, #btnCanc{margin-left: 15%;}

            #texto{
                font-size: 18px;
                color: black;
            }	
            
               #botao1, #btnCad, #btnCanc{
                background: #090446;
                color:#FEB95F;
            } 
            
            .img{
                margin-top: 6%;
            }
        </style> 
        <%
            String email = request.getSession().getAttribute("email").toString();

            Usuario user = new UsuarioDAO().getUsuario(email);

        %>
    </head>
    <body>
        <div id="header"></div>
        <form id="caixa2" enctype="multipart/form-data">
            <div class="form-row align-items-center">
                <div class="col-auto my-1">
                    <select class="custom-select mr-sm-2 border border-dark" id="tipoPesquisa">
                        <option selected>Titulo</option>
                        <option>Autor</option>
                        <option>Editora</option>
                        <option>Genero</option>
                    </select>
                </div>
                <div class="col-auto col-md-6">
                    <input class="form-control mr-sm-2  border border-dark" type="search" placeholder="Pesquisar" aria-label="Pesquisar" name="pesquisa">
                </div>
                <button type="submit" class="btn btn-primary border border-dark" id="botao1" name="botao1">Pesquisa</button>
            </div>
        </form> 

        <form method="post" id= "container1" action="CadastroProdutoServlet" enctype="multipart/form-data">

            <h1>Cadastro de Livro</h1>

            <div class="container1">
                
                <div  class="form-signin"> 
                    
                   
                    <div class="form-group">
                        <label id="texto" >Titulo do Livro</label>
                        <input type="text" class="form-control  border border-dark" id="nameLivro" name="nameLivro" required>
                    </div>   

                    <div class="form-group">
                        <label id="texto">Autor</label>
                        <input type="text" class="form-control  border border-dark" id="nameAutor" name="nameAutor" required>
                    </div>

                    <!--Editora -->
                    <div class="form-group">
                        <label id="texto">Editora</label>
                        <input type="text" class="form-control  border border-dark" id="nameEditora" name="nameEditora" required>
                    </div>

                    <!--Ano de Lan�amento e Genero -->
                    <div class="form-group">
                        <div class="row">
                            <div class="col">
                                <label id="texto">Ano de Lan�amento</label>
                                <input type="date" class="form-control  border border-dark" id="anoLancamento" name="anoLancamento" required>
                            </div>

                            <div class="dropdown1">
                                <select class="btn  dropdown-toggle  border border-dark" name="genero">
                                    <option selected>Rom�ntico</option>
                                    <option>Literatura</option>
                                    <option>Suspense</option>

                                </select>
                            </div>
                        </div>    
                    </div>

                    <!-- Fale um pouco -->
                    <div class="form-group">
                        <label id="texto">Fale um pouco sobre o conte�do</label>
                        <textarea class="form-control  border border-dark" id="descricao" name="descricao" placeholder="Descri��o do produto" rows="3"></textarea>
                    </div>
                </div>
            </div>

            <div class="container2">
                <div class="form-signin">

                    <!-- Idioma -->
                    <div class="form-group">
                        <label id="texto">Idioma</label>
                        <input type="text" class="form-control  border border-dark" id="idiomaLivro" name="idiomaLivro" required>
                    </div>

                    <!-- Quantidade -->
                    <div class="form-group">
                        <label id="texto">Quantidade</label>
                        <input type="number" class="form-control  border border-dark" id="qtdLivro" name="qtdLivro" required>
                    </div>

                    <!-- Valor de cada Livro-->	
                    <div class="form-group">
                        <label id="texto">Valor do Livro</label>
                        <input type="text" class="form-control  border border-dark" id="valorLivro" name="valorLivro" required>
                    </div>


                    <!-- Imagens -->
                    <div class="form-group">
                        <input type="file" class="form-control  img" id="imagem_1" name="imagem_1" accept="image/*" required>
                        <input type="file" class="form-control  img" id="imagem_2" name="imagem_2" accept="image/*">
                        <input type="file" class="form-control  img" id="imagem_3" name="imagem_3" accept="image/*">
                        <input type="file" class="form-control  img" id="imagem_4" name="imagem_4" accept="image/*">
                        <input type="file" class="form-control  img" id="imagem_5" name="imagem_5" accept="image/*">
                    </div>

                </div>
            </div>

            <div id="botao">
                <button id="btnCad" type="submit" class="btn btn-primary border border-dark">Cadastrar Livro</button>
                <button id="btnCanc" type="button" class="btn btn-primary border border-dark">Cancelar</button>
            </div>

        </form>

        <!-- Footer -->
        <div id="footer"></div>

        <!-- Foi colocado no final para a p�gina carregar mais r�pido -->
        <script src="res/jquery-3.3.1.slim.min.js" ></script>
        <script src="res/popper.js"></script>
        <script>window.jQuery || document.write('<script src="res/vendor/jquery/jquery-slim.min.js"><\/script>')</script>
        <script src="res/js/bootstrap.min.js"></script>
        <!-- S� faz o nossos placeholders de imagens funcionarem. N�o precisar copiar a pr�xima linha! -->
        <script src="res/js/bootstrap.bundle.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script src="res/vendor/jquery/jquery.min.js"></script>
        <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
