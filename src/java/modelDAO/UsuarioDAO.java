package modelDAO;

import model.Usuario;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Produto;

public class UsuarioDAO {

    public static Usuario getUsuario(String email) {

        Usuario usuario = new Usuario();

        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM usuario WHERE email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                usuario.setSexo(rs.getString("sexo"));
                usuario.setDataNascimento(rs.getDate("dataNascimento"));
                usuario.setId(rs.getInt("id"));
                usuario.setTipoPessoa(rs.getInt("tipoPessoa"));
                usuario.setComplemento(rs.getString("complemento"));
                usuario.setCpf_cnpj(rs.getString("cpf_cnpj"));
                usuario.setEstado(rs.getString("estado"));
                usuario.setEmail(rs.getString("email"));
                usuario.setNomeRazao(rs.getString("nomeRazao"));
                usuario.setTelefone(rs.getString("telefone"));
                usuario.setNumero(rs.getString("numero"));
                usuario.setCidade(rs.getString("cidade"));
                usuario.setBairro(rs.getString("bairro"));
                usuario.setCep(rs.getString("cep"));
                usuario.setLogradouro(rs.getString("logradouro"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setNivel_usuario(rs.getString("Nivel_Usuario"));
                usuario.setAtivo(rs.getString("Ativo"));
            } else {
                usuario = null;
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return usuario;
    }

    public static Usuario getUsuarioAdmin(int id) {

        Usuario produto = new Usuario();

        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM usuario WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                produto.setId(rs.getInt("id"));
                produto.setCpf_cnpj(rs.getString("cpf_cnpj"));
                produto.setTipoPessoa(rs.getInt("tipoPessoa"));
                produto.setDataNascimento(rs.getDate("dataNascimento"));
                produto.setSexo(rs.getString("sexo"));
                produto.setEmail(rs.getString("email"));
                produto.setTelefone(rs.getString("telefone"));
                produto.setId_conta(rs.getInt("id_conta"));
                produto.setId_endereco(rs.getInt("id_endereco"));
                produto.setNomeRazao(rs.getString("nomeRazao"));
                produto.setCep(rs.getString("cep"));
                produto.setLogradouro(rs.getString("logradouro"));
                produto.setNumero(rs.getString("numero"));
                produto.setComplemento(rs.getString("complemento"));
                produto.setEstado(rs.getString("estado"));
                produto.setCidade(rs.getString("cidade"));
                produto.setBairro(rs.getString("bairro"));
                produto.setSenha(rs.getString("senha"));
                produto.setNivel_usuario(rs.getString("Nivel_Usuario"));
                produto.setAtivo(rs.getString("Ativo"));
                produto.setBanco(rs.getString("banco"));
                produto.setAgencia(rs.getInt("agencia"));
                produto.setConta(rs.getInt("conta"));
                produto.setDigito(rs.getInt("digito"));

            } else {
                produto = null;
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return produto;
    }

    public static String setSenha(Usuario usuario) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "UPDATE usuario SET senha=? WHERE email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getSenha());
            ps.setString(2, usuario.getEmail());
            ps.execute();

            ps.close();
            con.close();

            resp = "ok";
        } catch (Exception e) {
            resp = e.toString();
        }
        return resp;
    }

    public static String alterarUsuario(Usuario usuario) {

        String resp = "";

        try {
            Connection con = Conecta.getConexao();
            String sql = "UPDATE usuario SET dataNascimento=?, sexo=?, NomeRazao=?, telefone=?, cep=?, logradouro=?, numero=?, complemento=?, estado=?, cidade=?, bairro=?, senha=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getDataNascimento().toString());
            ps.setString(2, usuario.getSexo());
            ps.setString(3, usuario.getNomeRazao());
            ps.setString(4, usuario.getTelefone());
            ps.setString(5, usuario.getCep());
            ps.setString(6, usuario.getLogradouro());
            ps.setString(7, usuario.getNumero());
            ps.setString(8, usuario.getComplemento());
            ps.setString(9, usuario.getEstado());
            ps.setString(10, usuario.getCidade());
            ps.setString(11, usuario.getBairro());
            ps.setString(12, usuario.getSenha());

            ps.setString(13, Integer.toString(usuario.getId()));

            ps.execute();

            ps.close();
            con.close();

            resp = "OK";

        } catch (Exception e) {
            resp = e.toString();
        }

        return resp;
    }

