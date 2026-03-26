package br.com.unipds.filmes.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Diretor {

    @Id
    private Integer id;
    private String nome;
    private String sobrenome;

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

    public String getNomeCompleto(){
        return String.format("%s %s", nome.trim(), sobrenome.trim());
    }

    @Override
    public String toString() {
        return getNomeCompleto();
    } 
    
}
