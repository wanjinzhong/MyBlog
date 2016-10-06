package com.blog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.bean.User;
import com.blog.service.UserService;

@Controller
public class LoginRegistController {
	@Resource
	private UserService userService;

	@RequestMapping("login.do")
	public String login(String url) {
		return "front/login_reg";
	}

	@RequestMapping("gologin.do")
	public String gologin(String name, String password) {

		return "redirect:index.do";
	}

	@RequestMapping(value="check.do",produces = "text/plain;charset=UTF-8")
	public void check(String name, String password, HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("password", password);
		System.out.println(name + "," + password);
		User user = userService.check(map);
		System.out.println(user);
		try {
			if (user != null) {
				request.getSession().setAttribute("userName", name);
				request.getSession().setAttribute("userId", user.getUserId());
				response.sendRedirect("index.do");
			} else {
				PrintWriter out = response.getWriter();
				out.print("<script type='text/javascript'>alert('用户名或密码错误');window.location = 'login.do';</script>");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 退出登陆
	 */
	@RequestMapping(value="logout.do")
	public String logout(HttpServletRequest request){
		request.getSession().removeAttribute("userName");
		return "redirect:login.do";
	}
}
