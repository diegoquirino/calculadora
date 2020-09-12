package net.diegoquirino.calculadora.repository;

import com.github.javafaker.Faker;
import net.diegoquirino.calculadora.model.Item;
import net.diegoquirino.calculadora.model.Produto;
import net.diegoquirino.calculadora.model.TipoCliente;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import java.util.*;
import java.util.stream.Collectors;

@Repository
public class FakeItemDAO implements ItemDAO {

    Collection<Item> itens = criarItens(10);

    @Override
    public Optional<Item> get(Long id) {
        return this.itens.stream()
                .filter(prod -> prod.getId().equals(id))
                .findFirst();
    }

    @Override
    public Collection<Item> getAll() {
        return this.itens.stream()
                .sorted((p1, p2) -> p1.getId().compareTo(p2.getId()))
                .collect(Collectors.toList());
    }

    @Override
    public Long save(Item item) {
        item.setId(getNextId());
        this.itens.add(item);
        return item.getId();
    }

    @Override
    public void update(Item item) {
        Item oldItem = get(item.getId()).get();
        delete(oldItem);
        this.itens.add(item);
    }

    @Override
    public void delete(Item item) {
        this.itens.remove(item);
    }

    @Override
    public Long getNextId() {
        int size = this.itens.size();
        List<Item> ordenado = this.itens.stream()
                .sorted((p1, p2) -> p1.getId().compareTo(p2.getId()))
                .collect(Collectors.toList());
        if(size <= 0) {
            return 1L;
        } else {
            return ordenado.get(size-1).getId() + 1L;
        }
    }

    public Collection<Item> criarItens(Integer quantidade) {
        Collection<Item> itens = new ArrayList<Item>();
        Faker faker = new Faker(new Locale("pt_BR"));
        for(int i = 0; i < quantidade; i++) {
            Produto produto = new Produto(
                    i+1l,
                    faker.commerce().productName(),
                    faker.number().randomDouble(2, 100, 2000)
            );
            TipoCliente tipoCliente = TipoCliente.A;
            if(i % 2 != 0) {
                tipoCliente = TipoCliente.B;
            }
            if(i % 3 == 0) {
                tipoCliente = TipoCliente.C;
            }
            itens.add(
                    new Item(
                            i + 1l,
                            tipoCliente,
                            produto,
                            faker.random().nextInt(1,2000)
            ));
        }
        this.itens = itens;
        return itens;
    }
}
