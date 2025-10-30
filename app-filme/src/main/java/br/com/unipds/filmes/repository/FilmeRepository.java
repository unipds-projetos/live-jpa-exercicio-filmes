package br.com.unipds.filmes.repository;

import br.com.unipds.filmes.model.Filme;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FilmeRepository extends JpaRepository<Filme, Integer> {
}
