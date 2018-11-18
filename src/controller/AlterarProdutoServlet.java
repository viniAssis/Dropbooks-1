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
import modelDAO.ProdutoDAO;

/**
 *
 * @author Caique
 */
@WebServlet(name = "AlterarProdutoServlet", urlPatterns = {"/AlterarProdutoServlet"})
public class AlterarProdutoServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
         int id = Integer.parseInt(request.getParameter("idProduto"));
         
         Produto prod = new ProdutoDAO().getProduto(id);
         

         prod.setTitulo(request.getParameter("nameTitulo")); 
         prod.setAutor(request.getParameter("nameAutor"));
         prod.setEditora(request.getParameter("nameEditora"));
         prod.setDataPublicacao(Produto.toSqlDate(request.getParameter("nameData")));
         prod.setGenero(request.getParameter("menuGenero"));
         prod.setIdioma(request.getParameter("menuIdioma"));
         prod.setPreco(Float.parseFloat(request.getParameter("namePreco")));
         prod.setQuantidade(Integer.parseInt(request.getParameter("nameQuantidade")));
         prod.setDescricao(request.getParameter("nameDescricao"));
         
         /**
         out.println("meu parametro é " + prod.getId());
         out.println("</br>meu parametro é " + prod.getTitulo());
         out.println("</br>meu parametro é " + prod.getAutor());
         out.println("</br>meu parametro é " + prod.getEditora());
         out.println("</br>meu parametro é " + prod.getDataPublicacao());
         out.println("</br>meu parametro é " + prod.getGenero());
         out.println("</br>meu parametro é " + prod.getIdioma());
         out.println("</br>meu parametro é " + prod.getPreco());
         out.println("</br>meu parametro é " + prod.getQuantidade());
         out.println("</br>meu parametro é " + prod.getDescricao());
         **/ 
         
         ProdutoDAO.alterarProduto(prod);
         
         
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
