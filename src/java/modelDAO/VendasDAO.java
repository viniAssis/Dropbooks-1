
package modelDAO;

import java.sql.*;
import java.util.ArrayList;
import static model.Utilitarios.toSqlDate;
import model.Vendas;


public class VendasDAO {
 
    public static Vendas getVenda(int id_vendas) {
        
        Vendas venda = new Vendas();
        
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM vendas WHERE id_venda=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id_vendas);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                venda.setIdVenda(rs.getInt("id_venda"));
                venda.setIdPedido(rs.getInt("id_pedido"));
                venda.setDataVenda(rs.getDate("data_venda"));
                venda.setValor(rs.getFloat("valor"));
            }else{
                venda = null;
            }
            
            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return venda;
    }     

    public static String setVenda(Vendas venda) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "INSERT INTO vendas (id_pedido, data_venda, valor)"
                       + "VALUES(?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, venda.getIdPedido());
            ps.setDate(2, venda.getDataVenda());
            ps.setFloat(3, venda.getValor());
            
            ps.execute();            
            ps.close();
            con.close();            
            resp="ok";
            
        }catch (Exception e){
            resp = e.toString();
        }
        return resp;
    }    
    /** CAIQUE **/
    public static ArrayList<Vendas> getVendasFinanceiro() {
        
        ArrayList <Vendas> vendas = new ArrayList();
        
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM vendas ORDER BY data_venda DESC LIMIT 10";
            PreparedStatement ps = con.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Vendas venda = new Vendas();
                venda.setIdVenda(rs.getInt("id_venda"));
                venda.setIdPedido(rs.getInt("id_pedido"));
                venda.setDataVenda(rs.getDate("data_venda"));
                venda.setValor(rs.getFloat("valor"));
                vendas.add(venda);
            }
            
            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return vendas;
    }
    /** CAIQUE **/
    
    /** CAIQUE **/
    public static ArrayList<Vendas> getVendasFinanceiroPorData(Date inicio, Date fim) {
        
        ArrayList <Vendas> vendas = new ArrayList();
        
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM vendas WHERE data_venda BETWEEN ? AND ? ORDER BY data_venda DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, inicio);
            ps.setDate(2, fim);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Vendas venda = new Vendas();
                venda.setIdVenda(rs.getInt("id_venda"));
                venda.setIdPedido(rs.getInt("id_pedido"));
                venda.setDataVenda(rs.getDate("data_venda"));
                venda.setValor(rs.getFloat("valor"));
                vendas.add(venda);
            }
            
            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return vendas;
    }
    /** CAIQUE **/
    
    /** CAIQUE **/
    public static ArrayList<Vendas> getVendasFinanceiroPorID(int IdPedido) {
        
        ArrayList <Vendas> vendas = new ArrayList();
        
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM vendas WHERE id_pedido="+ IdPedido +" ORDER BY data_venda DESC" ;
            PreparedStatement ps = con.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Vendas venda = new Vendas();
                venda.setIdVenda(rs.getInt("id_venda"));
                venda.setIdPedido(rs.getInt("id_pedido"));
                venda.setDataVenda(rs.getDate("data_venda"));
                venda.setValor(rs.getFloat("valor"));
                vendas.add(venda);
            }
            
            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return vendas;
    }
    /** CAIQUE **/
    
    /** CAIQUE **/
    public static ArrayList<Vendas> getVendasFinanceiroPorValores(float inicio, float fim) {
        
        ArrayList <Vendas> vendas = new ArrayList();
        
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM vendas WHERE valor BETWEEN "+ inicio +" AND "+ fim +" ORDER BY data_venda DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Vendas venda = new Vendas();
                venda.setIdVenda(rs.getInt("id_venda"));
                venda.setIdPedido(rs.getInt("id_pedido"));
                venda.setDataVenda(rs.getDate("data_venda"));
                venda.setValor(rs.getFloat("valor"));
                vendas.add(venda);
            }
            
            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return vendas;
    }
    /** CAIQUE **/
    
    
    /*
    public static ArrayList<Vendas> getVendasFinanceiroPorData(Date inicio, Date fim) {
        
        ArrayList <Vendas> vendas = new ArrayList();
        
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM vendas WHERE data_venda BETWEEN ? AND ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, inicio);
            ps.setDate(2, fim);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Vendas venda = new Vendas();
                venda.setIdVenda(rs.getInt("id_venda"));
                venda.setIdPedido(rs.getInt("id_pedido"));
                venda.setDataVenda(rs.getDate("data_venda"));
                venda.setValor(rs.getFloat("valor"));
                vendas.add(venda);
            }
            
            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return vendas;
    }
    */
    
   /* public static ArrayList<Vendas> getVendasFinanceiroPorcLIENTE(String nome) {
        
        ArrayList <Vendas> vendas = new ArrayList();
        
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM vendas WHERE valor BETWEEN "+ inicio +" AND "+ fim;
            PreparedStatement ps = con.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Vendas venda = new Vendas();
                venda.setIdVenda(rs.getInt("id_venda"));
                venda.setIdPedido(rs.getInt("id_pedido"));
                venda.setDataVenda(rs.getDate("data_venda"));
                venda.setValor(rs.getFloat("valor"));
                vendas.add(venda);
            }
            
            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return vendas;
    }

    */
}
