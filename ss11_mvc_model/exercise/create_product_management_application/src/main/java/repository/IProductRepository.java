package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
    void display(Product product);
    void add(Product product);
    Product findById(int id);
    void update(int id , Product product);
    void remove(int id);

}
