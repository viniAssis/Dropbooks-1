package modelDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import model.ItemCart;
import model.Usuario;
import model.Utilitarios;

public class PedidoDAO {
    public static void gerarPedido(Usuario usuario, ArrayList<ItemCart> itensCarrinho) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, 0);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String today = format.format(calendar.getTime());
        
        int numPedido = getNumUltimoPedido();
        int statusPedido = 0;
        String observacoes = "";
        float subTotal = 0;
        float valorFrete = 0;
        float total = 0;
        int qtdPedidosAtivos = 0;
        int id_Cliente = usuario.getId();
        
        try {
            Connection con = Conecta.getConexao();
            numPedido = numPedido + 1;
            
            String sql = "INSERT INTO pedido "
                    + "(numPedido, dataPedido, statusPedido, observacoes, subTotal, valorFrete, total, qtdPedidosAtivos, id_Cliente)"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, numPedido);
            ps.setDate(2, Utilitarios.toSqlDate(today));
            ps.setInt(3, statusPedido);
            ps.setString(4, observacoes);
            ps.setFloat(5, subTotal);
            ps.setFloat(6, valorFrete);
            ps.setFloat(7, total);
            ps.setInt(8, qtdPedidosAtivos);
            ps.setInt(9, id_Cliente);
            ps.execute();
            
            ps.close();
            con.close();
            
            int idPedido = getIdByNumPedido(numPedido);

            itensCarrinho.forEach((item) -> {
                cadastrarItemPedido(idPedido, item.getProduto().getId());
            });

        } catch (Exception e) {
            e.printStackTrace();
            
        }
    }

    public static void cadastrarItemPedido(int idPedido, int idAnuncio) {
        try {
            Connection con = Conecta.getConexao();
            
            String sql = "INSERT INTO pedido_produto (idPedido, id_anuncio_produto)"
                    + "VALUES (?, ?)";
            
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, idPedido);
            ps.setInt(2, idAnuncio);
            ps.execute();
            
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            
        }
    }
    
    public static int getNumUltimoPedido() {
        int numPedido = 1000;
        
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT numPedido FROM pedido ORDER BY dataPedido DESC limit 1";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            if (rs.first())
                numPedido = rs.getInt("numPedido");
            
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            
        }
        
        return numPedido;
    }
    
    public static int getIdByNumPedido(int numPedido) {
        int id = 0;
        
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT id FROM pedido WHERE numPedido = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, numPedido);
            ResultSet rs = ps.executeQuery();
            
            if (rs.first())
                id = rs.getInt("id");
            
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            
        }
        
        return id;
    }
}
