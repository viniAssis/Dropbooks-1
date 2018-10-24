package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Produto;
import model.Usuario;
import modelDAO.ProdutoDAO;
import modelDAO.UsuarioDAO;

@WebServlet(name = "CadastroProdutoServlet", urlPatterns = {"/CadastroProdutoServlet"})
@MultipartConfig(maxFileSize = 16177215)
public class CadastroProdutoServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            Produto produto = new Produto();
            
            String email = request.getSession().getAttribute("email").toString();
                                    Usuario user = new UsuarioDAO().getUsuario(email);
            
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.DATE, 0);
            SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
            String hoje = format1.format(cal.getTime());
            
            produto.setAtivo(1);
            produto.setAutor(request.getParameter("nameAutor"));
            produto.setDataPublicacao(Produto.toSqlDate(request.getParameter("anoLancamento")));
            produto.setDataRegistro(Produto.toSqlDate(hoje));
            produto.setDescricao(request.getParameter("descricao"));
            produto.setEditora(request.getParameter("nameEditora"));
            produto.setGenero(request.getParameter("nameLivro"));
            produto.setId_usuario(user.getId());
            produto.setIdioma(request.getParameter("idiomaLivro"));
            produto.setPreco(Float.parseFloat(request.getParameter("valorLivro")));
            produto.setQuantidade(Integer.parseInt(request.getParameter("qtdLivro")));
            produto.setTitulo(request.getParameter("nameLivro"));
            if(request.getPart("imagem_1").getSize() != 0){
                produto.setImagem_1(request.getPart("imagem_1").getInputStream());
            }
            if (request.getPart("imagem_2").getSize() != 0){
                produto.setImagem_2(request.getPart("imagem_2").getInputStream());
            }
            if (request.getPart("imagem_3").getSize() != 0){
                produto.setImagem_3(request.getPart("imagem_3").getInputStream());
            }
            if (request.getPart("imagem_4").getSize() != 0){
                produto.setImagem_4(request.getPart("imagem_4").getInputStream());
            }
            if (request.getPart("imagem_5").getSize() != 0){
                produto.setImagem_5(request.getPart("imagem_5").getInputStream());
            }
            
            ProdutoDAO.setProduto(produto);
            response.sendRedirect("catalogoLivro.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
