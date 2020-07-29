package com.stockmanagement.run.controller;

import com.stockmanagement.run.model.Warehouse;
import com.stockmanagement.run.service.WarehouseService;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/warehouses")
public class WarehouseController {

    @Resource
    private WarehouseService warehouseService;

    @GetMapping
    public String getWarehouses(Model model){
        List<Warehouse> warehouseList =  warehouseService.getWarehouses();
        model.addAttribute("warehouseList", warehouseList);
        return "warehouses/list";
    }

    @GetMapping("/add")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String addWarehouse(Model model){
        model.addAttribute("warehouse", new Warehouse());
        return "warehouses/add";
    }

    @PostMapping(value = "/add", consumes = {MediaType.APPLICATION_FORM_URLENCODED_VALUE})
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String addWarehouse(Warehouse warehouse){
        warehouseService.addWarehouse(warehouse);
        return "redirect:/warehouses";
    }

    @GetMapping(value = "/edit/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String addWarehouse(@PathVariable int id, Model model){
        Warehouse warehouse = warehouseService.getWarehouse(id);
        model.addAttribute("warehouse", warehouse);
        return "warehouses/edit";
    }

    @PostMapping(value = "/edit/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String updateWarehouse(Warehouse warehouse){
        warehouseService.updateWarehouse(warehouse);
        return "redirect:/warehouses";
    }

    @GetMapping(value = "/delete/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String deleteWarehouse(@PathVariable int id){
        warehouseService.deleteWarehouse(id);
        return "redirect:/warehouses";
    }

}
