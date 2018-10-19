
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="res/css/bootstrap.min.css" rel="stylesheet">
        <link href="res/css/style.css" rel="stylesheet">
        <script src="res/js/jquery.js"></script>
        <script src="res/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="res/jquery-3.3.1.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#enviar').click(function () {

                    alert("");
                    var email = $("#email").val();
                    var senha = $("#senha").val();
                    $.ajax({
                        type: 'POST',
                        url: "ServletLogin",
                        data: {
                            email: email,
                            senha: senha
                        },
                        success: function (results) {
                            if (results === "1") {
                                $("#email").css("color", "red");
                            } else if (results === "2") {
                                $("#senha").css("color", "red");
                            }
                            els e{
                                $("#email").css("color", "green");
                                $("#senha").css("color", "green");
                            }
                        }
                    });
                });
            });
        </script>

        <style>

            #caixa2{
                margin-top: 5%;
                margin-left: 20%;
                margin-bottom: 3%;
                clear: both;

            }

            #container{
                margin-top: 3%;
                margin-bottom: 10%;
                margin-left: 15%;
            }
            
            #container1{
                margin-top: 5%;
            }
        </style>
    </head>
    <body>
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
                            <a class="nav-link" href="Contato.jsp">Contato</a>
                        </li>      
                    </ul>
                </div>
            </div>
        </nav>
        
        <div class="container col-lg-6" id="container1">
            <div class="row">
                <div class="formLogin col-md-8" id="container">
                    <p class="h3 text-center">Identifique-se</p>
                    <form action="Login" method="post">
                        <div class="form-group">
                            <label for="labelLogin">Email</label>
                            <input type="text" class="form-control border-dark" name="email" aria-describedby="email"
                                   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"  required="required"                                  
                                   placeholder="email@dominio.com"/>
                        </div>
                        <div class="form-group">
                            <label for="labelSenha">Senha</label>
                            <input type="password" class="form-control border-dark" name="senha" aria-describedby="senha" placeholder="*******">
                            <small class="text-left novaSenha "><a href="Senha.jsp">Esqueceu sua senha?</a></small>
                        </div>
                        <button type="submit" value="login" class="btn btn-primary btn-block">Enviar</button>
                    </form><hr>

                    <!--Adicionar link chamando um novo registro-->
                    <div class="goRegistro">
                        <label for="labelNovoReg">Primeira vez no Dropbooks?</label><br>
                        <a href="cadastro.html">
                            <button type="submit" class="btn btn-outline-primary btn-md btn-block">
                                Cadastre-se</button></a>
                    </div>
                </div><br>
            </div>
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
