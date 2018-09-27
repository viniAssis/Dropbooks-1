/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Produto;
import model.Usuario;
import modelDAO.ProdutoDAO;
import modelDAO.UsuarioDAO;

/**
 *
 * @author Cristiano
 */
@WebServlet(name = "AlterarProdutoServlet", urlPatterns = {"/AlterarProdutoServlet"})
public class AlterarProdutoServlet extends HttpServlet {
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //String _email = request.getSession().getAttribute("email").toString();
         
         //Usuario user = new UsuarioDAO().getUsuario(_email);
         
         int id = Integer.parseInt(request.getParameter("id"));
         
         Produto prod = new ProdutoDAO().getProduto(id);
         

         prod.setTitulo(request.getParameter("namelivro")); 
         prod.setAutor(request.getParameter("nameAutor"));
         prod.setEditora(request.getParameter("nameEditora"));
         prod.setPreco(Float.parseFloat(request.getParameter("valor")));
         prod.setDescricao(request.getParameter("descricaoProduto")); 
         prod.setGenero(request.getParameter("menuGenero"));
         prod.setIdioma(request.getParameter("menuIdioma"));
         //prod.setBairro(request.getParameter("inputFoto")); 
         prod.setDataPublicacao(Usuario.toSqlDate(request.getParameter("anoLancamento")));
         
         ProdutoDAO.alterarProduto(prod);
         
        // Recarregar a página
        response.sendRedirect("./catalogoLivro.jsp");
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
