package com.stockmanagement.run.service;

import com.stockmanagement.run.model.Warehouse;
import com.stockmanagement.run.repository.WarehouseRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class WarehouseService {

    @Resource
    private WarehouseRepository warehouseRepository;

    public Warehouse addWarehouse(Warehouse warehouse) {
        warehouseRepository.save(warehouse);
        return warehouse;
    }

    public List<Warehouse> getWarehouses() {
        return warehouseRepository.findAll();
    }

    public Warehouse getWarehouse(int id) {
        return warehouseRepository.findById(id).get();
    }

    public Warehouse updateWarehouse(Warehouse warehouse) {
        return warehouseRepository.save(warehouse);
    }

    public void deleteWarehouse(int id) {
        warehouseRepository.deleteById(id);
    }
}
