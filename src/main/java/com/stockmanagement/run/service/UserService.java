package com.stockmanagement.run.service;

import com.stockmanagement.run.model.User;
import com.stockmanagement.run.repository.UserRepository;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserService implements UserDetailsService {

    @Resource
    private UserRepository userRepository;

    public User saveUser(User user) {
        return userRepository.save(user);
    }

    public List<User> getUsers() {
        return userRepository.findAll();
    }

    public User getUser(int id) {
        return userRepository.findById(id).get();
    }

    public User updateUser(User user) {
        return userRepository.save(user);
    }

    public void deleteUser(int id) {
        userRepository.deleteById(id);
    }

    public User getUserByUserName(String userName){
        return userRepository.findByUserName(userName);
    }

    public boolean existUser(String userName){
        User user = userRepository.findByUserName(userName);
        return user != null;
    }

    public User currentUser(){
        return (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        try {
            return getUserByUserName(userName);
        } catch (Exception e) {
            throw new UsernameNotFoundException("User not found userName: " + userName );
        }
    }
}
