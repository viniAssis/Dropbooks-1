<%@page import="javax.swing.JOptionPane"%>
<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>

<!DOCTYPE html>
<html lang="pt-br">
    
    <head>
        <!-- Meta tags Obrigatórias -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap core CSS -->
        <link href="res/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="res/css/modern-business.css" rel="stylesheet">

          <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="res/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/util.css"/>
        <link rel="stylesheet" type="text/css" href="res/css/main.css"/>

        <script src="res/jquery-3.3.1.js"></script>

        <script src="res/js/alteraCadastro.js"></script>

        <style>
            #form1{
                width: 60%;
                margin: 0 auto;
                margin-bottom: 5%;
                margin-top: 5%;	
            }

            #nome{
                margin-top: 5%;
                text-align: center;
            }

            #caixa2{
                margin-top: 5%;
                margin-left: 25%;
                margin-bottom: 3%;
                clear: both;
            }

            #btnAlterar{			
                margin-left: 30%;
                width: 40%;
                margin-top: 30px;
            }

            #texto{
                font-size: 20px;
                color: black;
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
            
            #btnAlterar{
               color:#FEB95F ;
                    background: #090446;
            }
        </style>

        <%
           
               //Usuario user = new Usuario();

                String email = request.getSession().getAttribute("email").toString();
		   
                Usuario user = new UsuarioDAO().getUsuario(email);

                String masc = null;
                String fem = null;

                if(user.getSexo().equals("M") || user.getSexo().equals("m")){
                masc = "checked";
                }else{
                fem = "checked";
                }
        %>




    </head>
    
    <body>
        
        <nav class="navbar fixed-top navbar-expand-lg navbar-dark  fixed-top" id="nav">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">DropBooks</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span>
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
                        <li class="nav-item dropdown"> 
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%= user.getNomeRazao()%></a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                                <a class="dropdown-item" href="alterarCadastro.jsp">Alterar Dados</a>
                                <a class="dropdown-item" href="catalogoLivro.jsp">Meu Catalogo</a>
                                <a class="dropdown-item" href="cadastroProduto.jsp">Cadastra Catalogo</a>
                                <a class="dropdown-item" href="Senha.jsp">Alterar Senha</a>
                                <a class="dropdown-item" name=Sair href=SairServlet>Sair</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <h3 id="nome">Olá, <%= user.getNomeRazao()%> </h3>

        <form id="form1" action="AlterarUsuarioServlet">

            <!-- Email -->
            <div class="form-group row">
                <label id="texto" class="col-sm-3 col-form-label ">Email:</label>
                <div class="col-sm-9">
                    <input type="email"readonly class="form-control border border-dark" id="inputEmail3" name="hEmail" value="<%= user.getEmail()%>">
                </div>
            </div>

            <!-- Nome/Razão Social -->
            <div class="form-group row">
                <label class="col-sm-3 col-form-label" id="texto">Nome/Razão Social:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control  border border-dark" id="inputNome" maxlength="45" name="hNome" value="<%= user.getNomeRazao()%>" required>
                </div>
            </div>

            <!-- Data de Nascimento -->
            <div class="form-group row">
                <label class="col-sm-3 col-form-label" id="texto">Data de Nascimento:</label>
                <div class="col-sm-3">
                    <input type="date" class="form-control  border border-dark" id="inputData" name="hData" value="<%= user.getDataNascimento()%>" required>
                </div>
            </div>

            <!-- Sexo  -->
            <div class="form-group row">	
                <label id="texto" class="col-sm-3 col-form-label">Sexo:</label>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="sexoPessoa" id="sxFem"  value="F" <% out.print(fem); %> required>
                    <label class="form-check-label" id="texto">Feminino</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="sexoPessoa" id="sxMas"  value="F" <% out.print(fem); %> required>
                    <label class="form-check-label" id="texto">Masculino</label>
                </div>
            </div>

            <!-- Telefone  -->
            <div class="form-group row">
                <label id="texto" class="col-sm-3 col-form-label">Telefone:</label>
                <div class="col-4">
                    <input type="text" class="form-control  border border-dark" id="inputTelefone" value="<%= user.getTelefone()%>" name="hTelefone" required>
                </div>
            </div>

            <!-- CEP, Endereço e Numero  -->
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label id="texto">CEP</label>
                    <input type="text" class="form-control  border border-dark" id="inputCEP" name="hCEP" value="<%= user.getCep()%>" required>
                </div>
                <div class="form-group col-md-4">
                    <label id="texto">Endereço</label>
                    <input type="text" class="form-control  border border-dark" id="endereco"  maxlength="50" name="endereco"  value="<%= user.getLogradouro()%>" required>
                </div>
                <div class="form-group col-md-4">
                    <label id="texto">Numero</label>
                    <input type="text" class="form-control  border border-dark" id="inputNumero" maxlength="5" name="hNumero" value="<%= user.getNumero()%>" required>
                </div>
            </div>

            <!-- Cidade, Complemento e Bairro -->
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label id="texto">Cidade</label> 
                    <input type="text" class="form-control  border border-dark" id="inputCity"  maxlength="20" name="hCidade" value="<%= user.getCidade()%>" required>
                </div> 
                <div class="form-group col-md-4">
                    <label id="texto">Complemento</label>
                    <input type="text" class="form-control  border border-dark " id="complemento" maxlength="20" name="hComplemento" value="<%= user.getComplemento()%>" required>
                </div>
                <div class="form-group col-md-4">
                    <label id="texto">Bairro</label> 
                    <input type="text" class="form-control  border border-dark"  id="inputBairro"  maxlength="20" name="hBairro" value="<%= user.getBairro()%>" required> 
                </div>
            </div>

            <!-- Estado  -->
            <div class="form-row">
                <div class="form-group col-md-3">
                    <label id="texto">Estado</label>
                    <input type="text" class="form-control  border border-dark" id="estado" maxlength="20" name="hEstado"  value="<%= user.getEstado()%>" required>
                </div>
            </div>

            <button type="submit" class="btn border-0" id="btnAlterar" >Alterar</button>

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

        
        <!-- Bootstrap core JavaScript -->
        <script src="res/vendor/jquery/jquery.min.js"></script>
        <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.8/jquery.mask.js"></script>
       
        </body>
        </html>