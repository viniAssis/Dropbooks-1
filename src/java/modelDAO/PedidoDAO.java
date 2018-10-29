package modelDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Date;
import model.ItemCart;
import model.Usuario;
import model.Utilitarios;

public class PedidoDAO {
    public static void gerarPedido(Usuario usuario, ArrayList<ItemCart> itensCarrinho) {
        Date dataPedido = new Date();
        int statusPedido = 0;
        String observacoes = "";
        float subTotal = 0;
        float valorFrete = 0;
        float total = 0;
        int qtdPedidosAtivos = 0;
        int id_Cliente = usuario.getId();
        
        try {
            Connection con = Conecta.getConexao();
            
            String sql = "INSERT INTO pedido "
                    + "(dataPedido, statusPedido, observacoes, subTotal, valorFrete, total, qtdPedidosAtivos, id_Cliente)"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setDate(1, Utilitarios.toSqlDate(dataPedido.toString()));
            ps.setInt(2, statusPedido);
            ps.setString(3, observacoes);
            ps.setFloat(4, subTotal);
            ps.setFloat(5, valorFrete);
            ps.setFloat(6, total);
            ps.setInt(7, qtdPedidosAtivos);
            ps.setInt(8, id_Cliente);
            ps.execute();
            
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            
        }
    }

    public static void cadastrarItemPedido(int id) {
        try {
            Connection con = Conecta.getConexao();
            
            String sql = "";
            
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, a.getCpf_cnpj());
            ps.execute();
            
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            
        }
    }
}
