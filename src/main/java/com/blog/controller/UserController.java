package com.blog.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.bean.User;
import com.blog.service.UserService;

@Controller
public class UserController {
	@Resource
	private UserService userService;
	
	@RequestMapping(value="aboutme.do")
	public String getUser(Model model){
		User user = userService.selectById("1");
		model.addAttribute("user", user);
		return "aboutme";
	}
	@RequestMapping(value="index.do")
	public String index(){
		return "index";
	}
}
