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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.8/jquery.mask.js"></script
            
        <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script>
           $(function(){
              $("#header").load("MenuNavBar.jsp");
              $("#footer").load("Footer.jsp");
           });
        </script>
        <!-- IMPORTA O MENU SUPERIOR E O FOOTER -->   


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
    String email = request.getSession().getAttribute("email").toString();

    Usuario user = new UsuarioDAO().getUsuario(email);
    
    if(!user.getNivel_usuario().equals("1")){
        response.sendRedirect("paginaNaoEncontrada.jsp");
    }
        
    %>
    
    </head>

    <body>
        <!-- Navigation -->
        <div id="header"></div>
        
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
                            <option valeu="2">Cliente</option>
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
                            <label class="form-check-label">Femino</label>
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
        <div id="footer"></div>

    </body>

</html>
