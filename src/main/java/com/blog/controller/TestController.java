package com.blog.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.bean.User;
import com.blog.service.UserService;

@Controller
public class TestController {
	@Resource
	private UserService userService;
	
	@RequestMapping(value="/select.do", produces = "text/plain;charset=UTF-8")
	public String select(Model model){
		User user = userService.selectById("1");
		model.addAttribute("user", user);
		return "test1";
	}
}
