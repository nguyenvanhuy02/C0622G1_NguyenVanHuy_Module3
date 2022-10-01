package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    void display(Product product);
    void add(Product product);
    void update(Product product);
    void remove(int id);
    Product findById(int id);
    List<Product> findByName(String name);
}
