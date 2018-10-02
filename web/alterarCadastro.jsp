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
        
        <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-primary fixed-top">
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

            <button type="submit" class="btn btn-primary" id="btnAlterar" >Alterar</button>

        </form>	
                
        <!-- Footer -->
        <footer class="py-5 bg-primary">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; DropBooks</p>
            </div>
            <!-- /.container -->
        </footer>

        
        <!-- Bootstrap core JavaScript -->
        <script src="res/vendor/jquery/jquery.min.js"></script>
        <script src="res/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.8/jquery.mask.js"></script>
       
        </body>
        </html>