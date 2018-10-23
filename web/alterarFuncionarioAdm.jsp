<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!-- Meta tags Obrigatï¿½rias -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Alterar Funcionario</title>
        <link href="res/css/bootstrap.min.css" rel="stylesheet">
        <link href="res/css/modern-business.css" rel="stylesheet">
        <script src="res/jquery-3.3.1.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="res/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/util.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/main.css"/>
        <script src="res/js/alterarFuncionarioAdm.js"></script>
        <script src="res/js/jquerymin.js"></script>
        <script src="res/js/jquerymask.js"></script>

        <style>

            h2{
                margin-top: 7%;
                margin-bottom: 5%;
                text-align: center;
            }

            #nav{background: #090446;}

            .navbar .navbar-nav li a{
                color: #FEB95F !important;
                font-weight: 400;
            }

            .navbar .navbar-nav li a:hover{
                color: white !important;
                font-weight: 400;
                transform: scale(1);
            }

            .navbar-brand{
                color: #FEB95F !important;
                font-size: 24px;
                font-weight: 700;
            }

            #footer{background: #090446;}
            #corAmarelo{color:#FEB95F ;}
            #corBranca{color: white;}
            #link{color:  #090446 !important;}

            #principal{
                width: 80%;
                border: 1px solid black;
                margin-left: 10%;
                margin-bottom: 5%;
            }

            #dados{
                width: 70%;
                margin-left: 15%;
                margin-bottom: 10%;
                clear: both;
            }

            h1{
                margin-top: 7%;
                margin-bottom: 2%;
                text-align: center;
            }

            #pesquisa,#alterar, #excluir{
                color: #FEB95F;
                background: #090446;
            }

            #form{
                width: 80%;
                margin-left: 10%;
                margin-bottom: 7%;
            }

            #alterar, #excluir{
                width: 30%;
                margin-top: 5%;
                margin-left: 40%;
            }

            input{margin-bottom: 3%;}

            #espaco{
                margin-top: 4%;
                margin-left: 7%;
            }

            label{font-weight: bolder;}

            #ativar, #desativar{
                width: 30%;
                margin-top: 5%;
                color: #FEB95F;
                float: right;
                background: #090446;
            }


        </style>


        <!-- Exibir os dados nos campos -->
        <%
            //Para pegar as informações do usuário, através da página listaUsuarioFuncionario.jsp
            int id = Integer.parseInt(request.getParameter("id"));
            Usuario user = new UsuarioDAO().getUsuarioAdmin(id);

            // Retorna o tipo de sexo
            String fem = "";
            String masc = "";
            if (user.getSexo().equals("f") || user.getSexo().equals("F")) {
                fem = "checked";
            } else if (user.getSexo().equals("m") || user.getSexo().equals("M")) {
                masc = "checked";
            } else {

            }
            
            // Retorna o status do usuário
            String sim = "";
            String nao = "";
            if (user.getAtivo().equals("1")) {
                sim = "checked";
            } else if (user.getAtivo().equals("0")) {
                nao = "checked";
            } else {

            }
            
            //Retorna o Nível cadastrado no banco
            String nivel = "";
            if(user.getNivel_usuario().equals("1")){
                nivel = "Administrador";
            } else if(user.getNivel_usuario().equals("2")){
                nivel = "Funcionário";
            } else if(user.getNivel_usuario().equals("3")) {
                nivel = "Cliente";
            } else {
                nivel = "";
            }
        %>
    </head>
    <body>
        <nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top" id="nav">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">DropBooks</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Contato.jsp">Contato</a>
                        </li>
                        <li class="nav-item">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" ></a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                                <a class="dropdown-item" href="cadastroFuncionario.jsp" id='link'>Cadastra Funcionario</a>
                                <a class="dropdown-item" href="cadastro.html" id='link'>Cadastra Usuarios</a>
                                <a class="dropdown-item" href="listaUsuarioFuncionario.html" id='link'>Pesquisa de Funcionario</a>
                                <a class="dropdown-item" href="listaUsuarioUsuario.html" id='link'>Pesquisa de Usuario</a>
                                <a class="dropdown-item" href="#" id='link'>Gerencia de Anuncios</a>
                                <a class="dropdown-item"  href="#" id='link'>Gerencia de FAQ</a>
                                <a class="dropdown-item"  href="#" id='link'>Gerencia de Finanças</a>
                                <a id='link' class="dropdown-item" name=Sair href=SairServlet>Sair</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <h1><span id="nome" name="nome">Editar Usuário ID: <%= user.getId()%></h1>

    <form method="post" id="form" name="form" action="AlterarUsuarioAdminServlet?id=<%= user.getId()%>">
        <!--Login e Senha -->
        <div class="form-row">
            <div class="col-md-6 mb-8">
                <label>Email:</label>
                <input  class="form-control border border-dark" type="email" name="email" id="email" maxlength="40" value="<%= user.getEmail()%>" required/>
            </div>
            <div class="col-md-3 mb-8">
                <label>Senha:</label>
                <input type="password" class="form-control border border-dark" name="senha" maxlength="20" id="senha" value="<%= user.getSenha()%>" required>
            </div>

            <div class="form-group col-md-3">
                <label for="inputState">Perfil</label>
                <select id="perfil" name="Nivel_Usuario" class="form-control border border-dark" required>
                    <option selected value="<%= user.getNivel_usuario()%>"><%= nivel %></option>
                    <option name="Nivel_Usuario" value="1">Administrador</option>
                    <option name="Nivel_Usuario" value="2">Funcionário</option>
                    <option name="Nivel_Usuario" value="3">Cliente</option>
                </select>
            </div>
        </div>

        <!-- Nome  e CPF-->
        <div class="form-row">
            <div class="col-md-8 mb-8">
                <label>Nome Completo:</label>
                <input type="text" class="form-control border border-dark" name="nomeRazao" id="nome" maxlength="40" value="<%= user.getNomeRazao()%>" required>
            </div>

            <div class="col-md-4 mb-8">
                <label>CPF</label>
                <input type="text"class="form-control border border-dark" name="cpf_cnpj" id="cpf" maxlength="18" value="<%= user.getCpf_cnpj()%>" required>
            </div>
        </div>

        <!-- Data Nascimento e Sexo -->
        <div class="form-row">

            <div class="col-md-6 mb-8">
                <div class="form-group">
                    <label >Sexo:</label>
                    <div class="form-check form-check-inline " id="espaco">
                        <input class="form-check-input" type="radio"  name="sexo" id="feminino" <%= fem%> value="f">
                        <label class="form-check-label">Feminino</label>
                    </div>
                    <div class="form-check form-check-inline" id="espaco">
                        <input class="form-check-input" type="radio" name="sexo" id="masculino" <%= masc%> value="m">
                        <label class="form-check-label">Masculino</label>
                    </div>
                </div>
            </div>
            <div class="col-md-6 mb-8">
                <div class="form-group">
                    <label >Status:</label>
                    <div class="form-check form-check-inline " id="espaco">
                        <input class="form-check-input" type="radio"  name="Ativo" id="ativado" <%= sim %> value="1">
                        <label class="form-check-label">Ativado</label>
                    </div>
                    <div class="form-check form-check-inline" id="espaco">
                        <input class="form-check-input" type="radio" name="Ativo" id="desativado" <%= nao %> value="0">
                        <label class="form-check-label">Desativado</label>
                    </div>
                </div>
            </div>

        </div>

        <!-- Telefone e Celular -->
        <div class="form-row">
            <div class="col-md-6 mb-8">
                <label>Telefone:</label>
                <input type="tel" class="form-control border border-dark" name="telefone"  id="telefone" value="<%= user.getTelefone()%>" required>
            </div>

            <div class="col-md-6 mb-8">
                <label>Data de Nascimento:</label>
                <input type="date" class="form-control border border-dark" name="dataNascimento" id="data" value="<%= user.getDataNascimento()%>" required>
            </div>
            <!--
            <div class="col-md-6 mb-8">
                <label>Celular:</label>
                <input type="tel" class="form-control border border-dark" name="celular" id="celular" required>
            </div>
            -->
        </div>

        <!-- CEP , Numero  e EndereÃ§o-->
        <div class="form-row">
            <div class="col-md-4 mb-8">
                <label>CEP:</label>
                <input type="text" class="form-control border border-dark" name="cep" id="cep" value="<%= user.getCep()%>" required>
            </div>

            <div class="col-md-2 mb-8">
                <label>Numero:</label>
                <input type="text" class="form-control border border-dark" id="numero" name="numero"  maxlength="5" value="<%= user.getNumero()%>">
            </div>

            <div class="col-md-6 mb-8">
                <label>Endereço:</label>
                <input type="text" class="form-control border border-dark" name="logradouro"  id="endereco" maxlength="50" value="<%= user.getLogradouro()%>" required>
            </div>
        </div>

        <!-- Complemento e Bairro -->
        <div class="form-row">
            <div class="col-md-6 mb-8">
                <label>Complemento:</label>
                <input type="text" class="form-control border border-dark" name="complemento" id="complemento" maxlength="20" value="<%= user.getComplemento()%>">
            </div>

            <div class="col-md-6 mb-8">
                <label>Bairro:</label>
                <input type="text" class="form-control border border-dark" name="bairro" id="bairro" maxlength="20" value="<%= user.getBairro()%>" required>
            </div>
        </div>

        <!-- Estado e Cidade -->
        <div class="form-row">
            <div class="col-md-6 mb-8">
                <label>Estado:</label>
                <input type="text" class="form-control border border-dark" name="estado" id="estado" maxlength="20" value="<%= user.getEstado()%>" required>
            </div>

            <div class="col-md-6 mb-8">
                <label>Cidade:</label>
                <input type="text" class="form-control border border-dark" name="cidade" id="cidade" maxlength="20" value="<%= user.getCidade()%>" required>
            </div>
        </div>

        <!--Banco, agencia e conta -->
        <div class="form-row">
            <div class="col-md-3 mb-3">
                <label>Banco:</label>
                <input type="text" class="form-control border border-dark" name="banco" id="banco" maxlength="3" value="<%= user.getBanco()%>">
            </div>

            <div class="col-md-3 mb-3">
                <label>Agência:</label>
                <input type="text" class="form-control border border-dark" name="agencia" id="agencia" maxlength="4" value="<%= user.getAgencia()%>">
            </div>

            <div class="col-md-3 mb-3">
                <label>Conta:</label>
                <input type="text" class="form-control border border-dark" name="conta" id="conta" maxlength="10" value="<%= user.getConta()%>">
            </div>

            <div class="col-md-3 mb-3">
                <label>Digito:</label>
                <input type="text" class="form-control border border-dark" name="digito" id="digito" maxlength="2" value="<%= user.getDigito()%>">
            </div>
        </div>

        <div class="form-row">
            <div class="col-md-6 mb-3">
                <input type="submit" name="alterar" id="alterar" value="Alterar" class="btn btn-primary" />
            </div>
    </form>

            <div class="col-md-6 mb-3">
                <form method="post" action="ExcluirUsuarioServlet?id=<%= user.getId()%>" name="ex_catalogo">
                    <input type="submit" name="excluir" id="excluir" value="Excluir" class="btn btn-primary" />
                </form>
            </div>
        </div>


    <!-- Footer -->
    <footer class="bg6 p-t-45 p-b-43 p-l-45 p-r-45" id="footer">

        <div class="flex-w p-b-90">

            <div class="w-size6 p-t-30 p-l-15 p-r-15 respon3">
                <h4	 id="corAmarelo">Problemas</h4>
                <div>
                    <p class="s-text7 w-size27" id="corBranca">
                        Caso Tenha Qualquer Problema na Compra ou Venda do Seu livro Entre em Contato Para que seja Resolvido.
                        Agradecemos sua Visita. Volte Sempre !
                    </p>
                </div>
            </div>

            <div class="w-size7 p-t-30 p-l-15 p-r-15 respon4">

                <h4  class="s-text12 p-b-30" id="corAmarelo">Categorias</h4>

                <ul>
                    <li class="p-b-9">
                        <a href="#" id="corBranca">Ficção</a>
                    </li>
                    <li class="p-b-9">
                        <a href="#" id="corBranca">Terror</a>
                    </li>
                    <li class="p-b-9">
                        <a href="#" id="corBranca">Romance</a>
                    </li>
                    <li class="p-b-9">
                        <a href="#" id="corBranca">Academicos</a>
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
            <div class="t-center s-text8 p-t-20">Copyright@ 2018 Todos Direitos Reservados <i class="fa fa-heart-o" aria-hidden="true"></i> by DropBooks</div>
        </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="res/vendor/jquery/jquery.min.js"></script>
    <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.8/jquery.mask.js"></script>

</body>
</html>
