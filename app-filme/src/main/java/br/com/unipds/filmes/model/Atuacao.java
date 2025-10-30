package br.com.unipds.filmes.model;

public class Atuacao {

    private AtuacaoId id;
    private String papel;

    public AtuacaoId getId() {
        return id;
    }
    public void setId(AtuacaoId id) {
        this.id = id;
    }
    public String getPapel() {
        return papel;
    }
    public void setPapel(String papel) {
        this.papel = papel;
    }

    @Override
    public String toString() {
       return String.format("Papel: %s - Ator: %s", papel.trim(), getId().getAtor());
    }
    
    
}
