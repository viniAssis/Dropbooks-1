/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static model.Utilitarios.toSqlDate;
import model.Vendas;
import modelDAO.VendasDAO;

/**
 *
 * @author Caique
 */
@WebServlet(name = "RelatorioVendasServlet", urlPatterns = {"/RelatorioVendasServlet"})
public class RelatorioVendasServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            
            Date dataInicial, dataFinal; 
            float valorMinimo, valorMaximo;
            int idPedido;
            ArrayList<Vendas> lista = null;
            
            valorMinimo = Float.parseFloat(request.getParameter("valorMinimo"));
            valorMaximo = Float.parseFloat(request.getParameter("valorMaximo"));
            
            dataInicial = toSqlDate(request.getParameter("dataInicial"));
            dataFinal = toSqlDate(request.getParameter("dataFinal"));
            
            idPedido = Integer.parseInt(request.getParameter("idPedido"));
            
            if(dataInicial != null && dataFinal != null && valorMinimo == 0 && valorMaximo == 0){
                //SE A DATA INICIAL FOR ANTES DA DATA FINAL ELE VAI RETORNAR VERDADEIRO
                if(dataInicial.before(dataFinal) == true){
                    lista = VendasDAO.getVendasFinanceiroPorData(dataInicial, dataFinal);
                }else{
                    lista = VendasDAO.getVendasFinanceiroPorData(dataFinal, dataInicial);
                }
            }else if(dataInicial == null && dataFinal == null && valorMinimo >= 0 && valorMaximo > 0){
                if(valorMinimo <= valorMaximo){
                    lista = VendasDAO.getVendasFinanceiroPorValores(valorMinimo, valorMaximo);
                }else{
                    lista = VendasDAO.getVendasFinanceiroPorValores(valorMaximo, valorMinimo);
                }
            }else if(idPedido > 0){
                    lista = VendasDAO.getVendasFinanceiroPorID(idPedido);
            }else{
                lista = VendasDAO.getVendasFinanceiro();
            }
            
            
            
            
            GsonBuilder gBuilder = new GsonBuilder();
            Gson gson = gBuilder.create();
            String jsonLista = gson.toJson(lista);

            out.print(jsonLista);
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
