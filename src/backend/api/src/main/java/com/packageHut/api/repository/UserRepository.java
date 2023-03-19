package com.packageHut.api.repository;

import com.packageHut.api.model.User;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);

    User findByUserId(String user_id);
}

