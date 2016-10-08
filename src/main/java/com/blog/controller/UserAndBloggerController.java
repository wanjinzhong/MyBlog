package com.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserAndBloggerController {
	@RequestMapping(value="back/info.do")
	public String Info(){
		return "back/info";
	}
}
