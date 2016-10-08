package com.blog.controller.back;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommentControllerBack {
	@RequestMapping(value="unreadcomment.do")
	public String unreadComment(){
		return "unreadcomment";
	}
}
