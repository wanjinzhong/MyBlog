package com.blog.controller.back;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserAndBloggerControllerBack {
	@RequestMapping(value="info.do")
	public String Info(){
		return "info";
	}
}
