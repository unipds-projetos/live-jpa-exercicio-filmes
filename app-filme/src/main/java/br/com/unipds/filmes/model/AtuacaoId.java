package br.com.unipds.filmes.model;

import java.io.Serializable;


public class AtuacaoId implements Serializable {

    private static final long serialVersionUID = 1L;

    private Ator ator;
    private Filme filme;

    public Ator getAtor() {
        return ator;
    }
    public void setAtor(Ator ator) {
        this.ator = ator;
    }
    public Filme getFilme() {
        return filme;
    }
    public void setFilme(Filme filme) {
        this.filme = filme;
    }

    
    
}
