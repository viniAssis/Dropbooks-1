package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Login</title>\n");
      out.write("        <link href=\"res/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"res/css/style.css\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"res/js/jquery.js\"></script>\n");
      out.write("        <script src=\"res/js/bootstrap.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"res/jquery-3.3.1.js\">\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("            $(document).ready(function(){\n");
      out.write("                    $('#enviar').click(function(){\n");
      out.write("\n");
      out.write("            alert(\"\");\n");
      out.write("            var email = $(\"#email\").val();\n");
      out.write("            var senha = $(\"#senha\").val();\n");
      out.write("            $.ajax({\n");
      out.write("            type:'POST',\n");
      out.write("                    url : \"ServletLogin\",\n");
      out.write("                    data : {\n");
      out.write("                    email : email,\n");
      out.write("                            senha : senha\n");
      out.write("            },\n");
      out.write("                    success : function(results){\n");
      out.write("                    if (results === \"1\"){\n");
      out.write("                    $(\"#email\").css(\"color\", \"red\");\n");
      out.write("                    }else if(results === \"2\"){\n");
      out.write("                            $(\"#senha\").css(\"color\", \"red\");\n");
      out.write("                             }els e{\n");
      out.write("                            $(\"#email\").css(\"color\", \"green\");\n");
      out.write("                    $(\"#senha\").css(\"color\", \"green\");\n");
      out.write("                     }\n");
      out.write("                    }\n");
      out.write("                    });\n");
      out.write("                    });\n");
      out.write("                    });\n");
      out.write("                                </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"container col-lg-6\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"formLogin col-md-8 \">\n");
      out.write("                    <p class=\"h3 text-center\">Identifique-se</p>\n");
      out.write("                    <form action=\"Login\" method=\"post\">\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"labelLogin\">Email</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"email\" aria-describedby=\"email\" placeholder=\"email@email.com\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"labelSenha\">Senha</label>\n");
      out.write("                            <input type=\"password\" class=\"form-control\" name=\"senha\" aria-describedby=\"senha\" placeholder=\"*******\">\n");
      out.write("                            <small class=\"text-left novaSenha \"><a href=\"#\">Esqueceu sua senha?</a></small>\n");
      out.write("                        </div>\n");
      out.write("                        <button type=\"submit\" value=\"login\" class=\"btn btn-primary btn-block\">Enviar</button>\n");
      out.write("                    </form><hr>\n");
      out.write("\n");
      out.write("                    <!--Adicionar link chamando um novo registro-->\n");
      out.write("                    <div class=\"goRegistro\">\n");
      out.write("                        <label for=\"labelNovoReg\">Primeira vez no Dropbooks?</label><br>\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-outline-primary btn-md btn-block\">Cadastre-se</button>\n");
      out.write("                    </div>\n");
      out.write("                </div><br>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>\n");
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
