
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
        <script type="text/javascript" src="res/jquery-3.3.1.js">
        <script type="text/javascript">
            $(document).ready(function(){
                    $('#enviar').click(function(){

            alert("");
            var email = $("#email").val();
            var senha = $("#senha").val();
            $.ajax({
            type:'POST',
                    url : "ServletLogin",
                    data : {
                    email : email,
                            senha : senha
                    },
                    success : function(results){
                            if (results === "1"){
                    $("#email").css("color", "red");
            }else i f(resul ts === "2"){                             $("#senha").css("color", "red");
                    }els e{
                            $("#email").css("color", "green");
                    $("#senha").css("color", "green");
            }
            }
            });
                    });
            });
            </script>
    </head>


    <style>
        .cabecalho{
            height: 40px;	
            width: 100%; 
            margin-bottom: 5%;
            margin: auto;
        }

        .login,.nome{
            float: right;
            font-size: 18px;
            color: white;
        }

        .nome{margin-right: 25%;}

        #botao1{;
                background: #008B8B;
                color: white;
                border: #008B8B;
        }


        nav >a{
            font-size: 22px;
            color: white;
            margin-top: 5%;
        }


        #menu a:hover{
            color: black;
        }

        body{
            background-image: url(res/img/bgPadrao.jpg);
        }

        .container{
            width: 40%;
            margin-left: 30%;
            margin-bottom:7%;
            margin-top: 5%;	
            background: #CFCFCF;
            border-radius: 15px 15px 15px 15px;                 
        }
        .titulo1{
            color: black;
            padding: 3%;		
            margin-bottom: 2%;
            margin-left: 40%;

        }

        .caixa, #caixa{
            width: 120%;
            margin-left: 50px;  
            margin-bottom: 5%;
        }
        a:hover{
            color: black;
            text-decoration: none;
        }   
        #botao1{
            margin-left: 2%;
            width: 100%;
            background: #008B8B;
            color: white;


        }
        #botao2{color: white;
                border: #008B8B;
                background: #008B8B;
        }
        .senha{
              color: black;             
        }
        
    </style>
    <body>
        <div class="cabecalho">
            <a href="login.jsp" class="login">Login/Registra-se</a>
            <span class="nome">Droopboks</span>
        </div>

        <nav class="nav nav-pills flex-column flex-sm-row" id="menu">
            <a class="flex-sm-fill text-sm-center nav-link" href="#">Home</a>
            <a class="flex-sm-fill text-sm-center nav-link" href="#">Livro</a>
            <a class="flex-sm-fill text-sm-center nav-link" href="#">FAQ</a>
            <a class="flex-sm-fill text-sm-center nav-link" href="contato.html">Contato</a>
        </nav>


        <div class="container col-lg-6">
            <div class="row">
                <div class="formLogin col-md-8 ">
                    <h3 class="titulo1">Identifique-se</h3>
                    <form action="Login" method="post" class="caixa">
                        <div class="form-group">
                            <label for="labelLogin">Email</label>
                            <input type="text" class="form-control" name="email" aria-describedby="email"
                                   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"  required="required"                                  
                                   placeholder="email@dominio.com"/>
                        </div>
                        <div class="form-group">
                            <label for="labelSenha">Senha</label>
                            <input type="password" class="form-control" name="senha" aria-describedby="senha" placeholder="*******">
                            <small class="text-left novaSenha "><a href="Senha.html" class="senha">Esqueceu sua senha?</a></small>
                        </div>
                        <button type="submit" value="login" class="btn btn-primary btn-block" id="botao1">Enviar</button>
                    </form><hr/>

                    <!--Adicionar link chamando um novo registro-->
                    <div class="goRegistro" id="caixa">
                        <label for="labelNovoReg">Primeira vez no Dropbooks?</label><br>
                        <a href="cadastro.html">
                            <button type="submit" class="btn btn-outline-primary btn-md btn-block" id="botao2">
                                Cadastre-se</button></a>
                    </div>
                </div><br>
            </div>
        </div>
    </body>

</html>
