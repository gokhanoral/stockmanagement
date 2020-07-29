package com.stockmanagement.run.repository;

import com.stockmanagement.run.model.Product;
import com.stockmanagement.run.model.Stock;
import com.stockmanagement.run.model.Warehouse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StockRepository extends JpaRepository<Stock, Integer> {

    Stock findByProductAndWarehouse(Product product, Warehouse warehouse);

}
