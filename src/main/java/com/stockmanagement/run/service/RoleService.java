package com.stockmanagement.run.service;

import com.stockmanagement.run.model.Role;
import com.stockmanagement.run.repository.RoleRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RoleService {

    @Resource
    private RoleRepository roleRepository;

    public Role addRole(Role role) {
        return roleRepository.save(role);
    }

    public List<Role> getRoles() {
        return roleRepository.findAll();
    }

    public Role getRole(int id) {
        return roleRepository.findById(id).get();
    }

    public Role updateRole(Role role) {
        return roleRepository.save(role);
    }

    public void deleteRole(int id) {
        roleRepository.deleteById(id);
    }

    public Role getRoleByName(String name){
        return roleRepository.findByRole(name);
    }
}
