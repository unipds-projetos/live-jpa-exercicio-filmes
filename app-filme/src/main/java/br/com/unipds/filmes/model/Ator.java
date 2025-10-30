package br.com.unipds.filmes.model;

public class Ator {

    private Integer id;
    private String nome;
    private String sobrenome;
    private Character sexo;
    
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public String getSobrenome() {
        return sobrenome;
    }
    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }
    public Character getSexo() {
        return sexo;
    }
    public void setSexo(Character sexo) {
        this.sexo = sexo;
    }

    public String getNomeCompleto() {
        return String.format("%s %s", nome.trim(), sobrenome.trim());
    }

    @Override
    public String toString() {
        return getNomeCompleto();
    }

    
}
