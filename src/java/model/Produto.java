package model;

import java.io.InputStream;
import java.sql.Date;


public class Produto extends Utilitarios{

   
    private Date dataPublicacao, dataRegistro;
    private float preco;
    private int id_usuario, id, quantidade, ativo;
    private String autor, editora, descricao, titulo, genero, idioma;
    private InputStream imagem_1, imagem_2, imagem_3, imagem_4, imagem_5;
    
    /**
     * @return the imagem_1
     */
    public InputStream getImagem_1() {
        return imagem_1;
    }

    /**
     * @param imagem_1 the imagem_1 to set
     */
    public void setImagem_1(InputStream imagem_1) {
        this.imagem_1 = imagem_1;
    }

    /**
     * @return the imagem_2
     */
    public InputStream getImagem_2() {
        return imagem_2;
    }

    /**
     * @param imagem_2 the imagem_2 to set
     */
    public void setImagem_2(InputStream imagem_2) {
        this.imagem_2 = imagem_2;
    }

    /**
     * @return the imagem_3
     */
    public InputStream getImagem_3() {
        return imagem_3;
    }

    /**
     * @param imagem_3 the imagem_3 to set
     */
    public void setImagem_3(InputStream imagem_3) {
        this.imagem_3 = imagem_3;
    }

    /**
     * @return the imagem_4
     */
    public InputStream getImagem_4() {
        return imagem_4;
    }

    /**
     * @param imagem_4 the imagem_4 to set
     */
    public void setImagem_4(InputStream imagem_4) {
        this.imagem_4 = imagem_4;
    }

    /**
     * @return the imagem_5
     */
    public InputStream getImagem_5() {
        return imagem_5;
    }

    /**
     * @param imagem_5 the imagem_5 to set
     */
    public void setImagem_5(InputStream imagem_5) {
        this.imagem_5 = imagem_5;
    }
    /**
     * @return the dataPublicacao
     */
    public Date getDataPublicacao() {
        return dataPublicacao;
    }

    /**
     * @param dataPublicacao the dataPublicacao to set
     */
    public void setDataPublicacao(Date dataPublicacao) {
        this.dataPublicacao = dataPublicacao;
    }

    /**
     * @return the dataRegistro
     */
    public Date getDataRegistro() {
        return dataRegistro;
    }

    /**
     * @param dataRegistro the dataRegistro to set
     */
    public void setDataRegistro(Date dataRegistro) {
        this.dataRegistro = dataRegistro;
    }

    /**
     * @return the preco
     */
    public float getPreco() {
        return preco;
    }

    /**
     * @param preco the preco to set
     */
    public void setPreco(float preco) {
        this.preco = preco;
    }

    /**
     * @return the id_usuario
     */
    public int getId_usuario() {
        return id_usuario;
    }

    /**
     * @param id_usuario the id_usuario to set
     */
    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the quantidade
     */
    public int getQuantidade() {
        return quantidade;
    }

    /**
     * @param quantidade the quantidade to set
     */
    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    /**
     * @return the ativo
     */
    public int getAtivo() {
        return ativo;
    }

    /**
     * @param ativo the ativo to set
     */
    public void setAtivo(int ativo) {
        this.ativo = ativo;
    }

    /**
     * @return the autor
     */
    public String getAutor() {
        return autor;
    }

    /**
     * @param autor the autor to set
     */
    public void setAutor(String autor) {
        this.autor = autor;
    }

    /**
     * @return the editora
     */
    public String getEditora() {
        return editora;
    }

    /**
     * @param editora the editora to set
     */
    public void setEditora(String editora) {
        this.editora = editora;
    }

    /**
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    /**
     * @return the titulo
     */
    public String getTitulo() {
        return titulo;
    }

    /**
     * @param titulo the titulo to set
     */
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    /**
     * @return the genero
     */
    public String getGenero() {
        return genero;
    }

    /**
     * @param genero the genero to set
     */
    public void setGenero(String genero) {
        this.genero = genero;
    }

    /**
     * @return the idioma
     */
    public String getIdioma() {
        return idioma;
    }

    /**
     * @param idioma the idioma to set
     */
    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }
}
