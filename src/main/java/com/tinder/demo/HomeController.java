package com.tinder.demo;

import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@RequestMapping("home")
	public String home() {
		return "loginup.jsp";
	}

	@Autowired
	UserRepo repo;

	@PostMapping("/addUser")
	public ModelAndView addUsers(Users user, @RequestParam("re_pass") String rePass, HttpSession session) {
		ModelAndView error = new ModelAndView("loginup.jsp");
		if (user.getPass().equals(rePass) && !rePass.equals("")) {
			List<Users> users = repo.findByEmail(user.getEmail());
			if (!users.isEmpty()) {
				error.addObject("email_err", "*Email used already exists!");
				return error;
			} else {
				ModelAndView mv = new ModelAndView("continueRegistration.jsp");
				session.setAttribute("user",user);
				final int logRounds = 10;
				user.setPass(BCrypt.hashpw(user.getPass(),BCrypt.gensalt(logRounds)));
				repo.save(user);
				return mv;
			}
		} else {
			error.addObject("pass_err", "*Passwords don't match!");
			return error;
		}

	}
	
	@PostMapping("/login")
	ModelAndView loginUser(@RequestParam("email") String email, @RequestParam("mypass") String pass, HttpSession session) {
		ModelAndView errorView = new ModelAndView("loginup.jsp");
		List<Users> users = repo.findByEmail(email);
		if (!users.isEmpty()) {
			String cryptedPassFromDataBase = users.get(0).getPass();
			boolean doesMatch = BCrypt.checkpw(pass, cryptedPassFromDataBase);
			if( doesMatch ) {
				ModelAndView userView = new ModelAndView("home.jsp");
				session.setAttribute("user",users.get(0));
				userView.addObject("user", "*good boi!");
				return userView;
			}else {
				errorView.addObject("err_pass","*Wrong credentials!");
				return errorView;
			}
		}else {
			errorView.addObject("email_err","*Wrong email!");
			return errorView;
		}
	}
	
	@PutMapping("/updateUser")
	public ModelAndView updateUser(Users user, HttpSession session) {
		Users currentUser = (Users) session.getAttribute("user");
		System.out.println("\n\nfrom form: "+user.getName() + " " +user.getLastname());
		System.out.println("\n\nsession: "+currentUser.getName() + " " + currentUser.getLastname());
		return null;
	}
	
	@PutMapping("/updateSmth")
	@ResponseBody
	public String upSmth(String data) {
		System.out.println("De la PUT: "+data);
		return data;
	}

	@RequestMapping("/getUser")
	public ModelAndView getUser(@RequestParam Long uid) {
		ModelAndView mv = new ModelAndView("showUser.jsp");
		Users user = repo.findById(uid).orElse(new Users());
		System.out.println(user.getId() + " " + user.getName());
		mv.addObject("user", user);
		mv.addObject("hw", "hello!");
		return mv;
	}
}
