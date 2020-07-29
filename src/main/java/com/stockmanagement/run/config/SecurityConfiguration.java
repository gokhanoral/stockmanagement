package com.stockmanagement.run.config;

import com.stockmanagement.run.service.UserService;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

import javax.annotation.Resource;

@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfiguration  extends WebSecurityConfigurerAdapter {

    @Resource
    private UserService userService;
    @Resource
    private PasswordEncoder passwordEncoder;

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.authorizeRequests()
                .antMatchers("/templates/**").permitAll()
                .antMatchers("/login").permitAll()
                .and().formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/login").defaultSuccessUrl("/products/")
                .permitAll().and()
                .logout()
                .logoutSuccessUrl("/login")
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .and()
                .authorizeRequests()
                .anyRequest()
                .authenticated();

    }


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(passwordEncoder);
    }

}
