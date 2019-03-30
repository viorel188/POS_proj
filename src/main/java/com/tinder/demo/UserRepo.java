package com.tinder.demo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserRepo extends JpaRepository<Users, Long> {
	List<Users> findByEmail(String email);
	
	@Query("SELECT u FROM Users u WHERE u.email = ?1 AND u.pass = ?2")
	Users findByEmailAndPass(String email, String pass);
	
	@Query("SELECT u FROM Users u WHERE u.id = ?1")
	Users findById(long id);
}
