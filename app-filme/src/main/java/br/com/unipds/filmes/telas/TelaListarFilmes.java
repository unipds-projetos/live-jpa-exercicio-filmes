package br.com.unipds.filmes.telas;

import java.util.List;
import java.util.Scanner;

import br.com.unipds.filmes.model.Filme;
import br.com.unipds.filmes.repository.FilmeRepository;
import org.springframework.data.repository.Repository;

public class TelaListarFilmes implements Tela<Filme, Integer> {
    @Override
    public void executar(Scanner entrada, Repository<Filme, Integer> repositorio) {
        FilmeRepository repo = (FilmeRepository)repositorio;

        List<Filme> filmes = repo.obterFilmes();

        if(filmes.isEmpty()) {
            System.out.println("\nNão há filmes cadastrados.");
            return;
        }

        System.out.println("\n***************************");
        System.out.println("Lista de filmes cadastrados");
        System.out.println("***************************");
        filmes.forEach(System.out::println);
    }
    
}