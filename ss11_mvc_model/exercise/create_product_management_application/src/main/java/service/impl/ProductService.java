package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();


    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void display(Product product) {

    }

    @Override
    public void add(Product product) {
        productRepository.add(product);
    }

    @Override
    public void update(Product product) {
        productRepository.update(product);
    }

    @Override
    public void remove(int id) {
        productRepository.remove(id);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public List<Product> findByName(String name) {
        return productRepository.findByName(name);
    }
}
