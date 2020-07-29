package com.stockmanagement.run.service;

import com.stockmanagement.run.model.Product;
import com.stockmanagement.run.model.Stock;
import com.stockmanagement.run.model.Warehouse;
import com.stockmanagement.run.repository.StockRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StockService {

    @Resource
    private StockRepository stockRepository;

    public Stock addStock(Stock stock) {
        stockRepository.save(stock);
        return stock;
    }

    public List<Stock> getStocks() {
        return stockRepository.findAll();
    }

    public Stock getStock(int id) {
        return stockRepository.findById(id).get();
    }

    public Stock updateStock(Stock stock) {
        return stockRepository.save(stock);
    }

    public void deleteStock(int id) {
        stockRepository.deleteById(id);
    }

    public boolean existStock(Product product, Warehouse warehouse){
        return stockRepository.findByProductAndWarehouse(product, warehouse) != null;
    }
}
