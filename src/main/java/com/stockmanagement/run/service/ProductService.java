package com.stockmanagement.run.service;

import com.stockmanagement.run.model.Product;
import com.stockmanagement.run.repository.ProductRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProductService {

    @Resource
    private ProductRepository productRepository;

    public Product addProduct(Product product) {
        return productRepository.save(product);
    }

    public List<Product> getProducts() {
        return productRepository.findAll();
    }

    public Product getProduct(int id) {
        return productRepository.findById(id).get();
    }

    public Product updateProduct(Product product) {
        return productRepository.save(product);
    }

    public boolean existProduct(String code){
        Product product = productRepository.findByCode(code);
        return product != null;
    }

    public void deleteProduct(int id) {
        productRepository.deleteById(id);
    }
}
