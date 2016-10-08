package com.blog.controller.back;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LeaveWordControllerBack {
	@RequestMapping(value="unreadleaveword.do")
	public String unreadLeaveWord(){
		return "unreadleaveword";
	}
	@RequestMapping(value="allleaveword.do")
	public String allLeaveWord(){
		return "allleaveword";
	}
}
