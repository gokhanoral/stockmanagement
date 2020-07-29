package com.stockmanagement.run.controller;

import com.stockmanagement.run.model.Product;
import com.stockmanagement.run.service.ProductService;
import org.springframework.http.MediaType;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;


@Controller
@RequestMapping("/products")
public class ProductController {

    @Resource
    private ProductService productService;

    @GetMapping
    public String getProducts(Model model){
        List<Product> productList =  productService.getProducts();
        model.addAttribute("productList", productList);
        return "products/list";
    }

    @GetMapping("/add")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String addProduct(Model model){
        model.addAttribute("product", new Product());
        return "products/add";
    }

    @PostMapping(value = "/add", consumes = {MediaType.APPLICATION_FORM_URLENCODED_VALUE})
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String addProduct(Product product, Model model){
        boolean existProduct = productService.existProduct(product.getCode());
        if(!existProduct) {
            productService.addProduct(product);
            return "redirect:/products";
        }else{
            model.addAttribute("message", product.getCode() +  " kodu ile kayıtlı zaten bir ürün bulunmaktadır.");
            return "products/add";
        }
    }

    @GetMapping(value = "/edit/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String addProduct(@PathVariable int id, Model model){
        Product product = productService.getProduct(id);
        model.addAttribute("product", product);
        return "products/edit";
    }

    @PostMapping(value = "/edit/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String updateProduct(Product product){
        productService.updateProduct(product);
        return "redirect:/products";
    }

    @GetMapping(value = "/delete/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String deleteProduct(@PathVariable int id){
        productService.deleteProduct(id);
        return "redirect:/products";
    }

}
