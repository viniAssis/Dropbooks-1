<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Dropbooks</title>
    <link href="res/css/bootstrap.css" rel="stylesheet" />
    <link href="res/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="res/css/homescreen.css" rel="stylesheet">

    <meta charset="utf-8">
    <style>
        .login,.nome{
                float: right;
                font-size: 18px;
                color: white;
        }
    </style>
    
</head>
<body>
    <!-- jQuery -->
    <script src="res/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="res/js/bootstrap.js"></script>

<script src="./res/vendor/jquery/jquery.min.js"></script>
<script src="res/js/bootstrap.bundle.min.js"></script>



<!-- Navbar -->
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

    <nav class="nav nav-pills flex-column flex-sm-row" id="menu">
			<a class="flex-sm-fill text-sm-center nav-link" href="#">Home</a>
			<a class="flex-sm-fill text-sm-center nav-link" href="catalogoLivro.jsp">Livro</a>
			<a class="flex-sm-fill text-sm-center nav-link" href="#">FAQ</a>
			<a class="flex-sm-fill text-sm-center nav-link" href="Contato.jsp">Contato</a>
    </nav>


<div id="carrosselHome" class="carousel" data-ride="carousel">
   <ol class="carousel-indicators">
       <li data-target="#carrosselHome" data-slide-to="0" class="active"></li>
        <li data-target="#carrosselHome" data-slide-to="1" class="active"></li>

   </ol>

    <div class="carousel-inner col-lg-12 col-md-6">
        <div class="carousel-item active">
            <img src="res/img/250x250.jpg" class=" img-fluid d-block">
        </div>
        <div class="carousel-item ">
            <img src="https://images.unsplash.com/photo-1497704628914-8772bb97f450?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=1886ee8844a0e5e06d323aa007c96f7c&w=1000&q=80" class="img-fluid d-block">
        </div>

    </div>
    <a class="carousel-control-prev" href="#carrosselHome" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
        <span class="sr-only">Anterior</span>
    </a>

    <a class="carousel-control-next" href="#carrosselHome" role="button" data-slide="next">

        <span class="carousel-control-next-icon"></span>
        <span class="sr-only">Próximo</span>
    </a>

</div>

<!-- Formulário de busca-->
<div class="container col-md-8 col-lg-offset-6 wrapBusca">
    <div class="row">
        <form action="PesquisarLivrosServlet" method="post" id="Pesquisar" class="input-group" name="">

            <div class="input-group-btn search-panel">
                <select name="opcaoPesquisa" id="param_busca" class="barra_busca btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <option class="itemBusca" value="Titulo">Título</option>
                    <option class="itemBusca" value="Autor">Autor</option>
                    <option class="itemBusca" value="Editora">Editora</option>
                    <option class="itemBusca" value="Genero">Editora</option>
                </select>
            </div>
            <input type="text" class="form-control" name="palavraChave" placeholder="Buscar por">
            <span class="input-group-btn">
            </span>
        </form>     
    </div>  <!--fim da div row-->     
</div>  <!-- Fim do container wrapFormulario -->


<!-- inicio do carrossel -->
<!-- Fim do carrossel-->


<div class="container mais-populares">
    <div class="header-populares">
        <h2><strong>Mais</strong> populares</h2>
        <a href="#">Ver mais</a>
    </div>
    <div class="row rowLivros col-md-8">

        <div class="card-deck">
            <div class="card">
                <img class="card-img-top" src="res/img/250x250.jpg" alt="imagem do produto">
                <div class="card-body">
                    <h4 class="card-title nomeLivro">Livro</h4>
                    <p class="card-text nomeAutor">Nome autor</p>
                    <p class="card-text livroPreco">R$ 00,00</p>
                </div>
            </div>

            <div class="card ">
                <img class="card-img-top" src="res/img/250x250.jpg" alt="imagem do produto">
                <div class="card-body">
                    <h4 class="card-title nomeLivro">Livro</h4>
                    <p class="card-text nomeAutor">Nome autor</p>
                    <p class="card-text livroPreco">R$ 00,00</p>
                </div>
            </div>						

            <div class="card ">
                <img class="card-img-top" src="res/img/250x250.jpg" alt="imagem do produto">
                <div class="card-body">
                    <h4 class="card-title nomeLivro">Livro</h4>
                    <p class="card-text nomeAutor">Nome autor</p>
                    <p class="card-text livroPreco">R$ 00,00</p>
                </div>
            </div>						
            <div class="card">
                <img class="card-img-top" src="res/img/250x250.jpg" alt="imagem do produto">
                <div class="card-body">
                    <h4 class="card-title nomeLivro">Livro</h4>
                    <p class="card-text nomeAutor">Nome autor</p>
                    <p class="card-text livroPreco">R$ 00,00</p>
                </div>
            </div>
        </div>
    </div>					
</div>

<div class="container populares-genero">
    <div class="header-populares-genero col-md-4">
        <h2><strong>Mais vendidos em</strong> gênero x</h2>
        <button class="botoes"><a href="https://google.com">Ver mais</a></button>	


    </div>
    <div class="row rowLivros col-md-8">

        <div class="card-deck">
            <div class="card">
                <img class="card-img-top" src="res/img/250x250.jpg" alt="imagem do produto">
                <div class="card-body">
                    <h4 class="card-title nomeLivro">Livro</h4>
                    <p class="card-text nomeAutor">Nome autor</p>
                    <p class="card-text livroPreco">R$ 00,00</p>
                </div>
            </div>

            <div class="card ">
                <img class="card-img-top" src="res/img/250x250.jpg" alt="imagem do produto">
                <div class="card-body">
                    <h4 class="card-title nomeLivro">Livro</h4>
                    <p class="card-text nomeAutor">Nome autor</p>
                    <p class="card-text livroPreco">R$ 00,00</p>
                </div>
            </div>						

            <div class="card ">
                <img class="card-img-top" src="res/img/250x250.jpg" alt="imagem do produto">
                <div class="card-body">
                    <h4 class="card-title nomeLivro">Livro</h4>
                    <p class="card-text nomeAutor">Nome autor</p>
                    <p class="card-text livroPreco">R$ 00,00</p>
                </div>
            </div>						
            <div class="card">
                <img class="card-img-top" src="res/img/250x250.jpg" alt="imagem do produto">
                <div class="card-body">
                    <h4 class="card-title nomeLivro">Livro</h4>
                    <p class="card-text nomeAutor">Nome autor</p>
                    <p class="card-text livroPreco">R$ 00,00</p>
                </div>
            </div>					
        </div>
    </div>					
</div>		
</body>
</html>