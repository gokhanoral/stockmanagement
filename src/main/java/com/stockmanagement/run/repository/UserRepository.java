package com.stockmanagement.run.repository;

import com.stockmanagement.run.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    User findByUserName(String username);

    User findByEmail(String email);

}
