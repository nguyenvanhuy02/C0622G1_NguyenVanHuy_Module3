package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1,"Bánh Kẹo",12000,"Bánh kẹo thơm ngon","Bánh kẹo tài trợ"));
        productList.add(new Product(2,"Bánh Kẹo",15000,"Bánh kẹo thơm ngon","Bánh kẹo tài trợ"));
        productList.add(new Product(3,"Bánh Kẹo",13000,"Bánh kẹo thơm ngon","Bánh kẹo tài trợ"));
        productList.add(new Product(4,"Bánh Kẹo",22000,"Bánh kẹo thơm ngon","Bánh kẹo tài trợ"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void display(Product product) {

    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public void update(Product product) {
        int index = productList.indexOf(product);
        productList.set(index,product);
    }

    @Override
    public void remove(int id) {
        for (Product product: productList) {
            if (product.getId()==id){
                productList.remove(product);
                break;
            }
        }
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> list = new ArrayList<>();
        for (Product product:productList) {
            if (product.getName().contains(name) && !name.equals("")){
                list.add(product);
            }
        }
        return list;
    }

    @Override
    public Product  findById(int id) {
//        List<Product> list = new ArrayList<>();
        for (Product product: productList) {
            if (product.getId()==id){
                return product;
            }
        }
        return null;
    }
}
