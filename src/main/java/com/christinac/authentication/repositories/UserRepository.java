package com.christinac.authentication.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.christinac.authentication.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long>{
	
	@Override
	public List<User> findAll();
	
	Optional<User> findyByEmail(String email);
}
