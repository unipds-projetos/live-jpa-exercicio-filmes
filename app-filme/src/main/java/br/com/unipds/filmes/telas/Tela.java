package br.com.unipds.filmes.telas;

import java.util.Scanner;

import org.springframework.data.repository.Repository;

public interface Tela<T, K> {
    void executar(Scanner entrada, Repository<T, K> repositorio);
}

