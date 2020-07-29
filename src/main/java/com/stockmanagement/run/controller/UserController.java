package com.stockmanagement.run.controller;

import com.stockmanagement.run.model.Role;
import com.stockmanagement.run.model.User;
import com.stockmanagement.run.service.RoleService;
import com.stockmanagement.run.service.UserService;
import org.springframework.context.annotation.Bean;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {

    @Resource
    private UserService userService;

    @Resource
    private PasswordEncoder passwordEncoder;

    @Resource
    private RoleService roleService;

    @GetMapping
    public String getUsers(Model model){
        List<User> userList =  userService.getUsers();
        model.addAttribute("userList", userList);
        return "users/list";
    }

    @GetMapping("/add")
    public String addUser(Model model){
        model.addAttribute("user", new User());
        return "users/add";
    }

    @PostMapping(value = "/add", consumes = {MediaType.APPLICATION_FORM_URLENCODED_VALUE})
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String addUser(User user, Model model){
        boolean existUser = userService.existUser(user.getUserName());
        if(!existUser) {
            String hashedPassword = passwordEncoder.encode(user.getPassword());
            Role role = roleService.getRoleByName("ROLE_USER");
            user.setRoles(new HashSet<>(Arrays.asList(role)));
            user.setPassword(hashedPassword);
            userService.saveUser(user);
            return "redirect:/users";
        }else{
            model.addAttribute("message", user.getUserName() +  " kullanıcı adına sahip kayıtlı kullanıcı zaten bulunmaktadır.");
            return "users/add";
        }
    }

    @GetMapping(value = "/edit/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String addUser(@PathVariable int id, Model model){
        User user = userService.getUser(id);
        model.addAttribute("user", user);
        return "users/edit";
    }

    @PostMapping(value = "/edit/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String updateUser(User user){
        String hashedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(hashedPassword);
        userService.updateUser(user);
        return "redirect:/users";
    }

    @GetMapping(value = "/delete/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String deleteUser(@PathVariable int id){
        userService.deleteUser(id);
        return "redirect:/users";
    }

}
