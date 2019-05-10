package com.tinder.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UsersHandlingController {
	
	@Autowired
	UserRepo repo;
	
	@RequestMapping("/users/{country}")
	public List<Users> getUsersByCountryName(@PathVariable("country") String country){
		return repo.findByCountry(country);
	}
	
//	@RequestMapping(path="/profiles/{country}",produces={"application/json"})
//	public List<Users> getUsersByCountry(@PathVariable("country") String country){
//		return repo.findByCountryName(country);
//	}
}
