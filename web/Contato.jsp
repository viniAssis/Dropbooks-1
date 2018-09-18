<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!-- Meta tags Obrigatórias -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <script src="res/jquery-3.3.1.js"></script>

        <!-- Bootstrap core CSS -->
        <link href="res/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="res/css/modern-business.css" rel="stylesheet">
        <style>

            #container{
                margin-top: 2%;
                width: 50%;
                margin-left: 30%;    
                margin-bottom: 7%;

            }

            #caixa2{
                margin-top: 5%;
                margin-left: 25%;
                margin-bottom: 3%;
                clear: both;
            }

            .titulo{
                color: black;
                padding: 3%;	
                margin-left: 20%;
            }

            #botao2{
                margin-top: 3%;
                margin-left: 5%;
                margin-bottom: 3%;
                width: 60%;



            } 

        </style>
    </head>
    <body>
        

        <!-- Navigation -->
        <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-primary fixed-top">
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
                            <a class="nav-link" href="#">Livro</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Contato.jsp">Contato</a>
                        </li>
                         <li class="nav-item">
                            <%
                                //VARIAVEIS QUE VÃO PREENCHER OS CAMPOS VAZIOS COM OS DADOS DO USUARIO(SE ESTIVER LOGADO)
                                String _email = "";
                                String _nome = "";
                                //IDENTIFICA SE O USUARIO ESTA LOGADO E TRAZ SEUS DADOS PARA A PAGINA, SE NAO ESTIVER LOGADO, MOSTRA O LINK PARA QUE O IMUNDO POSSA SE LOGAR
                                if (session.getAttribute("email") != null) {

                                    String email = request.getSession().getAttribute("email").toString();

                                    Usuario user = new UsuarioDAO().getUsuario(email);
                                    _email += user.getEmail();
                                    _nome += user.getNomeRazao();
                                    out.print("<a class=nav-link href=alterarCadastro.jsp>Bem Vindo(a) " + user.getNomeRazao() + "</a>");
                                    
                                    
                                } else {
                                    out.print("<a class=nav-link href=login.jsp>Login/Cadastrar</a>");
                                }        
                            %>
                        </li> 
                        <%
                                    if(session.getAttribute("email") != null){
                                        out.print("<li class=nav-item>");
                                        out.print("<a class=nav-link href=index.jsp>Sair</a>");
                                        
                                        out.print("</li>");
                                    }
                        %>
                    </ul>
                </div>
            </div>
        </nav>

        <form id="caixa2">
            <div class="form-row align-items-center">
                <div class="col-auto my-1">
                    <select class="custom-select mr-sm-2 border border-dark" id="tipoPesquisa">
                        <option>Titulo</option>
                        <option>Autor</option>
                        <option>Editora</option>
                        <option>Genero</option>
                    </select>
                </div>
                <div class="col-auto col-md-6">
                    <input class="form-control mr-sm-2 border border-dark" type="search" placeholder="Pesquisar" aria-label="Pesquisar" name="pesquisa">
                </div>
                <button type="submit" class="btn btn-primary" id="botao1" name="botao1">Pesquisa</button>
            </div>
        </form>

        <div  class="container" id="container">

            <h3 class="titulo">Contate-se</h3>

            <form id="form1" method="post" action="EnviaEmailServlet">
                <!-- Nome -->
                <div class="form-row">
                    <div class="form-group col-md-10 mb-8">
                        <label id="texto">Nome <span class="alerta">*</span></label>
                        <input type="text" class="form-control col-md-10  border border-dark" id="nome" name="nome" value="<%=_nome%>">
                    </div>
                </div>

                <!-- Email -->
                <div class="form-row">
                    <div class="form-group col-md-10">
                        <label id="texto">Email <span class="alerta">*</span></label>
                        <input type="email" class="form-control col-md-10  border border-dark" id="email" name="email" value="<%=_email%>">
                    </div>
                </div>

                <!-- Assunto -->
                <div class="form-row">	
                    <div class="form-group col-md-10">
                        <label id="texto">Assunto <span class="alerta">*</span></label>
                        <select id="assunto" class="form-control col-md-10  border border-dark" name="assunto">
                            <option selected>Dúvidas</option>
                            <option>Reclamações</option>
                            <option>Cancelamento</option>
                            <option>Outros Assuntos</option>
                        </select>
                    </div> 
                </div> 

                <!-- Mensagem -->
                <div class="form-group">
                    <label id="texto">Mensagem <span class="alerta">*</span></label>
                    <textarea class="form-control col-md-8  border border-dark" id="mensagem" rows="7" name="mensagem"></textarea>
                </div>

                <button type="submit" class="btn btn-primary" id="botao2" onClick="alert('Mensagem enviada !')">Enviar</button>
            </form>    
        </div>

        <!-- Footer -->
        <footer class="py-5 bg-primary">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; DropBooks</p>
            </div>
            <!-- /.container -->
        </footer>     
    </body>
</html>