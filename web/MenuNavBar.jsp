<%@page import="model.Utilitarios"%>
<%@page import="modelDAO.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
     <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="res/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/util.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/main.css"/>

    <title>DropBooks</title>

		 
		 <!-- Bootstrap core CSS -->
    <link href="res/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="res/css/modern-business.css" rel="stylesheet">
    
    <style>
        
        .card-img-top{
            max-width: 500px;
            max-height: 300px;
        }
        
        #caixa2{
                margin-top: 5%;
                margin-left: 25%;
                margin-bottom: 3%;
                clear: both;
            }
            
                   #nav{
                                background: #090446;
                            }
                            .navbar .navbar-nav li a{
                                color: #FEB95F !important;
                                font-weight: 400;
                            }
                            .navbar .navbar-nav li a:hover{
                                color: #FEB95F !important;
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
            }
            #corAmarelo{
                color:#FEB95F ;
            }
            #corBranca{
                color: white;
            }
           
            
    </style>
	  
  </head>
  
  

  <body>
      
      <nav class="navbar fixed-top navbar-expand-lg navbar-dark  fixed-top" id="nav">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">DropBooks</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Contato.jsp">Contato</a>
                        </li>
                        <li class="nav-item">
                            <%
                                response.setContentType("text/html;charset=UTF-8");
                                
                                
                                
                                if(session.getAttribute("email") != null) {

                                    String email = request.getSession().getAttribute("email").toString();

                                    Usuario user = new UsuarioDAO().getUsuario(email);
                             
                                    out.print("</li>");
                                    out.print("<li class=nav-item>");
                                    out.print("<li class='nav-item dropdown'> "
                                            + "<a class='nav-link dropdown-toggle' href='#' id='navbarDropdownPortfolio' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"+ user.getNomeRazao() +"</a>"
                                            +"<div class='dropdown-menu dropdown-menu-right' aria-labelledby='navbarDropdownPortfolio'>");
                                                if(user.getNivel_usuario().equals("1")){
                                                    out.print("<a class='dropdown-item' href='cadastroFuncionario.jsp' id='link' >Cadastrar Funcionários</a>");
                                                    out.print("<a class='dropdown-item' href='listaUsuarioFuncionario.jsp' >Lista de Funcionários</a>");
                                               
                                                }
                                    out.print("<a class='dropdown-item' href='carrinho.jsp' >Carrinho</a>"
                                            + "<a class='dropdown-item' href='alterarCadastro.jsp'>Alterar Dados</a>"
                                            + "<a class='dropdown-item' href='catalogoLivro.jsp' >Meu Catalogo</a>"
                                            + "<a class='dropdown-item' href='cadastroProduto.jsp' >Cadastra Catalogo</a>"
                                            + "<a class='dropdown-item' href=Senha.jsp>Alterar Senha</a>"   
                                            + "<a class='dropdown-item' name=Sair href=SairServlet>Sair</a>"
                                            + "</div>"
                                            + "</li>");
                                    
                                } else {
                                    out.print("<a class=nav-link href=login.jsp>Login/Cadastrar</a>");
                                }        
                            %>   
                        </li>               
                    </ul>
                </div>
            </div>
        </nav>
   

  </body>

</html>

