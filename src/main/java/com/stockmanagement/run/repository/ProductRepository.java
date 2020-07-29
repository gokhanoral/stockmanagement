package com.stockmanagement.run.repository;

import com.stockmanagement.run.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

    Product findByCode(String code);
}
