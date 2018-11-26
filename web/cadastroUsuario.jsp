<%-- 
    Document   : cadastroUsuario
    Created on : 17/11/2018, 04:38:26
    Author     : Cristiano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>DropBooks</title>

        <script src="res/js/Cadastro1.js"></script>
        <script src="res/jquery-3.3.1.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.8/jquery.mask.js"></script>

        <!-- Bootstrap core CSS -->
        <link href="res/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="res/css/modern-business.css" rel="stylesheet">


        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="res/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/util.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/main.css"/>

        <style>
            h2{
                margin-top: 10%;
                text-align: center;
                margin-bottom: 5%;
                color: #090446;
            }
            .container{
                margin:auto;
                width: 70%;
                height: 120%;
                font-size: 16px;
            }
            #tipo .cte{display:inline}
            #fisico, #juridico{display:none;}
            #end_submit{
                text-align: center;
                margin:auto;
                margin-top:20px;
            }
            #caixa2 {
                margin-top: 2%;
                margin-left: 20%;
                margin-bottom: 3%;
                clear: both;
            }
            #botao1,#cadastrar,#limpar{
                width: 15%;
                border: #00008B;
            }
            #botao1 {
                color: white;
                margin: 0;
                margin-left: 2%;
            }
            #caixa2 {
                margin-top: 2%;
                margin-left: 20%;
                margin-bottom: 3%;
                clear: both;
            }
            #botao1,#cadastrar,#limpar{
                width: 15%;
                color: #FEB95F !important;
                background: #090446;
                border: #00008B;
            }
            #botao1 {
                color: white;
                margin: 0;
                margin-left: 2%;
            }
            #cadastrar,#limpar{
                margin-top: 15px;
                margin-left: 5%;
            }
            #espaco{
                margin-top: 2%;
                margin-left: 7%;
            }
            #form{
                margin-bottom: 5%;
            }
            input{
                margin-bottom: 3%;
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

        <!-- Navigation -->
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
                            <a class="nav-link" href="pesquisa.jsp">Livros</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contato.jsp">Contato</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <h2>Cadastro de Usuário</h2>

        <form method="post" id="form" name="form" action="CadastroServlet">

            <div class="container">
                <!--Email -->
                <div class="form-row">
                    <div class="col-md-6 mb-8">
                        <label>Email:</label>
                        <input class="form-control border border-dark" type="email" name="email" id="email" maxlength="40" required/>
                    </div>
                    <div class="col-md-6 mb-8">
                        <label>Repita o email:</label>
                        <input type="email" class="form-control border border-dark" name="repemail" id="reemail"  maxlength="40" required>
                    </div>

                </div>

                <!--Senha -->
                <div class="form-row">
                    <div class="col-md-6 mb-8">
                        <label>Senha:</label>
                        <input type="password" class="form-control border border-dark" name="senha" maxlength="19" id="senha" required>
                    </div>
                    <div class="col-md-6 mb-8">
                        <label>Repita a Senha:</label>
                        <input type="password" class="form-control border border-dark" name="repsenha" maxlength="19" id="repsenha" required>
                    </div>
                </div>



                <!-- Telefone e Data Nascimento -->
                <div class="form-row">
                    <div class="col-md-6 mb-8">
                        <label>Telefone:</label>
                        <input type="tel" class="form-control border border-dark" name="telefone"  id="telefone" required>
                    </div>

                    <div class="col-md-6 mb-8">
                        <label>Data de Nascimento:</label>
                        <input type="date" class="form-control border border-dark" name="data" id="data" class="cxs1" required>
                    </div>
                </div>

                <!-- Tipo -->
                <div class="form-group">
                    <label>Tipo:</label>
                    <div class="form-check form-check-inline " id="espaco">
                        <input class="form-check-input" type="radio" name="tipoPessoa" id="idFisico" VALUE="1" required>
                        <label class="form-check-label">Físico</label>
                    </div>
                    <div class="form-check form-check-inline" id="espaco">
                        <input class="form-check-input" type="radio" name="tipoPessoa" id="idJuridico" VALUE="2" required>
                        <label class="form-check-label">Jurídico</label>
                    </div>
                </div>

                <!-- Nome, Cpf e Sexo -->
                <div id="fisico" class="fj">
                    <div class="form-row">
                        <div class="col-md-6 mb-8">
                            <label>Nome Completo:</label>
                            <input type="text" class="form-control border border-dark" name="nomeRazao" maxlength="40" id="nomeRazao">
                        </div>
                        <div class="col-md-6 mb-8">
                            <label>CPF:</label>
                            <input type="text" class="form-control border border-dark" name="cpf" id="cpf">
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Sexo:</label>
                        <div class="form-check form-check-inline " id="espaco">
                            <input class="form-check-input" type="radio"  name="sexo" id="feminino" value="f" required>
                            <label class="form-check-label">Feminino</label>
                        </div>
                        <div class="form-check form-check-inline" id="espaco">
                            <input class="form-check-input" type="radio" name="sexo" id="masculino" value="m" required>
                            <label class="form-check-label">Masculino</label>
                        </div>
                    </div>
                </div>

                <!-- CNPJ E RAZAO SOCIAL -->
                <div id="juridico" class="fj">
                    <div class="form-row">
                        <div class="col-md-6 mb-8">
                            <label>CNPJ:</label>
                            <input type="text" class="form-control border border-dark" name="cnpj" id="cnpj">
                        </div>

                        <div class="col-md-6 mb-8">
                            <label for="validationCustom02">Razão Social:</label>
                            <input type="text" class="form-control border border-dark" name="nomeRazao" id="nomeRazao" maxlength="40">
                        </div>
                    </div>
                </div>



                <!-- CEP,Endereço e Numero  -->
                <div class="form-row">
                    <div class="col-md-4 mb-3">
                        <label>CEP:</label>
                        <input type="text" class="form-control border border-dark" name="cep"  id="cep" required>
                    </div>

                    <div class="col-md-4 mb-3">
                        <label>Endereço:</label>
                        <input type="text" class="form-control border border-dark" name="logradouro" maxlength="50" id="logradouro" required>
                    </div>

                    <div class="col-md-4 mb-3">
                        <label>Número:</label>
                        <input type="text" class="form-control border border-dark" id="numero"  maxlength="4" name="numero" required>
                    </div>
                </div>

                <!--Complemento, Bairro e Cidade -->
                <div class="form-row">
                    <div class="col-md-4 mb-3">
                        <label>Complemento:</label>
                        <input type="text" class="form-control border border-dark" name="complemento" id="complemento"  maxlength="19" required>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Bairro:</label>
                        <input type="text" class="form-control border border-dark" name="bairro" id="bairro"  maxlength="20" required>
                    </div>

                    <div class="col-md-4 mb-3">
                        <label>Cidade:</label>
                        <input type="text" class="form-control border border-dark" name="cidade" id="cidade"  maxlength="20" required>
                    </div>

                </div>

                <!--Estado -->
                <div class="form-row">
                    <div class="col-md-4 mb-3">
                        <label>Estado:</label>
                        <input type="text" class="form-control border border-dark" name="estado" id="estado"  maxlength="20" required>
                    </div>
                </div>
                
                 <!--Banco, agencia e conta -->
                 <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label>Banco:</label>
                        <input type="text" class="form-control border border-dark" name="banco" id="banco" maxlength="10" required>
                    </div>

                     <div class="col-md-3 mb-3">
                        <label>Agência</label>
                        <input type="number" class="form-control border border-dark" name="agencia" id="agencia"  maxlength="5" required>
                    </div>

                      <div class="col-md-3 mb-3">
                        <label>Conta:</label>
                        <input type="number" class="form-control border border-dark" name="conta" id="conta"  maxlength="5" required>
                    </div>

                     <div class="col-md-3 mb-3">
                        <label>Dígito:</label>
                        <input type="number" class="form-control border border-dark" name="digito" id="dig"  maxlength="2" required>
                    </div>
                </div>

            </div>

            <div id="end_submit">
                <input type="checkbox" name="rec_novidades" id="rec_novidades" value="ATIVO" required/>
                Concordo com o <a href="Termos.html" target="_blanck">Termo de Uso</a>
                <p>
                    <input type="submit" name="cadastrar" id="cadastrar" value="Cadastrar" class="btn btn-primary" />
                    <input type="reset" name="limpar" id="limpar" value="Limpar" class="btn btn-primary"/>
                </p>
            </div>
        </form>


        <!-- Footer -->
        <footer class="bg6 p-t-45 p-b-43 p-l-45 p-r-45" id="footer">
            <div class="flex-w p-b-90">
                <div class="w-size6 p-t-30 p-l-15 p-r-15 respon3">
                    <h4	 id="corAmarelo">
                        Problemas
                    </h4>
                    <div>
                        <p class="s-text7 w-size27" id="corBranca">
                            Caso Tenha Qualquer Problema na Compra ou Venda do Seu livro Entre em Contato Para que seja Resolvido.
                            Agradecemos sua Visita. Volte Sempre !
                        </p>
                    </div>
                </div>
                <div class="w-size7 p-t-30 p-l-15 p-r-15 respon4">
                    <h4  class="s-text12 p-b-30" id="corAmarelo">
                        Categorias
                    </h4>
                    <ul>
                        <li class="p-b-9">
                            <a href="#" id="corBranca">
                                Ficção
                            </a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" id="corBranca">
                                Terror
                            </a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" id="corBranca">
                                Romance
                            </a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" id="corBranca">
                                Academicos
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="w-size7 p-t-30 p-l-15 p-r-15 respon4">
                    <h4 class="s-text12 p-b-30"  id="corAmarelo">Livros</h4>
                    <ul>
                        <li class="p-b-9"><a href="#" id="corBranca">Busca</a></li>
                        <li class="p-b-9"><a href="#" id="corBranca">Sobre Nós</a></li>
                        <li class="p-b-9"><a href="#" id="corBranca">Email</a></li>
                        <li class="p-b-9"><a href="#" id="corBranca">Local</a></li>
                    </ul>
                </div>
                <div class="w-size7 p-t-30 p-l-15 p-r-15 respon4">
                    <h4 class="s-text12 p-b-30"  id="corAmarelo">Ajuda</h4>
                    <ul>
                        <li class="p-b-9">
                            <a href="#" class="s-text7" id="corBranca">Dicas</a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" class="s-text7" id="corBranca">Como Vender</a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" class="s-text7" id="corBranca">Como Comprar</a>
                        </li>
                        <li class="p-b-9">
                            <a href="#" class="s-text7" id="corBranca">FAQs</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="t-center p-l-15 p-r-15">
                <a href="#"><img class="h-size2" src="res/images/icons/paypal.png" alt="IMG-PAYPAL"></a>
                <a href="#"><img class="h-size2" src="res/images/icons/visa.png" alt="IMG-VISA"></a>
                <a href="#"><img class="h-size2" src="res/images/icons/mastercard.png" alt="IMG-MASTERCARD"></a>
                <a href="#"><img class="h-size2" src="res/images/icons/express.png" alt="IMG-EXPRESS"></a>
                <a href="#"><img class="h-size2" src="res/images/icons/discover.png" alt="IMG-DISCOVER"></a>
                <div class="t-center s-text8 p-t-20">
                    Copyright © 2018 Todos Direitos Reservados <i class="fa fa-heart-o" aria-hidden="true"></i> by DropBooks
                </div>
            </div>
        </footer>

        <!-- Back to top -->
        <div class="btn-back-to-top bg0-hov" id="myBtn">
            <span class="symbol-btn-back-to-top">
                <i class="fa fa-angle-double-up" aria-hidden="true"></i>
            </span>
        </div>

        <!-- Container Selection1 -->
        <div id="dropDownSelect1"></div>



    </body>

</html>
