package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1,"Bánh Kẹo",12000,"Bánh kẹo thơm ngon","Bánh kẹo tài trợ"));
        productList.add(new Product(2,"Điện thoại",1500000,"ip 11","Nhà tài trợ"));
        productList.add(new Product(3,"Máy tính",13000000,"Dell","Nhà tài trợ"));
        productList.add(new Product(4,"Máy quạt",220000,"Vù vù","Nhà tài trợ"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
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
            if (product.getName().contains(name)){
                list.add(product);
            }
        }
        return list;
    }

    @Override
    public Product  findById(int id) {
        for (Product product: productList) {
            if (product.getId()==id){
                return product;
            }
        }
        return null;
    }
}
