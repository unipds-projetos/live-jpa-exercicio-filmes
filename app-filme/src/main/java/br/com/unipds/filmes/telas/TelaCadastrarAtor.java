package br.com.unipds.filmes.telas;

import java.util.Scanner;

import org.springframework.data.repository.Repository;

import br.com.unipds.filmes.model.Ator;
import br.com.unipds.filmes.repository.AtorRepository;

public class TelaCadastrarAtor implements Tela<Ator, Integer> {

    @Override
    public void executar(Scanner entrada, Repository<Ator, Integer> repositorio) {
        Ator a = new Ator();

        System.out.println("\n*****************");
        System.out.println("Cadastro de Atores");
        System.out.println("*****************");

        System.out.print("Informe o id do Ator: ");
        a.setId(entrada.nextInt());
        entrada.nextLine();
        System.out.print("Primeiro nome: ");
        a.setNome(entrada.nextLine());
        System.out.print("Sobrenome: ");
        a.setSobrenome(entrada.nextLine());
        System.out.print("Sexo (F/M): ");
        a.setSexo(entrada.next().charAt(0));
       
        ((AtorRepository)repositorio).save(a);
        System.out.println("\nAtor cadastrado com sucesso.");
    }
        
}
