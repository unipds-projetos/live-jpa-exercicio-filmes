package br.com.unipds.filmes.model;

import jakarta.persistence.Embeddable;
import jakarta.persistence.ManyToOne;

import java.io.Serializable;

@Embeddable
public class AtuacaoId implements Serializable {

    private static final long serialVersionUID = 1L;

    @ManyToOne
    private Ator ator;

    @ManyToOne
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
