package com.blog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.bean.Blogger;
import com.blog.bean.User;
import com.blog.service.BloggerService;
import com.blog.service.UserService;

@Controller
public class LoginRegistController {
	@Resource
	private UserService userService;
	@Resource
	private BloggerService bloggerService;

	@RequestMapping("login.shtml")
	public String login(String url) {
		return "front/login_reg";
	}

	@RequestMapping("gologin.shtml")
	public String gologin(String name, String password) {

		return "redirect:index.shtml";
	}

	@RequestMapping(value = "check.shtml", produces = "text/plain;charset=UTF-8")
	public void check(String name, String password, HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("password", password);
		User user = userService.check(map);
		System.out.println(user);
		try {
			if (user != null) {
				request.getSession().setAttribute("userName", name);
				request.getSession().setAttribute("userId", user.getUserId());
				response.sendRedirect("index.shtml");
			} else {
				PrintWriter out = response.getWriter();
				out.print("<script type='text/javascript'>alert('用户名或密码错误');window.location = 'login.shtml';</script>");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 退出登陆
	 */
	@RequestMapping(value = "logout.shtml")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("userName");
		return "redirect:login.shtml";
	}

	@RequestMapping(value = "register.shtml")
	public void register(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String name = request.getParameter("name_r");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			if (userService.userIsExist(name) != null) {
				out.print("<script type='text/javascript'>alert('用户名已存在');window.location = 'login.shtml';</script>");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String psd = request.getParameter("psd_r");
		User user = new User();
		user.setLoginName(name);
		user.setPassword(psd);
		userService.regist(user);
		String[] checkbox = request.getParameterValues("checkbox");
		String bloggerName = null;
		if (checkbox.length != 0) {
			bloggerName = request.getParameter("bloggerName");
			Blogger blogger = new Blogger();
			blogger.setBloggerName(bloggerName);
			blogger.setUserId(userService.getIdByName(name));
			bloggerService.regist(blogger);
		}
		out.print("<script type='text/javascript'>alert('注册成功');window.location = 'login.shtml';</script>");
	}

	@RequestMapping(value="login_back.do")
	public void loginBack(HttpServletRequest request,HttpServletResponse response,String name, String password,Model model){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("password", password);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (userService.userIsExist(name) == null)
			out.print("<script type='text/javascript'>alert('用户名不存在');window.location = 'login.shtml';</script>");
		else if (userService.check(map) == null){
			out.print("<script type='text/javascript'>alert('用户名或密码不正确');window.location = 'login.shtml';</script>");
		} else{
			int id = userService.getIdByName(name);
			Blogger blogger = bloggerService.getBloggerById(id);
			request.getSession().setAttribute("bloggerId_back", blogger.getBloggerId());
			request.getSession().setAttribute("bloggerName_back", blogger.getBloggerName());
			out.print("<script type='text/javascript'>window.location = 'index.do';</script>");
		}
	}
	@RequestMapping("index.do")
	public String back_index(){
		return "back/index";
	}
}
