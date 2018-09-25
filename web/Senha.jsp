<%-- 
    Document   : Senha
    Created on : 23/09/2018, 13:02:25
    Author     : Caique
--%>

<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>DropBooks</title>

        <link href="res/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="res/css/modern-business.css" rel="stylesheet">

                <script src="res/jquery-3.3.1.js"></script>

               <!-- <link href="res/css/the-big-picture.css" rel="stylesheet">
               -->
	        <script type="text/javascript">
                      
            $(document).ready(function () {
                $("#validaEmail").hide();
                $("#validaCpf").hide();
                $("#validaOk").hide();
                $('#enviar').click(function () {

                    $("#validaEmail").hide();
                    $("#validaCpf").hide();

                    var email = $("#email").val();
                    var cpf = $("#cpf").val();
                    var senha = $("#senha").val();

                    $.ajax({
                        type: 'POST',
                        url: "RecupSenhaServlet",
                        data: {
                            email: email,
                            cpf: cpf,
                            senha: senha
                        },
                        success: function (results) {
                            if (results === "1") {
                                $("#validaEmail").show();
                            } else if (results === "2") {
                                $("#validaCpf").show();
                            } else {
                                $("#validaOk").show();
                                $("#enviar").hide();
                                //window.location.href = "../recupSenha";
                            }
                        }
                    });
                });
            });
        </script>
        
        <style>
            .conteudo{ 
                height: 350px;
                width: 450px;
                margin-top: 5%;
                margin: 0 auto;
            }

            input{
                margin:  20px;
                font-weight: 800; 
                }

            #enviar{
                margin-top: 2%;
                margin-left: 35%
            }
            
            
        </style>
  </head>

  <body>

        <!-- Navigation -->
    <!-- Navigation -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-primary fixed-top" >
            <div class="container">
                <a class="navbar-brand" href="index.jsp">DropBooks</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse"  id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Contato.jsp">Contato</a>
                        </li>
                        <li class="nav-item">
                            <%
                                   
                                if(session.getAttribute("email") != null) {

                                    String email = request.getSession().getAttribute("email").toString();

                                    Usuario user = new UsuarioDAO().getUsuario(email);
                             
                                    out.print("</li>");
                                    out.print("<li class=nav-item>");
                                    out.print("<li class='nav-item dropdown'> "
                                            + "<a class='nav-link dropdown-toggle' href='#' id='navbarDropdownPortfolio' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"+ user.getNomeRazao() +"</a>"
                                            + "<div class='dropdown-menu dropdown-menu-right' aria-labelledby='navbarDropdownPortfolio'>"
                                            + "<a class='dropdown-item' href='alterarCadastro.jsp'>Alterar Dados</a>"
                                            + "<a class='dropdown-item' href='catalogoLivro.jsp'>Meu Catalogo</a>"
                                            + "<a class='dropdown-item' href='cadastroProduto.jsp'>Cadastra Catalogo</a>"
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

	    <section>
            <div class="container">
                <div class="conteudo">

                    <form>

                        <div class="form-row">
                            <input type="text" class="form-control border border-dark" placeholder="Email" id="email" required="">
                            <div id="validaEmail" style="display: none;">Email Incorreto</div>
                            <input type="text" class="form-control border border-dark" placeholder="CPF" id="cpf" required="">
                            <div id="validaCpf" style="display: none;">CPF Incorreto</div>
                            <input type="Password" class="form-control border border-dark" placeholder="Senha Nova" id="senha" required="">


                            <button type="button" class="btn btn-primary" id="enviar">Alterar Senha</button>
                            <div id="validaOk" style="display: none;">Senha alterada com sucesso</div>

                        </div>

                    </form>

                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <h1 class="mt-5"></h1>

                    </div>
                </div>

        </div></section>
    <!-- Footer -->
    <footer class="py-5 bg-primary">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; DropBooks</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="res/vendor/jquery/jquery.min.js"></script>
    <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
