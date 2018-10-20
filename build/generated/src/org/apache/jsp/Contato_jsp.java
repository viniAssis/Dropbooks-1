package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelDAO.UsuarioDAO;
import model.Usuario;
import javax.servlet.http.HttpSession;

public final class Contato_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"pt-br\">\r\n");
      out.write("    <head>\r\n");
      out.write("        <!-- Meta tags Obrigatórias -->\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">    \r\n");
      out.write("\r\n");
      out.write("        <script src=\"res/jquery-3.3.1.js\"></script>\r\n");
      out.write("        <link href=\"res/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"res/css/modern-business.css\" rel=\"stylesheet\">     \r\n");
      out.write("        <script src=\"res/js/contato.js\"></script>\r\n");
      out.write("\r\n");
      out.write("        <style>\r\n");
      out.write("\r\n");
      out.write("            #container{\r\n");
      out.write("                margin-top: 2%;\r\n");
      out.write("                width: 50%;\r\n");
      out.write("                margin-left: 30%;    \r\n");
      out.write("                margin-bottom: 7%;\r\n");
      out.write("\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            #caixa2{\r\n");
      out.write("                margin-top: 5%;\r\n");
      out.write("                margin-left: 25%;\r\n");
      out.write("                margin-bottom: 3%;\r\n");
      out.write("                clear: both;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .titulo{\r\n");
      out.write("                color: black;\r\n");
      out.write("                padding: 3%;\t\r\n");
      out.write("                margin-left: 20%;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            #botao2{\r\n");
      out.write("                margin-top: 3%;\r\n");
      out.write("                margin-left: 5%;\r\n");
      out.write("                margin-bottom: 3%;\r\n");
      out.write("                width: 60%;\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            } \r\n");
      out.write("\r\n");
      out.write("        </style>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <nav class=\"navbar fixed-top navbar-expand-lg navbar-dark bg-primary fixed-top\">\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <a class=\"navbar-brand\" href=\"index.jsp\">DropBooks</a>\r\n");
      out.write("                <button class=\"navbar-toggler navbar-toggler-right\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarResponsive\" aria-controls=\"navbarResponsive\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n");
      out.write("                    <span class=\"navbar-toggler-icon\"></span>\r\n");
      out.write("                </button>\r\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"navbarResponsive\">\r\n");
      out.write("                    <ul class=\"navbar-nav ml-auto\">\r\n");
      out.write("                        <li class=\"nav-item\">\r\n");
      out.write("                            <a class=\"nav-link\" href=\"index.jsp\">Home</a>\r\n");
      out.write("                        </li> \r\n");
      out.write("                        <li class=\"nav-item\">\r\n");
      out.write("                            <a class=\"nav-link\" href=\"Contato.jsp\">Contato</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                         <li class=\"nav-item\">\r\n");
      out.write("                            ");

                                //VARIAVEIS QUE VÃO PREENCHER OS CAMPOS VAZIOS COM OS DADOS DO USUARIO(SE ESTIVER LOGADO)
                                String _email = "";
                                String _nome = "";
                                //IDENTIFICA SE O USUARIO ESTA LOGADO E TRAZ SEUS DADOS PARA A PAGINA, SE NAO ESTIVER LOGADO, MOSTRA O LINK PARA QUE O IMUNDO POSSA SE LOGAR
                                if (session.getAttribute("email") != null) {

                                    String email = request.getSession().getAttribute("email").toString();

                                    Usuario user = new UsuarioDAO().getUsuario(email);
                                    _email += user.getEmail();
                                    _nome += user.getNomeRazao();
                                    
                                    out.print("</li>");
                                    out.print("<li class=nav-item>");
                                    out.print("<li class='nav-item dropdown'> "
                                            + "<a class='nav-link dropdown-toggle' href='#' id='navbarDropdownPortfolio' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"+ user.getNomeRazao() +"</a>"
                                            + "<div class='dropdown-menu dropdown-menu-right' aria-labelledby='navbarDropdownPortfolio'>"
                                            + "<a class='dropdown-item' href='carrinho.jsp'>Carrinho</a>"
                                            + "<a class='dropdown-item' href='alterarCadastro.jsp'>Alterar Dados</a>"
                                            + "<a class='dropdown-item' href='catalogoLivro.jsp'>Meu Catalogo</a>"
                                            + "<a class='dropdown-item' href='cadastroProduto.jsp'>Cadastra Catalogo</a>"
                                            + "<a class='dropdown-item' href=Senha.jsp>Alterar Senha</a>"
                                            + "<a class='dropdown-item' name=Sair href=SairServlet>Sair</a>"
                                            + "</div>"
                                            + "</li>");
                                    
                                    
                                    
                                } else {
                                    out.print("<a class=nav-link href=login.jsp>Login/Cadastrar</a>");
                                }        
                            
      out.write("\r\n");
      out.write("                        </li> \r\n");
      out.write("   \r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </nav>\r\n");
      out.write("\r\n");
      out.write("        <form id=\"caixa2\" method='post' action=\"PesquisarLivrosServlet\">\r\n");
      out.write("            <div class=\"form-row align-items-center\">\r\n");
      out.write("                <div class=\"col-auto my-1\">\r\n");
      out.write("                    <select class=\"custom-select mr-sm-2 border border-dark\" id=\"tipoPesquisa\" name=\"opcaoPesquisa\">\r\n");
      out.write("                        <option  value=\"Titulo\">Título</option>\r\n");
      out.write("                        <option  value=\"Autor\">Autor</option>\r\n");
      out.write("                        <option  value=\"Editora\">Editora</option>\r\n");
      out.write("                        <option  value=\"Genero\">Genêro</option>\r\n");
      out.write("                    </select>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"col-auto col-md-6\">\r\n");
      out.write("                    <input class=\"form-control mr-sm-2 border border-dark\" type=\"search\" placeholder=\"Pesquisar\" aria-label=\"Pesquisar\" name=\"palavraChave\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <button type=\"submit\" class=\"btn btn-primary\" id=\"botao1\" name=\"botao1\">Pesquisa</button>\r\n");
      out.write("            </div>\r\n");
      out.write("        </form>\r\n");
      out.write("\r\n");
      out.write("        <!-- Conteúdo início -->\r\n");
      out.write("        <div  class=\"container\" id=\"container\">\r\n");
      out.write("            <h3 class=\"titulo\">Contate-nos</h3>\r\n");
      out.write("            \r\n");
      out.write("            <form id=\"form1\" method=\"post\" action=\"EnviaEmailServlet\">\r\n");
      out.write("                \r\n");
      out.write("                <!-- Nome -->\r\n");
      out.write("                <div class=\"form-row\">\r\n");
      out.write("                    <div class=\"form-group col-md-10 mb-8\">\r\n");
      out.write("                        <label id=\"texto\">Nome <span class=\"alerta\"></span>*</label>\r\n");
      out.write("                        <input type=\"text\" class=\"form-control col-md-10  border border-dark\" id=\"nome\" name=\"nome\"  maxlength=\"40\" value=\"\" required=\"required\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <!-- Email -->\r\n");
      out.write("                <div class=\"form-row\">\r\n");
      out.write("                    <div class=\"form-group col-md-10\">\r\n");
      out.write("                        <label id=\"texto\">Email <span class=\"alerta\">*</span></label>\r\n");
      out.write("                        <input type=\"email\" class=\"form-control col-md-10  border border-dark\" id=\"email\" maxlength=\"45\" name=\"email\" value=\"\" required=\"required\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <!-- Assunto -->\r\n");
      out.write("                <div class=\"form-row\">\t\r\n");
      out.write("                    <div class=\"form-group col-md-10\">\r\n");
      out.write("                        <label id=\"texto\">Assunto <span class=\"alerta\">*</span></label>\r\n");
      out.write("                        <select id=\"assunto\" class=\"form-control col-md-10  border border-dark\" name=\"assunto\" required=\"required\">\r\n");
      out.write("                            <option selected>Dúvidas</option>\r\n");
      out.write("                            <option>Reclamações</option>\r\n");
      out.write("                            <option>Cancelamento</option>\r\n");
      out.write("                            <option>Outros Assuntos</option>\r\n");
      out.write("                        </select>\r\n");
      out.write("                    </div> \r\n");
      out.write("                </div> \r\n");
      out.write("\r\n");
      out.write("                <!-- Mensagem -->\r\n");
      out.write("                <div class=\"form-group\">\r\n");
      out.write("                    <label id=\"texto\">Mensagem <span class=\"alerta\">*</span></label>\r\n");
      out.write("                    <textarea class=\"form-control col-md-8  border border-dark\" id=\"mensagem\" rows=\"7\" maxlength=\"2000\" name=\"mensagem\" required=\"required\"></textarea>\r\n");
      out.write("                    * Campos obrigatórios\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <button type=\"submit\" class=\"btn btn-primary\" id=\"botao2\">Enviar</button>\r\n");
      out.write("            </form>    \r\n");
      out.write("            \r\n");
      out.write("        <!-- Mensagem de resposta -->\r\n");
      out.write("         \r\n");
      out.write("        ");
      out.print( request.getParameter("msg") );
      out.write("\r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("        <!-- Conteúdo fim -->\r\n");
      out.write("        \r\n");
      out.write("        <!-- Footer -->\r\n");
      out.write("        <footer class=\"py-5 bg-primary\">\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <p class=\"m-0 text-center text-white\">Copyright &copy; DropBooks</p>\r\n");
      out.write("            </div>\r\n");
      out.write("            <!-- /.container -->\r\n");
      out.write("        </footer>   \r\n");
      out.write("        \r\n");
      out.write("        <!-- Bootstrap core JavaScript -->\r\n");
      out.write("    <script src=\"res/vendor/jquery/jquery.min.js\"></script>\r\n");
      out.write("    <script src=\"res/vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
