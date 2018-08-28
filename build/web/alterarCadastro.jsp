<%-- 
    Document   : alterarCadastro
    Created on : Aug 27, 2018, 12:05:46 PM
    Author     : UX007350
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Usuario" %>
<%@page import="modelDAO.UsuarioDAO" %>
﻿<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!-- Meta tags Obrigatórias -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <style>

            #pesquisa{

                width: 50%;
            }

            #v-pills-tab{
                width: 20%;
                float: left;

            }

            #form1,#form4,#form5{
                width: 60%;
                float: left;
                margin-left: 8%;
                margin-bottom: 2%;

            }

            #caixa{

                float: left;
                width: 42%;
                margin-left: 5%;
            }

            #botao{
                margin-left: 32%;
                background-color:#582B11;
                border: 1px solid #582B11;
                font-size: 20px;
            }

            #form1,#form2{
                margin-top: 5%;
            }

            #texto{
                font-size: 20px;
            }


            #form3{

                display: none;
            }

            #form4{
                display: none;

            }

            #form5{
                display: none;


            }

            .titulo{
                margin-left: 32%;
                margin-bottom: 3%;
                font-size: 20px;
            }

            .titulo2{
                margin-right: 10%;
                color: #582B11;
                border: 1px solid #A57F60;
                padding: 0.5%;
            }

            hr{
                clear: both;
                margin-top: 5%;
            }

            #infor{
                width: 20%;
                float: left;
                margin-bottom: 2%;
            }

            #drop{
                margin-left: 5%;
            }

            #cabelho{
                margin-left: 30%;
                margin-bottom: 5%;
            }

            #caixa1{
                display: inline-block;
                float: right;
                margin-right: 2%;
            }

            #caixa2{
                margin-left: 25%;
                margin-bottom: 3%;
            }

            #menu1{
                margin-bottom: 5%;
            }

            .nav-item, a{
                background: #582B11;
                color: white;
                padding: 0.5%;
                font-size: 18px;
            }

            .nav-item, a:hover {
                color: #C6AD94;
            }

            h3{
                text-align: center;
                margin-bottom: 4%;
                color: #A57F60;
            }

            .menu2> a {
                background: #582B11;
                color: white;
                padding: 3%;
                font-size: 18px;
                text-align: center;			
                border-bottom:3px solid #C6AD94;
            }
            .menu2{
                margin-top: 5%;
            }

            #corBotao{
                background-color:#582B11;
                border: 1px solid #582B11;
                color: white;
            }

            #links{
                background: #582B11;
                padding: 4%;
                font-size: 16px;
                margin-top: 2%;
                width: 110%;
            }

            footer{
                text-align: center;
                font-size: 20px;
                font-weight:  bold;
            }
        </style>
        <title>Alterar Cadastro</title>
        <script type="text/javascript" src="res/jquery-3.3.1.js"></script>
        <script type="text/javascript">
            $("#botao").click(function () {
                alert(<%out.print("oi");%>);
            });
        </script>
        <%
            String email = "teste@teste.com";
            Usuario usuario = UsuarioDAO.getUsuario(email);
            


        %>
    </head>
    <body>
        <div class="container-fluid">

            <div id="cabelho">
                <img src="res/IMGs/logo.png">
                <img src="res/IMGs/nome.png" id="drop">
            </div>		 

            <section id="caixa1">
                <label id="nome"></label>
                <img src="res/IMGs/carrinho.jpg" id="imagens">
            </section>

            <form id="caixa2">
                <div class="form-row align-items-center">
                    <div class="col-auto my-1">
                        <select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                            <option>Titulo</option>
                            <option>Autor</option>
                            <option>Editora</option>
                            <option>Genêro</option>
                        </select>
                    </div>

                    <div class="col-auto my-1" id="pesquisa">
                        <input class="form-control col-md-15" type="text" placeholder="Search">		
                    </div>
                    <button class="btn btn-outline-success col-md-1" type="submit" id="corBotao">Pesquisar</button>
                </div>
            </form>

            <ul class="nav nav-pills nav-fill" id="menu1">
                <li class="nav-item"> <a class="nav-link" href="teste.html">Home</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">Livros</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">FAQ</a> </li>
                <li class="nav-item"> <a class="nav-link" href="#">Contato</a> </li>
                <li class="nav-item"> <a class="nav-link" href="#">Meus Dados</a> </li>

            </ul>

            <h3 id="nome"></h3>

            <div class="menu2" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                <a class="nav-link" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Meus Dados</a>
                <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Endereço</a>
                <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">Alterar senha/email</a>
                <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Catálogo de Livros</a>
                <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Acionar minhas vendas</a>
                <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Minhas Compras</a>
            </div>

            <form id="form1">
                <div class="form-group row">
                    <label id="texto" class="col-sm-3 col-form-label">Email:</label>
                    <div class="col-sm-9">
                        <input type="email" class="form-control" id="inputEmail3" value="<%out.print(usuario.getEmail());%>">
                    </div>
                </div>
                <div class="form-group row">
                    <label id="texto" class="col-sm-3 col-form-label">Senha</label>
                    <div class="col-sm-9">
                        <input type="password"  class="form-control" id="inputPassword3" value="tredsa">
                    </div>
                </div>  
                <div class="form-group row">
                    <label id="texto" class="col-sm-3 col-form-label">Repita a Senha:</label>
                    <div class="col-sm-9">
                        <input type="password"  class="form-control" id="inputPassword3" value="tredsa">
                    </div>
                </div>
                <div class="form-group row">
                    <label id="texto" class="col-sm-3 col-form-label">Telefone:</label>
                    <div class="col-2">
                        <input type="text" class="form-control" placeholder="xx">
                    </div>
                    <div class="col-3">
                        <input type="text" class="form-control" placeholder="<%out.print(usuario.getCpf_cnpj());%>">
                    </div>
                </div>	
                <div class="form-group row">	
                    <label id="texto" class="col-sm-4 col-form-label">Tipo:</label>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="opcao1">
                        <label class="form-check-label" id="texto">Fisico</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="opcao2">
                        <label class="form-check-label" id="texto">Juridico</label>
                    </div>
                </div>
            </form>	
            <div id="form3">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">CNPJ:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail3">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Razão Social:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="nome">
                    </div>
                </div>  
            </div>

            <form id="form4">
                <h3 class="titulo2">Alterar Endereço</h3>
                <div class="form-row">
                    <div class="form-group col-md-2">
                        <label id="texto">CEP</label>
                        <input type="text" class="form-control" id="inputCEP">
                    </div>
                    <div class="form-group col-md-6">
                        <label id="texto">Endereço</label>
                        <input type="text" class="form-control" id="inputCity">
                    </div>
                    <div class="form-group col-md-3">
                        <label id="texto">Numero</label>
                        <input type="text" class="form-control" id="inputCity">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label id="texto">Estado</label>
                        <select id="inputEstado" class="form-control">
                            <option selected>São Paulo</option>
                            <option>...</option>
                        </select>
                    </div> 
                    <div class="form-group col-md-4">
                        <label id="texto">Complemento</label>
                        <input type="text" class="form-control" id="inputCity">
                    </div>
                    <div class="form-group col-md-3">
                        <label id="texto">Bairro</label>
                        <input type="text" class="form-control" id="inputCity">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label id="texto">Cidade</label>
                        <input type="text" class="form-control" id="inputCity">
                    </div>
                    <div class="form-group col-md-4">
                        <label id="texto">UF</label>
                        <select id="inputEstado" class="form-control col-md-4">
                            <option selected>SP</option>
                            <option>...</option>
                        </select>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary" id="botao" class="">Editar</button>
                <button type="reset" class="btn btn-primary" id="corBotao">Limpar</button>
            </form>  

            <form id="form5">
                <h3 class="titulo2">Alterar Email ou Senha</h3>
                <div id="caixa">
                    <div class="form-group">
                        <label class="titulo">Senha atual</label>
                        <input type="password" readonly class="form-control">
                    </div>
                    <div class="form-group">
                        <label  class="titulo">Nova Senha</label>
                        <input type="password" class="form-control">
                    </div>
                    <div class="form-group">
                        <label  class="titulo">Repita a Senha</label>
                        <input type="password" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-primary" id="botao">Alterar Senha</button>
                </div>

                <div id="caixa">
                    <div class="form-group">
                        <label class="titulo">Email atual</label>
                        <input type="email" readonly class="form-control">
                    </div>
                    <div class="form-group">
                        <label class="titulo">Nova Email</label>
                        <input type="email" class="form-control">
                    </div>
                    <div class="form-group">
                        <label class="titulo">Repita o Email</label>
                        <input type="email" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-primary" id="botao" >Alterar Email</button>
                </div>
            </form>

            <hr>
            <div id="infor">
                <div class="form-group col-md-8">
                    <label id="texto">Contato</label><br/>
                    <label id="texto">(11) 32585-9685</label>
                    <a href="#" class="badge badge-info" id="links">Fale Conosco</a>
                </div>
            </div>

            <div id="infor">
                <div class="form-group col-md-8">
                    <label id="texto">Serviços</label><br/>
                    <a href="#" class="badge badge-info" id="links">Venda seu livro </a><br/>
                    <a href="#" class="badge badge-info" id="links">FAQ</a>

                </div>
            </div>		

            <div id="infor">
                <div class="form-group col-md-10">
                    <label id="texto">Meio de Pagamento</label><br/>
                    <!--<img src="" class="img-fluid" alt="Imagem responsiva">-->
                </div>
            </div>	

            <div id="infor">
                <div class="form-group col-md-10">
                    <label id="texto">Certificação</label><br/>
                    <!--<img src="" class="img-fluid" alt="Imagem responsiva">-->
                </div>
            </div>	  

            <div id="infor">
                <div class="form-group col-md-11">
                    <label 	id="texto">Instituição</label><br/>
                    <a href="#" class="badge badge-info" id="links">Sobre o DropBooks</a><br/>
                    <a href="#" class="badge badge-info" id="links">Termos de Uso</a>
                    <a href="#" class="badge badge-info" id="links">Segurança e Privacidade</a>
                </div>
            </div> 


        </div> 

        <footer>Copyrigth&copy; - 2018 www.dropbooks.com, todos os direiro reservados</footer>
        <!-- JavaScript (Opcional) -->
        <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