    public static String alterarUsuarioAdmin(Usuario usuario) {

        String resp = "";

        //Usuario usuario = new Usuario();
        try {
            Connection con = Conecta.getConexao();
            // TODO falta o tipoPessoa, id_conta, id_endereco
            String sql = "UPDATE usuario SET cpf_cnpj=?, dataNascimento=?, sexo=?, email=?, telefone=?, nomeRazao=?, cep=?, logradouro=?, numero=?, complemento=?, estado=?, cidade=?, bairro=?, senha=?, Nivel_Usuario=?, Ativo=?, banco=?, agencia=?, conta=?, digito=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getCpf_cnpj());
            //ps.setInt(2, usuario.getTipoPessoa());
            ps.setString(2, usuario.getDataNascimento().toString());
            ps.setString(3, usuario.getSexo());
            ps.setString(4, usuario.getEmail());
            ps.setString(5, usuario.getTelefone());
            //ps.setInt(2, usuario.getId_conta());
            //ps.setInt(2, usuario.getId_endereco());
            ps.setString(6, usuario.getNomeRazao());
            ps.setString(7, usuario.getCep());
            ps.setString(8, usuario.getLogradouro());
            ps.setString(9, usuario.getNumero());
            ps.setString(10, usuario.getComplemento());
            ps.setString(11, usuario.getEstado());
            ps.setString(12, usuario.getCidade());
            ps.setString(13, usuario.getBairro());
            ps.setString(14, usuario.getSenha());
            ps.setString(15, usuario.getNivel_usuario());
            ps.setString(16, usuario.getAtivo());
            ps.setString(17, usuario.getBanco());
            ps.setInt(18, usuario.getAgencia());
            ps.setInt(19, usuario.getConta());
            ps.setInt(20, usuario.getDigito());

            ps.setString(21, Integer.toString(usuario.getId()));

            ps.execute();

            ps.close();
            con.close();

            resp = "OK";

        } catch (Exception e) {
            resp = e.toString();
        }

        return resp;
    }

    public ArrayList<Usuario> pesquisarUsuario(String termo) {

        ArrayList<Usuario> lista = new ArrayList<>();

        try {

            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM usuario WHERE nomeRazao LIKE ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + termo + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Usuario usuario = new Usuario();

                // no banco tem 20 campos
                usuario.setSexo(rs.getString("sexo"));
                usuario.setDataNascimento(rs.getDate("dataNascimento"));
                usuario.setId(rs.getInt("id"));
                usuario.setTipoPessoa(rs.getInt("tipoPessoa"));
                usuario.setComplemento(rs.getString("complemento"));
                usuario.setCpf_cnpj(rs.getString("cpf_cnpj"));
                usuario.setEstado(rs.getString("estado"));
                usuario.setEmail(rs.getString("email"));
                usuario.setNomeRazao(rs.getString("nomeRazao"));
                usuario.setTelefone(rs.getString("telefone"));
                usuario.setNumero(rs.getString("numero"));
                usuario.setCidade(rs.getString("cidade"));
                usuario.setBairro(rs.getString("bairro"));
                usuario.setCep(rs.getString("cep"));
                usuario.setLogradouro(rs.getString("logradouro"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setNivel_usuario(rs.getString("Nivel_Usuario"));
                usuario.setAtivo(rs.getString("Ativo"));

                lista.add(usuario);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }

    public static String ativadoDesativado(Usuario usuario) {

        String resp = "";

        try {
            Connection con = Conecta.getConexao();
            String sql = "UPDATE usuario SET ativo=? WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getAtivo());
            ps.setInt(2, usuario.getId());

            ps.execute();

            ps.close();
            con.close();

            resp = "OK";

        } catch (Exception e) {
            resp = e.toString();
        }

        return resp;
    }

    public static String excluirUsuario(int id) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "DELETE FROM produto, usuario USING produto INNER JOIN usuario USING(id) WHERE produto.id_usuario=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ps.execute();

            ps.close();
            con.close();

            resp = "ok";
        } catch (Exception e) {
            resp = e.toString();
        }
        return resp;
    }
    
        public static Usuario getUserById(int id) {

        Usuario usuario = new Usuario();

        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM usuario WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                usuario.setSexo(rs.getString("sexo"));
                usuario.setDataNascimento(rs.getDate("dataNascimento"));
                usuario.setId(rs.getInt("id"));
                usuario.setTipoPessoa(rs.getInt("tipoPessoa"));
                usuario.setComplemento(rs.getString("complemento"));
                usuario.setCpf_cnpj(rs.getString("cpf_cnpj"));
                usuario.setEstado(rs.getString("estado"));
                usuario.setEmail(rs.getString("email"));
                usuario.setNomeRazao(rs.getString("nomeRazao"));
                usuario.setTelefone(rs.getString("telefone"));
                usuario.setNumero(rs.getString("numero"));
                usuario.setCidade(rs.getString("cidade"));
                usuario.setBairro(rs.getString("bairro"));
                usuario.setCep(rs.getString("cep"));
                usuario.setLogradouro(rs.getString("logradouro"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setNivel_usuario(rs.getString("Nivel_Usuario"));
                usuario.setAtivo(rs.getString("Ativo"));
            } else {
                usuario = null;
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return usuario;
    }
    
    
}
