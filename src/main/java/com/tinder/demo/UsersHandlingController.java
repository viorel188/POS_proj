package com.tinder.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UsersHandlingController {
	
	@Autowired
	UserRepo repo;
	@Autowired
	LikedProfilesRepo likesRepo;
	
	@RequestMapping("/users/{country}")
	public List<Users> getUsersByCountryName(@PathVariable("country") String country){
		return repo.findByCountry(country);
	}
	
//	@RequestMapping(path="/profiles/{country}",produces={"application/json"})
//	public List<Users> getUsersByCountry(@PathVariable("country") String country){
//		return repo.findByCountryName(country);
//	}
	
	@RequestMapping(path="/profiles/{country}&{sex}",produces={"application/json"})
	public List<Users> getUsersByCountry(@PathVariable("country") String country, @PathVariable("sex") String sex){
		return repo.findByCountryAndSex(country, sex);
	}
	
	@RequestMapping(path="/find/{country}&{sex}&{interestedin}",produces={"application/json"})
	public List<Users> getUsersByCountry(@PathVariable("country") String country, @PathVariable("sex") String sex, 
			@PathVariable("interestedin") String interestedin){
		return repo.findByCountryAndSexAndInterestedIn(country, sex, interestedin);
	}
	
	@PostMapping(path="/addLike", consumes={"application/json"})
	public String addLike(@RequestBody Liketable like) {
		//like.setId_like(1);
		likesRepo.save(like);
		return "added";
	}
	
	@DeleteMapping(path="/deleteLike", consumes={"application/json"})
	public String deleteLike(@RequestBody Liketable like /* the id for this like is only in DB */) {
		Long id = likesRepo.findByIdLike(like.getLiked_user_id(), like.getUser_id());
		Liketable likeToDelete = likesRepo.getOne(id);
		likesRepo.delete(likeToDelete);
		return "deleted";
	}
	
	@RequestMapping(path="/checklikes/{userId}")
	@ResponseBody
	public List<Long> checkIfLiked(@PathVariable("userId") Long userId) {
		List<Long> idsLikes = likesRepo.findByUser_id(userId);
		return idsLikes;
	}
}
