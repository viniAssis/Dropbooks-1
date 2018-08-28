
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelDAO.Conecta;

public class LoginServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            
            //variaveis para salvar a resposta do banco
            String dbEmail=null;
            String dbSenha=null;
            
            String sql="SELECT*FROM usuario WHERE email=? AND senha=?";
            Class.forName("com.mysql.jdbc.Driver");
             Connection con = Conecta.getConexao();
             PreparedStatement ps = con.prepareStatement(sql);
             ps.setString(1, email);
             ps.setString(2, senha);
            ResultSet rs= ps.executeQuery();
             while (rs.next()) {                
                dbEmail=rs.getString(6);
                dbSenha=rs.getString("senha");
            }
             if(email.equals(dbEmail)&&senha.equals(dbSenha)){
                 HttpSession session = request.getSession();
                 session.setAttribute("email", email);
                 response.sendRedirect("home.jsp");
             }
             else{
                // response.sendRedirect("login.jsp");
                 RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                 rd.include(request, response);
             }           
            
        } catch (Exception e) {
            PrintWriter out = response.getWriter();
            out.print("deu ruim");
        }
    }
}
