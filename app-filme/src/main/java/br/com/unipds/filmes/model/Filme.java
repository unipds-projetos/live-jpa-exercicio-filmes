package br.com.unipds.filmes.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class Filme {

    private Integer id;
    private String titulo;
    private Integer ano;
    private Integer duracao;
    private String idioma;
    private LocalDate dataLancamento;
    private String pais;


    private List<Atuacao> atuacoes;

    private List<Diretor> diretores = new ArrayList<>();

    public List<Atuacao> getAtuacoes() {
        return atuacoes;
    }
    public void setAtuacoes(List<Atuacao> atuacoes) {
        this.atuacoes = atuacoes;
    }
    public List<Diretor> getDiretores() {
        return diretores;
    }
    public void setDiretores(List<Diretor> diretores) {
        this.diretores = diretores;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getTitulo() {
        return titulo;
    }
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    public Integer getAno() {
        return ano;
    }
    public void setAno(Integer ano) {
        this.ano = ano;
    }
    public Integer getDuracao() {
        return duracao;
    }
    public void setDuracao(Integer duracao) {
        this.duracao = duracao;
    }
    public String getIdioma() {
        return idioma;
    }
    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }
    public LocalDate getDataLancamento() {
        return dataLancamento;
    }
    public void setDataLancamento(LocalDate dataLancamento) {
        this.dataLancamento = dataLancamento;
    }
    public String getPais() {
        return pais;
    }
    public void setPais(String pais) {
        this.pais = pais;
    }

    public Map<String, Ator> getElenco() {
        Map<String, Ator> elenco = new HashMap<>();

        atuacoes.forEach(a -> elenco.put(a.getPapel().trim(), a.getId().getAtor()));

        return elenco;
        
    }

    @Override
    public String toString() {
        return String.format("Filme:  %s  \nDiretores: %s \nAtuações: %s", 
          titulo, diretores, atuacoes);
    }

    
    
    
}
