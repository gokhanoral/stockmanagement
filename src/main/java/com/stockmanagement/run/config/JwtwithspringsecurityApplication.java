package com.stockmanagement.run.config;

import com.stockmanagement.run.model.Role;
import com.stockmanagement.run.model.User;
import com.stockmanagement.run.repository.RoleRepository;
import com.stockmanagement.run.repository.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashSet;

@SpringBootApplication
@RestController
public class JwtwithspringsecurityApplication {
    @Resource
    private UserRepository userRepository;
    @Resource
    private RoleRepository roleRepository;

    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    public static void main(String[] args) {
        SpringApplication.run(JwtwithspringsecurityApplication.class, args);
    }

    @Bean
    CommandLineRunner commandLineRunner() {
        return new CommandLineRunner() {
            @Override
            public void run(String... args) throws Exception {
                User user = userRepository.findByUserName("admin");
                Role userRole = roleRepository.findByRole("ROLE_USER");
                if(userRole == null){
                    userRole = new Role("ROLE_USER");
                    roleRepository.save(userRole);
                }

                Role adminRole = roleRepository.findByRole("ROLE_ADMIN");
                if(adminRole == null){
                    adminRole = new Role("ROLE_ADMIN");
                    roleRepository.save(adminRole);
                }


                if (user == null) {
                    String hashedPassword = passwordEncoder().encode("123");
                    HashSet<Role> roles = new HashSet<>();
                    roles.add(adminRole);
                    user = new User();
                    user.setEmail("admin");
                    user.setName("Admin");
                    user.setPassword(hashedPassword);
                    user.setUserName("admin");
                    user.setRoles(roles);
                    userRepository.save(user);
                }
            }
        };
    }
}
