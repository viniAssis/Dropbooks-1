
<%@page import="modelDAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelDAO.ProdutoDAO"%>
<%@page import="model.Produto"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Catalogo do Livro</title>

        <!-- Principal CSS do Bootstrap -->
        <link href="res/css/bootstrap.min.css" rel="stylesheet">
        <link href="res/js/dist/dropdown.js" rel="stylesheet">
        
        <style>
            .cabecalho{
                height: 40px;	
                width: 100%; 
                margin-bottom: 5%;
                margin: auto;
            }

            .login, .nome{
                float: right;
                font-size: 18px;
                color: white;
            }

            .nome{margin-right: 25%;}

            /**#container1{
                    height: 800px;
                    width: 90%;
                    margin-left: 5%;
                    background: #CFCFCF;
                    margin-top: 30px;
                    border-radius: 100px 100px 0 0 ;
            }**/

            .titulo{
                padding-top: 5%;
                text-align: center;
                margin-bottom: 7%
            }

            body{ background-image: url(res/img/bgPadrao.jpg); }           

            #caixa2{
                margin-top: 5%;
                margin-left: 20%;
                margin-bottom: 10%;
                clear: both;
            }

            table{width: 100%;}

            #conteudo{
                width: 200px;
                padding: 15px;
                margin: 50px auto;
                display: table;

            }



            .modal-body{ background: #179588; }

            .modal-header{
                text-align: center;
                background-color: #C1839F;
            }

            .toggle {
                margin-bottom: 40px;
                padding: 30px;

            }

            .toggle > input { display: none; }

            .toggle > label {
                position: relative;
                display: block;
                height: 20px;
                width: 44px;
                background: #898989;
                border-radius: 100px;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .toggle > label:after {
                position: absolute;
                left: -2px;
                top: -3px;
                display: block;
                width: 26px;
                height: 26px;
                border-radius: 100px;
                background: #fff;
                box-shadow: 0px 3px 3px rgba(0,0,0,0.05);
                content: '';
                transition: all 0.3s ease;
            }

            .toggle > label:active:after { transform: scale(1.15, 0.85); }

            .toggle > input:checked ~ label { background: #6fbeb5; }

            .toggle > input:checked ~ label:after {
                left: 20px;
                background: #179588;
            }

            .form-group{
                margin-left: 5%;
                display: block;
                width: 250px;
            }

            .modal-body{ background: #179588; }

            .modal-header{
                text-align: center;
                background-color: #C1839F;
            }

            .sliderCheck{ margin-top: 10px; }

            .switch {
                position: relative;
                display: inline-block;
                width: 60px;
                height: 34px;
            }

            .switch input {display:none;}

            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #ccc;
                transition: .4s;
            }

            .slider:before {
                position: absolute;
                content: "";
                height: 26px;
                width: 26px;
                left: 4px;
                bottom: 4px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

            input:checked + .slider { background-color: #2196F3; }

            input:focus + .slider { box-shadow: 0 0 1px #2196F3; }

            input:checked + .slider:before { transform: translateX(26px);}

            .slider.round { border-radius: 34px; }

            .slider.round:before { border-radius: 50%; }

            .container_1{

                margin-left: 20%;
            }

            .caixa{
                border: 1px solid grey;
                background: #FFFFF0;
                height:75%;
                width: 20%;
                margin-left: 4%;
                overflow: auto;
                text-align: center;
                display: table;
                float: left;
                margin-top: 2%;
                box-shadow: 0 2px 4px 2px #D3D3D3;
                margin-bottom: 10%;
            }

            img{
                margin-top: 5%;
                width: 200px;
                height: 230px;
            }
            .dropdown-toggle{
                background-color: #C1839F;
                color: white;   
                margin-left: 10px;

            }
            #dropdown1 , #dropdown2  {

                margin-top: 5%;	
                margin-bottom: 5%;	
                width: 25%;
                float: left;
                margin-left: 15%;
            }


            .input-group{
                margin-top: 5%;

            }
            .input{
                width: 100%;
                border-radius: 5px;
                box-shadow: 0 1px 2px 1px #D3D3D3;
                margin: 3px;


            }
            .formLivro{
                text-align:left;
                padding: 3px;
                font-size: 20px;
                margin-left: 10px;
                color: black;

            }

            #idEditar, #idExcluir{
                margin-top: 2%;
                margin-left: 5%;
                margin-bottom: 2%;
                width: 30%;
                background: #008B8B;
                border: #C1839F;
                color: white;
            }



            nav >a{
                margin-top: 3%;
                font-size: 22px;
                color: white;
            }


            #menu a:hover{
                color: black;
            }

            a:hover{
                color: black;
                text-decoration: none;
            }


            #botao1{
                background: #008B8B;
                border:  #008B8B;
                margin-left: 3%;

            }

            .desativar{
                color: black;
                margin-left: 120%;
            }

            #idConfirmar, #idFechar, #edcatalogo{
                background: #C1839F;
                border: #C1839F;
            }

        </style> 
                
        <script type="text/javascript">
            function redireciona(param) {
                location.href = param;
            }
        </script>
        <%
        String email = request.getSession().getAttribute("email").toString();
		   
            Usuario user = new UsuarioDAO().getUsuario(email);
            Produto pro = new ProdutoDAO().getProduto(user.getId());
            
        %>
    </head>
    <body>   
        <div class="container-fluid">

            <div class="cabecalho">
                <%

                    out.print("<a href=alterarCadastro.jsp class=login>"+user.getNomeRazao()+"</a>");

                %>
                <span class="nome">Droopboks</span>
            </div> 
            <form id="caixa2">
                <div class="form-row align-items-center">
                    <div class="col-auto my-1">
                        <select class="custom-select mr-sm-2" id="tipoPesquisa">
                            <option>Titulo</option>
                            <option>Autor</option>
                            <option>Editora</option>
                            <option>Gen�ro</option>
                        </select>
                    </div>

                    <div class="col-auto col-md-5">
                        <input class="form-control mr-sm-2" type="search" placeholder="Pesquisar" aria-label="Pesquisar" name="pesquisa">
                    </div>
                    <button type="submit" class="btn btn-primary" id="botao1" name="botao1">Pesquisa</button>
                </div>
            </form>


            <nav class="nav nav-pills flex-column flex-sm-row" id="menu">
                <a class="flex-sm-fill text-sm-center nav-link" href="index.jsp">Home</a>
                <a class="flex-sm-fill text-sm-center nav-link" href="catalogoLivro.jsp">Livro</a>
                <a class="flex-sm-fill text-sm-center nav-link" href="#">FAQ</a>
                <a class="flex-sm-fill text-sm-center nav-link" href="Contato.jsp">Contato</a>
            </nav>
        </div>
<%
    
        out.println("<div id= 'container1'>");

            out.println("<h4 class='titulo'>Cat�logo do Livro</h4>");
                 
            out.println("<div id='container' >	");
                out.println("<table>");
                    
        
            // TODO Pegar id_usuario da sessao
            int id_usuario = pro.getId_usuario();
            
            ArrayList<Produto> lista = new ProdutoDAO().getProdutos(id_usuario);       
                
            for(int i=0; i<lista.size(); i++) {
                
                String status = null;

                // Retorna o status do produto
                if (lista.get(i).getAtivo()== 1) {
                    status = "checked";
                } else if (lista.get(i).getAtivo()== 0) {
                    status = "";
                } else {

                }

                //out.println("<td><a href='index.jsp?rgm=" + lista.get(i).getId()+ "'>" + lista.get(i).getId()+ "</a></td>");
             
                 //out.println("<tr>");
                

                    out.println("<td class='caixa'>");
                            out.println("<img src='https://images.livrariasaraiva.com.br/imagemnet/imagem.aspx/?pro_id=2870760&qld=90&l=430&a=-1' width='200' height = '200'  alt=''>");
                            
                            //out.println("<p> ID: <span name='id' id='id'>" + lista.get(i).getId()+ "</span></p>");
                            out.println("<p> Titulo: <span name='titulo' id='texto'>" + lista.get(i).getTitulo()+ "</span></p>");
                            out.println("<p> Autor:  <span name='autor' id='autor'>" + lista.get(i).getAutor()+ "</span></p>");
                            out.println("<p> Valor: R&#36;: <span name='valor' id='valor'>" + lista.get(i).getPreco()+ "</span></p>");

                            // <!-- Bot�o para acionar modal BOTAO EDITAR -->
                            out.println("<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#ExemploModalCentralizado' name='editar' id='idEditar'>");
                                out.println("Editar");
                            out.println("</button>");

                            // <!-- Modal -->
                            out.println("<div class='modal fade' id='ExemploModalCentralizado' tabindex='-1' role='dialog' aria-labelledby='TituloModalCentralizado' aria-hidden='true'>");
                                out.println("<div class='modal-dialog modal-dialog-centered' role='document'>");
                                    out.println("<div class='modal-content'>");
                                        out.println("<div class='modal-header'>");
                                            out.println("<h5 class='modal-title' id='TituloModalCentralizado'>Editar Cat�logo</h5>");
                                            out.println("<button type='button' class='close' data-dismiss='modal' aria-label='Fechar'>");
                                                out.println("<span aria-hidden='true'>&times;</span>");
                                            out.println("</button>");
                                        out.println("</div>");
                                        out.println("<div class='modal-body'>");
                                            out.println("<center>");
                                                out.println("<form method='post' action='AlterarProdutoServlet?id=" + lista.get(i).getId() + "' name='ed_catalogo'>");
                                                    out.println("<table>");
                                                        out.println("<tr>");
                                                            out.println("<td class='formLivro'>Titulo do Livro:</td>");
                                                            //out.println("<p> ID: <span name='id' id='id'>" + lista.get(i).getId() + "</span></p>");
                                                            out.println("<td style='color:black'>");
                                                                out.println("<input type='text' class='input' name='namelivro' id='namelivro' placeholder='' value='" + lista.get(i).getTitulo()+ "'>");
                                                            out.println("</td>");
                                                        out.println("</tr>");
                                                        out.println("<tr>");
                                                            out.println("<td class='formLivro'>Nome do Autor: </td>");
                                                            out.println("<td style='color:black'>");
                                                                out.println("<input type='text' class='input' name='nameAutor' id='nameAutor' placeholder='' value='" + lista.get(i).getAutor()+ "'>");
                                                            out.println("</td>");
                                                        out.println("</tr>");
                                                        out.println("<tr>");
                                                            out.println("<td class='formLivro'>Nome da Editora: </td>");
                                                            out.println("<td style='color:black'>");
                                                                out.println("<input type='text' class='input' name='nameEditora' id='nameEditora' placeholder='' value='" + lista.get(i).getEditora()+ "'>");
                                                            out.println("</td>");
                                                        out.println("</tr>");
                                                        out.println("<tr>");
                                                            out.println("<td class='formLivro'>Ano de Lan�amento: </td>");
                                                            out.println("<td style='color:black'>");
                                                                out.println("<input type='date' class='input' name='anoLancamento' id='anoLancamento' placeholder=''  value='" + lista.get(i).getDataPublicacao()+ "'>");
                                                            out.println("</td>");
                                                        out.println("</tr>");
                                                        out.println("<tr>");
                                                            out.println("<td class='formLivro'>Valor do Livro: </td>");
                                                            out.println("<td style='color:black'>");
                                                                out.println("<input type='text'  class='input' name='valor' id='idValor' placeholder='' value='" + lista.get(i).getPreco()+ "'>");
                                                            out.println("</td>");
                                                        out.println("</tr>");
                                                        out.println("<tr>");
                                                            out.println("<td class='formLivro'>Descri��o: </td>");
                                                            out.println("<td style='color:black'>");
                                                                out.println("<textarea class='form-control input' id='descricao' name='descricaoProduto' value='' placeholder='' rows='3' >" + lista.get(i).getDescricao()+ "</textarea>");
                                                            out.println("</td>");
                                                        out.println("</tr>");

                                                    out.println("</table>");
                                                    out.println("<div class='dropdown' id='dropdown1'>");
                                                        out.println("<div class='dropdown'>");
                                                            out.println("<label class='formLivro'>G�nero</label>");
                                                            out.println("<select class='btn  dropdown-toggle' id='idGenero' name='menuGenero' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' value=''>");
                                                                out.println("<option>" + lista.get(i).getGenero()+ "</option>");
                                                                out.println("<option>Drama</option>");
                                                                out.println("<option>A��o</option>");
                                                                out.println("<option>Aventura</option>");
                                                                out.println("<option>Com�dia</option>");
                                                                out.println("<option>Fantasia</option>");
                                                            out.println("</select>");

                                                        out.println("</div>");
                                                    out.println("</div>");
                                                    out.println("<div class='dropdown' id='dropdown2'>");
                                                        out.println("<div class='dropdown'>");
                                                            out.println("<label class='formLivro'>Idioma</label>");
                                                            out.println("<select class='btn  dropdown-toggle' id='idIdioma' name='menuIdioma' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' value=''>");
                                                                out.println("<option>" + lista.get(i).getIdioma()+ "</option>");
                                                                out.println("<option>Portugu�s</option>");
                                                                out.println("<option>Ingl�s</option>");
                                                            out.println("</select>");

                                                        out.println("</div>");
                                                    out.println("</div>");
                                                    
                                                     out.println("<div class='input-group mb-3'>");
                                                        out.println("<div class='input-group-prepend'>");
                                                            out.println("<span class='input-group-text' id='inputGroupFileAddon01'>Alterar Foto</span>");
                                                        out.println("</div>");
                                                        out.println("<div class='custom-file'>");
                                                            out.println("<input type='file' class='custom-file-input' id='inputFoto' name='inputFoto' aria-describedby='inputGroupFileAddon01'>");
                                                            out.println("<label class='custom-file-label' for='inputGroupFile01'></label>");
                                                        out.println("</div>");
                                                    out.println("</div>");
                                                    out.println("<br>");
                                                    out.println("<button type='submit' class='btn btn-primary' name='editar_catalogo' id='edcatalogo'>Editar Cat�logo</button>");
                                                out.println("</form>");
                                            out.println("</center>");
                                        out.println("</div>");
                                    out.println("</div>");
                                out.println("</div>");
                            out.println("</div>");

                            // <!-- Bot�o para acionar modal BOTAO EXCLUIR -->
                            out.println("<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#modalExemplo' name='excluir' id='idExcluir'>");
                                out.println("Excluir");
                            out.println("</button>");

                            // <!-- Modal -->
                            out.println("<div class='modal fade' id='modalExemplo' tabindex='-1' role='dialog' aria-labelledby='exampleModalLabel' aria-hidden='true'>");
                                out.println("<div class='modal-dialog' role='document'>");
                                    out.println("<div class='modal-content'>");
                                        out.println("<div class='modal-header'>");
                                            out.println("<h5 class='modal-title' id='exampleModalLabel'>Aten��o !!!</h5>");
                                            out.println("<button type='button' class='close' data-dismiss='modal' aria-label='Fechar'>");
                                                out.println("<span aria-hidden='true'>&times;</span>");
                                            out.println("</button>");
                                        out.println("</div>");
                                        out.println("<div class='modal-body'>");
                                            out.println("Voc� tem certeza que quer excluir esse livro do seu cat�logo? ");
                                        out.println("</div>");
                                        out.println("<div class='modal-footer'>");
                                        out.println("<form method='post' action='ExcluirProdutoServlet?id=" + lista.get(i).getId() + "' name='ex_catalogo'>");
                                            out.println("<button type='submit' class='btn btn-primary' name='confirmar' id='idConfirmar'>Sim</button>");
                                            out.println("</form>");
                                            out.println("<button type='button' class='btn btn-secondary' data-dismiss='modal' name='fechar' id='idFechar'>Fechar</button>  ");
                                        out.println("</div>");
                                    out.println("</div>");
                                out.println("</div>");
                            out.println("</div>");

                            out.println("<div class='sliderCheck'>");
                                out.println("<label class='switch'>");
                                %>
                                    <input type="checkbox" name="statusCheckbox1" <%= status %> onClick="redireciona('StatusProdutoServlet?id='<%= lista.get(i).getId() %>'');">
                                <%
                                    
                                    
                                    out.println("<span class='slider round'></span>");
                                out.println("</label>");
                            out.println("</div>");
                        out.println("</td>");
            
                // out.println("</tr>");

                
            //Fechando p�gina dinamica
            }
        %>
                </table>

            </div>
                                    



            <footer></footer>

            <!-- Principal JavaScript do Bootstrap
             ================================================== -->
            <!-- Foi colocado no final para a p�gina carregar mais r�pido -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://unpkg.com/popper.js"></script>
            <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
            <script src="res/js/bootstrap.min.js"></script>
            <!-- S� faz o nossos placeholders de imagens funcionarem. N�o precisar copiar a pr�xima linha! -->
            <script src="res/js/bootstrap.bundle.min.js"></script>

        </div>
    </body>
</html>