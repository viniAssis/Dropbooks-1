package model;

public class ItemCart {
    private int produto, quantidade;
    
    public ItemCart () {}
    
    public ItemCart (int produto, int quantidade) {
        this.produto = produto;
        this.quantidade = quantidade;
    }
    
    public void setProduto(int produto) {
        this.produto = produto;
    }
    
    public int getProduto() {
        return this.produto;
    }
    
    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    
    public int getQuantidade() {
        return this.quantidade;
    }
    
}
