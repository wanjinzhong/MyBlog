package com.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BackController {
	@RequestMapping(value="left.do")
	public String left(){
		return "back/left";
	}
	@RequestMapping(value="header.do")
	public String header(){
		return "back/header";
	}
	@RequestMapping(value="content.do")
	public String content(){
		return "back/content";
	}
}
