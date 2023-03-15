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
	
	public List<User> findAll(){
		return userRepo.findAll();
	}
	// find user by id
	public User findById(Long id) {
		Optional<User> optionalUser = userRepo.findById(id);
		if (optionalUser.isPresent()) {
			return optionalUser.get();
		} else {
			return null;
		}
	}
	
//	// create new user
//	public User create(User u) {
//		return userRepo.save(u);
//	}

	//register and login methods
	public User register(User newUser, BindingResult result) {
		// add validations here
		
		// TO-DO - Reject values or register if no errors:
		// Reject if password doesn't match confirmation
        if(!newUser.getPassword().equals(newUser.getConfirm())) {
        	result.rejectValue("confirm", null, "Your passwords do not match!");
        }
        // Reject if email is taken (present in database)
        Optional<User> potentialUser = userRepo.findyByEmail(newUser.getEmail());
        if(potentialUser.isPresent()) {
        	result.rejectValue("email", null, "This email is already taken!");
        }
        // Return null if result has errors
        if (result.hasErrors()) {
        	return null;
        }
        // Hash and set password, save user to database
        String hashPW = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashPW);
		return userRepo.save(newUser);
	}
	
	public User login(LoginUser newLoginObject, BindingResult result) {
		// add validations here
		// TO-DO - Reject values:
		
    	// Find user in the DB by email
        // Reject if NOT present
        
        // Reject if BCrypt password match fails
    
        // Return null if result has errors
        // Otherwise, return the user object
		return null;
	}
	
	
	// update user info
	public User update(User u) {
		return userRepo.save(u);
	}
	
	// delete user by id
	public void deleteUserById(Long id) {
		userRepo.deleteById(id);
	}
}
	
	
