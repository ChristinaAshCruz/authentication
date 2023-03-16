package com.christinac.authentication.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.christinac.authentication.models.LoginUser;
import com.christinac.authentication.models.User;
import com.christinac.authentication.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepo;
	
	// finding all the users
	public List<User> find() {
		return userRepo.findAll();
	}
	
	public User register(User u, BindingResult result) {
		// if the confirmPassword != password
		Optional<User> optionalUser = userRepo.findByEmail(u.getEmail());
		if(optionalUser.isPresent()) {
			result.rejectValue("email", null, "Your email is already taken!");
		}
		if(!u.getConfirm().equals(u.getPassword())) {
			// add error to your confirPassword input in your jsp
			result.rejectValue("confirm", null, "Passwords do not match!");
		}
		if (result.hasErrors()) {
			return null;
		}
		String hashPW = BCrypt.hashpw(u.getPassword(), BCrypt.gensalt());
		u.setPassword(hashPW);
		return userRepo.save(u);
	}
	
	
	public User login(LoginUser l, BindingResult result) {
		Optional<User> optionalUser = userRepo.findByEmail(l.getEmail());
		// if the optionalUser is empty OR if  the check password fails -> return null
		if (optionalUser.isEmpty() || !BCrypt.checkpw(l.getPassword(), optionalUser.get().getPassword())){
			result.rejectValue("password", null, "Incorrect email or password!");
			return null;
		} else {
		// ELSE -> return the user object 
			return optionalUser.get();
		}
		
	}
	
	public User findByID(Long id) {
		Optional<User> optUser = userRepo.findById(id);
		if (optUser.isEmpty()) {
			return null;
		} else {
			return optUser.get();
		}
	}
}
	
	
