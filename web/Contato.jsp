<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!-- Meta tags Obrigatórias -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <style>

            #form1{
                margin-top: 5%;
                margin-left: 15%;
                margin-bottom: 9%;	
            }

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

            #caixa2{
                margin-top: 5%;
                margin-left: 25%;
                margin-bottom: 3%;
                clear: both;
            }

            .container{
                width: 40%;
                margin-left: 30%;
                margin-bottom:7%;
                margin-top: 5%;	
                background: #CFCFCF;
                border-radius: 15px 15px 15px 15px;
            }

            #texto{font-size: 20px;}

            .titulo1{
                color: black;
                padding: 3%;	
                text-align: center;	
                margin-bottom: 2%;

            }

            body{background-image: url(res/img/bgPadrao.jpg);}

            #botao1{;
                    background: #008B8B;
            }

            #botao2{
                margin-bottom: 3%;
                width: 75%;
                background: #008B8B;


            } 

            .alerta{color: #C1839F;}

            nav >a{
                font-size: 22px;
                color: white;
            }


            #menu a:hover{
                color: black;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">

            <div class="cabecalho">
               <%
                   //VARIAVEIS QUE VÃO PREENCHER OS CAMPOS VAZIOS COM OS DADOS DO USUARIO(SE ESTIVER LOGADO)
                   String _email = "";
                   String _nome = "";
                   //IDENTIFICA SE O USUARIO ESTA LOGADO E TRAZ SEUS DADOS PARA A PAGINA, SE NAO ESTIVER LOGADO, MOSTRA O LINK PARA QUE O IMUNDO POSSA SE LOGAR
                   if(session.getAttribute("email") != null){
                        
                       String email = request.getSession().getAttribute("email").toString();

                       Usuario user = new UsuarioDAO().getUsuario(email);
                       _email += user.getEmail();
                       _nome  += user.getNomeRazao();
                       out.print("<p class=login>Bem Vindo(a) "+user.getNomeRazao() +"</p>");
                    
                   }else{
                       out.print("<a href=login.jsp class=login>Login/Registra-se</a>");
                    }
   
               %> 
               
                <span class="nome">Droopboks</span>
            </div>

            <form id="caixa2" method="post" action="PesquisarLivrosServlet">
                <div class="form-row align-items-center">
                    <div class="col-auto my-1">
                        <select class="custom-select mr-sm-2" id="tipoPesquisa" name="opcaoPesquisa">
                            <option  value="Titulo">Título</option>
                            <option  value="Autor">Autor</option>
                            <option  value="Editora">Editora</option>
                            <option  value="Genero">Genero</option>
                        </select>
                    </div>

                    <div class="col-auto col-md-8">
                        <input class="form-control col-md-10" type="text" placeholder="Search" name="palavraChave">		
                    </div>
                    <button type="submit" class="btn btn-primary" id="botao1">Pesquisa</button>
                </div>
            </form>


            <nav class="nav nav-pills flex-column flex-sm-row" id="menu">
                <a class="flex-sm-fill text-sm-center nav-link" href="home.jsp">Home</a>
                <a class="flex-sm-fill text-sm-center nav-link" href="catalogoLivro.jsp">Livro</a>
                <a class="flex-sm-fill text-sm-center nav-link" href="#">FAQ</a>
                <a class="flex-sm-fill text-sm-center nav-link" href="contato.jsp">Contato</a>
            </nav>

            <div  class="container">

                <h3 class="titulo1">Contate-se</h3>

                <form id="form1" method="post" action="EnviaEmailServlet">		
                    <div class="form-row">
                        <div class="form-group col-md-10">
                            <label id="texto">Nome <span class="alerta">*</span></label>
                            <input type="text" class="form-control col-md-10" id="nome" name="nome" value="<%=_nome%>">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-10">
                            <label id="texto">Email <span class="alerta">*</span></label>
                            <input type="email" class="form-control col-md-10" id="email" name="email" value="<%=_email%>">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-10">
                            <label id="texto">Assunto <span class="alerta">*</span></label>
                            <select id="assunto" class="form-control col-md-10" name="assunto">
                                <option selected>Dúvidas</option>
                                <option selected>Reclamações</option>
                                <option selected>Cancelamento</option>
                                <option selected>Outros Assuntos</option>
                                <option selected> </option>
                            </select>
                        </div> 
                    </div> 

                    <div class="form-group">
                        <label id="texto">Mensagem <span class="alerta">*</span></label>
                        <textarea class="form-control col-md-8" id="mensagem" rows="7" name="mensagem"></textarea>
                    </div>

                    <button type="submit" class="btn btn-primary" id="botao2" onClick="alert('Mensagem enviada !')">Enviar</button>

                </form>    
            </div>
            <!--
            <div id="caixa3">
                            <div id="infor">
                                            <div class="form-group col-md-8">
                                                    <label class="titulo">Contato</label><br/>
                                                    <label id="texto">(11) 32585-9685</label>
                                                    <a href="#" class="badge badge-info" id="links">Fale Conosco</a>
                                            </div>
                                    </div>
                                              
                                    <div id="infor">
                                            <div class="form-group col-md-6">
                                                    <label class="titulo">Serviços</label><br/>
                                                    <a href="#" class="badge badge-info" id="links">Venda seu livro</a><br/>
                                                    <a href="#" class="badge badge-info" id="links">FAQ</a>
                                            </div>
                                    </div>		
                                                      
                                    <div id="infor">
                                            <div class="form-group col-md-10">
                                                    <label class="titulo">Meio de Pagamento</label><br/>
            <!--<img src="" class="img-fluid" alt="Imagem responsiva">
   </div>
</div>	
             
<div id="infor">
   <div class="form-group col-md-8">
           <label class="titulo">Certificação</label><br/>
            <!--<img src="" class="img-fluid" alt="Imagem responsiva">
    </div>
</div>	  
            
<div id="infor">
    <div class="form-group col-md-8">
            <label 	class="titulo">Instituição</label><br/>
            <a href="#" class="badge badge-info" id="links">Sobre o DropBooks</a><br/>
            <a href="#" class="badge badge-info" id="links">Termos de Uso</a>
            <a href="#" class="badge badge-info" id="links">Segurança e Privacidade</a>
    </div>
</div> 

</div>


<footer>Copyrigth&copy; - 2018 www.dropbooks.com, todos os direiro reservados</footer>
            -->
        </div> 


        <!-- JavaScript (Opcional) -->
        <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>