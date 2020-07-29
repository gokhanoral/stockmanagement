package com.stockmanagement.run.controller;

import com.stockmanagement.run.forms.StockForm;
import com.stockmanagement.run.model.Product;
import com.stockmanagement.run.model.Stock;
import com.stockmanagement.run.model.Warehouse;
import com.stockmanagement.run.service.ProductService;
import com.stockmanagement.run.service.StockService;
import com.stockmanagement.run.service.WarehouseService;
import org.springframework.http.MediaType;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/stocks")
public class StockController {

    @Resource
    private StockService stockService;

    @Resource
    private ProductService productService;

    @Resource
    private WarehouseService warehouseService;

    @GetMapping
    public String getStocks(Model model){
        List<Stock> stockList =  stockService.getStocks();
        model.addAttribute("stockList", stockList);
        return "stocks/list";
    }

    @GetMapping("/add")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String addStock(Model model){
        List<Product> productList = productService.getProducts();
        List<Warehouse> warehouseList = warehouseService.getWarehouses();
        model.addAttribute("productList", productList);
        model.addAttribute("warehouseList", warehouseList);
        model.addAttribute("stockForm", new StockForm());
        return "stocks/add";
    }

    @PostMapping(value = "/add", consumes = {MediaType.APPLICATION_FORM_URLENCODED_VALUE})
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String addStock(StockForm stockForm, Model model, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "stocks/add";
        }
        Stock stock = new Stock();
        stock.setCode(stockForm.getCode());
        if(stockForm.getProductId() != null){
            Product product = productService.getProduct(stockForm.getProductId());
            stock.setProduct(product);
        }
        if(stockForm.getWarehouseId() != null){
            Warehouse warehouse = warehouseService.getWarehouse(stockForm.getWarehouseId());
            stock.setWarehouse(warehouse);
        }
        stock.setQuantity(stockForm.getQuantity());
        if(stock.getWarehouse() != null && stock.getProduct() != null) {
            boolean existStock = stockService.existStock(stock.getProduct(), stock.getWarehouse());
            if (!existStock) {
                stockService.addStock(stock);
                return "redirect:/stocks";
            } else {

                model.addAttribute("message", stock.getWarehouse().getName() + " deposunda " +  stock.getProduct().getName()  + " ürününün stok kaydı bulunmaktadır. Lütfen bu kaydı güncelleyiniz.");
                return "stocks/add";
            }
        }

        return "redirect:/stocks";
    }

    @GetMapping(value = "/edit/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String addStock(@PathVariable int id, Model model){
        Stock stock = stockService.getStock(id);
        StockForm stockForm = new StockForm();
        stockForm.setId(stock.getId());
        stockForm.setCode(stock.getCode());
        if(stock.getProduct() != null) {
            stockForm.setProductId(stock.getProduct().getId());
        }
        if(stock.getWarehouse() != null) {
            stockForm.setWarehouseId(stock.getWarehouse().getId());
        }
        stockForm.setQuantity(stock.getQuantity());
        List<Product> productList = productService.getProducts();
        List<Warehouse> warehouseList = warehouseService.getWarehouses();
        model.addAttribute("productList", productList);
        model.addAttribute("warehouseList", warehouseList);
        model.addAttribute("stockForm", stockForm);
        return "stocks/edit";
    }

    @PostMapping(value = "/edit/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String updateStock(@PathVariable int id, StockForm stockForm){
        Stock stock = new Stock();
        stock.setId(id);
        stock.setCode(stockForm.getCode());
        if(stockForm.getProductId() != null){
            Product product = productService.getProduct(stockForm.getProductId());
            stock.setProduct(product);
        }
        if(stockForm.getWarehouseId() != null){
            Warehouse warehouse = warehouseService.getWarehouse(stockForm.getWarehouseId());
            stock.setWarehouse(warehouse);
        }
        stock.setQuantity(stockForm.getQuantity());

        stockService.updateStock(stock);
        return "redirect:/stocks";
    }

    @GetMapping(value = "/delete/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String deleteStock(@PathVariable int id){
        stockService.deleteStock(id);
        return "redirect:/stocks";
    }

}
