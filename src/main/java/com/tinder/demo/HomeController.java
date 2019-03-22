package com.tinder.demo;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class HomeController {
	@RequestMapping("home")
	public String home()
	{
		return "home.jsp";
	}
	
	@Autowired
	UserRepo repo;
	
	@RequestMapping("/addUser")
	public String addUsers(Users user){
		System.out.println(user);
		repo.save(user);
		return "home.jsp";
	}
	
	@RequestMapping("/getUser")
	public ModelAndView getUser(@RequestParam Long uid) {
		ModelAndView mv = new ModelAndView("showUser.jsp");
		Users user = repo.findById(uid).orElse(new Users());
		System.out.println(user.getId() + " " + user.getName());
		mv.addObject("user",user);
		mv.addObject("hw","hello!");
		return mv;
	}
}
