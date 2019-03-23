package com.tinder.demo;

import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView addUsers(Users user, @RequestParam("re_pass") String rePass) {
		ModelAndView error = new ModelAndView("loginup.jsp");
		if (user.getPass().equals(rePass) && !rePass.equals("")) {
			List<Users> users = repo.findByEmail(user.getEmail());
			if (!users.isEmpty()) {
				System.out.println("emailul: " + users.get(0).getName() + " " + users.get(0).getEmail());
				error.addObject("email_err", "*Email used already exists!");
				return error;
			} else {
				ModelAndView mv = new ModelAndView("home.jsp");
				final int logRounds = 10;
				user.setPass(BCrypt.hashpw(user.getPass(),BCrypt.gensalt(logRounds)));
				System.out.println(user);
				repo.save(user);
				return mv;
			}
		} else {
			System.out.println("Passwords don't match!");
			error.addObject("pass_err", "*Passwords don't match!");
			return error;
		}

	}
	
	@PostMapping("/login")
	ModelAndView loginUser(@RequestParam("email") String email, @RequestParam("mypass") String pass) {
		ModelAndView errorView = new ModelAndView("loginup.jsp");
		List<Users> users = repo.findByEmail(email);
		if (!users.isEmpty()) {
			String cryptedPassFromDataBase = users.get(0).getPass();
			boolean doesMatch = BCrypt.checkpw(pass, cryptedPassFromDataBase);
			if( doesMatch ) {
				ModelAndView userView = new ModelAndView("home.jsp");
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
