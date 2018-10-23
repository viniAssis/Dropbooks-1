<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Cadastro de Funcionario</title>

        <script src="res/js/cadastroFuncionario.js"></script>
        <script src="res/jquery-3.3.1.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.8/jquery.mask.js"></script>



  <link rel="stylesheet" href="res/css/bootstrap.css">
  <link rel="stylesheet" href="res/css/cadastroFuncionario.css">





        <style>

            h2{
                margin-top: 5%;
                text-align: center;
                margin-bottom: 5%;
                color: black;
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

            #espaco1{
                margin-top: 3%;
            }

        </style>
        
    <!--  Session -->
    <%
    //String email = request.getSession().getAttribute("email").toString();

    //Usuario user = new UsuarioDAO().getUsuario(email);
        
    %>
    
    </head>

    <body>
        <!-- Navigation -->
  <nav class="navbar navbar-expand-md navbar-dark " id="nav">
    <a class="navbar-brand col-sm-3 col-md-2" href="#">DROPBOOKS</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse col-lg-5">
      <div class="navbar-nav-scroll">
        <ul class="navbar-nav bd-navbar-nav flex-row">
          <li class="nav-item">
            <a class="nav-link " href="novaHome.html" >Inicio</a>
          </li>

          <li class="nav-item">
            <a class="nav-link " href="novaHome.html" >Livros</a>
          </li>

          <li class="nav-item">
            <a class="nav-link " href="#" >F.A.Q</a>
          </li>

          <li class="nav-item">
            <a class="nav-link " href="Contato.jsp" >Contato</a>
          </li>

        </ul>
      </div>
    </div>
  </nav>
        <h2>Cadastro de Funcionario</h2>

        <!-- Removido  onsubmit="teste()" -->
        <form method="post" id="form" name="form" action="CadastroFuncionarioServlet">
            <div class="container">

 

                <!--Login e Senha -->
                <div class="form-row">
                    <div class="col-md-6 mb-8">
                        <label>Email:</label>
                        <div class="input-group mb-2 mr-sm-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text border border-dark">@</div>
                            </div>
                            <input class="form-control border border-dark" type="email" name="email" id="email" maxlength="40" required/>
                        </div>
                    </div>
                    <div class="col-md-3 mb-8">
                        <label>Senha:</label>
                        <input type="password" class="form-control border border-dark" name="senha" maxlength="20" id="senha" required>
                    </div>
                    
                    <div class="form-group col-md-3">
                        <label for="inputState">Perfil</label>
                        <select id="perfil" name="perfil" class="form-control border border-dark" required>
                            <option selected></option>
                            <option value="0">Administrador</option>
                            <option value="1">Finaceiro</option>
                            <option value="2">Cliente</option>
                        </select>
                    </div>
                </div>


                <!-- Nome  e CPF-->
                <div class="form-row">
                    <div class="col-md-8 mb-8">
                        <label>Nome Completo:</label>
                        <input type="text" class="form-control border border-dark" name="nome" maxlength="60" id="nomeRazao">
                    </div>

                    <div class="col-md-4 mb-8">
                        <label>CPF:</label>
                        <input type="text" class="form-control border border-dark" name="cpf" id="cpf" required>
                    </div>
                </div>

                <!-- Data Nascimento e Sexo -->
                <div class="form-row">
                    <div class="col-md-6 mb-8" id="espaco1">
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
                    <div class="col-md-6 mb-8">
                        <label>Data de Nascimento:</label>
                        <input type="date" class="form-control border border-dark" name="dataNascimento" id="data" class="cxs1" required>
                    </div>
                </div>

                <!-- Telefone e Celular -->
                <div class="form-row">
                    <div class="col-md-6 mb-8">
                        <label>Telefone:</label>
                        <input type="tel" class="form-control border border-dark" name="telefone"  id="telefone" required>
                    </div>

                    <div class="col-md-6 mb-8">
                        <label>Celular:</label>
                    <input type="tel" class="form-control border border-dark" name="celular"  id="celular" required>
                    </div>
                </div>

                <!-- CEP , Numero  e Endereço-->
                <div class="form-row">
                    <div class="col-md-4 mb-8">
                        <label>CEP:</label>
                        <input type="text" class="form-control border border-dark" name="cep" id="cep" required>
                    </div>

                      <div class="col-md-2 mb-8">
                        <label>Numero:</label>
                        <input type="text" class="form-control border border-dark" id="numero"  maxlength="5" name="numero" required>
                    </div>

                    <div class="col-md-6 mb-8">
                        <label>Endereço:</label>
                        <input type="text" class="form-control border border-dark" name="logradouro" maxlength="50" id="end" required>
                    </div>
                </div>

                <!-- Complemento e Bairro -->
                <div class="form-row">
                     <div class="col-md-6 mb-8">
                        <label>Complemento:</label>
                        <input type="text" class="form-control border border-dark" name="complemento" id="complemento"  maxlength="20" required>
                    </div>

                     <div class="col-md-6 mb-8">
                        <label>Bairro:</label>
                        <input type="text" class="form-control border border-dark" name="bairro" id="bairro"  maxlength="20" required>
                    </div>
                </div>


                <!-- Estado e Cidade -->
                <div class="form-row">
                    <div class="col-md-6 mb-8">
                        <label>Estado:</label>
                        <input type="text" class="form-control border border-dark" name="estado" id="estado"  maxlength="20"required>
                    </div>

                    <div class="col-md-6 mb-8">
                        <label>Cidade:</label>
                    <input type="text" class="form-control border border-dark" name="cidade" id="cidade"  maxlength="20" required>
                    </div>
                </div>


                  <!--Banco, agencia e conta -->
                 <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label>Banco:</label>
                        <input type="text" class="form-control border border-dark" name="banco" id="banco" maxlength="3" required>
                    </div>

                     <div class="col-md-3 mb-3">
                        <label>Agência:</label>
                        <input type="text" class="form-control border border-dark" name="agencia" id="agencia"  maxlength="4" required>
                    </div>

                      <div class="col-md-3 mb-3">
                        <label>Conta:</label>
                        <input type="text" class="form-control border border-dark" name="conta" id="conta"  maxlength="10" required>
                    </div>

                     <div class="col-md-3 mb-3">
                        <label>Digito:</label>
                        <input type="text" class="form-control border border-dark" name="digito" id="dig"  maxlength="2" required>
                    </div>
                </div>


                <div id="end_submit">
                    <input type="checkbox" name="rec_novidades" id="rec_novidades" value="ATIVO" checked="checked" required/>
                        Você Concorda com os termos de uso Ler <a href="#">Termos de Uso</a>
                    <p>
                        <input type="submit" name="cadastrar" id="cadastrar" value="Cadastrar" class="btn btn-primary" />
                        <input type="reset" name="limpar" id="limpar" value="Limpar" class="btn btn-primary"/>
                    </p>
                </div>
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
                    Copyright @ 2018 Todos Direitos Reservados <i class="fa fa-heart-o" aria-hidden="true"></i> by DropBooks
                </div>
            </div>
        </footer>

    </body>

</html>
