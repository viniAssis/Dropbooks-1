package model;

import java.util.HashMap;

public class Cart {
        
    public HashMap<Integer, Integer> AddItemCart(int produto, HashMap<Integer, Integer> lista) {

        // Verificar se o item a ser adicionar, já existe na lista
        /* for (int i = 0; i < lista.size(); i++) {
            if (lista.containsKey(produto)){
                exists = true;
                key = i;
            }
        } */

        // Caso já exista na lista, adicionar 1 na quantidade, ao invés de adicionar um item repetido
        int value = 1;

        if (lista.containsKey(produto)) {
            value = lista.get(produto) + 1;
        }
        
        lista.put(produto, value);
        
        return lista;
    }
    
    public HashMap<Integer, Integer> RemoveItemCart(int produto, HashMap<Integer, Integer> lista) {
        
        if (lista.containsKey(produto)) {
            lista.remove(produto);
        }
        
        return lista;
    }
    
    public HashMap<Integer, Integer> UpdateItemCart(int codLivro, int qtd, HashMap<Integer, Integer> lista) {

        for (int i = 0; i < lista.size(); i++) {
            if (lista.get(i) == codLivro){
                lista.put(i, qtd);
            }
        }
        
        return lista;
    }   
}
