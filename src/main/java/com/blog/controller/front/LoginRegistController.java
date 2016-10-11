package com.blog.controller.front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.bean.ArticleType;
import com.blog.bean.Blogger;
import com.blog.bean.User;
import com.blog.service.ArticleTypeService;
import com.blog.service.BloggerService;
import com.blog.service.UserService;

@Controller
public class LoginRegistController {
	@Resource
	private UserService userService;
	@Resource
	private BloggerService bloggerService;
	@Resource
	private ArticleTypeService articleTypeService;
	
	@RequestMapping("login.shtml")
	public String login(String url) {
		return "login_reg";
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
		user.setSex(1);
		userService.regist(user);
		String[] checkbox = request.getParameterValues("checkbox");
		String bloggerName = null;
		if (checkbox!= null) {
			bloggerName = request.getParameter("bloggerName");
			Blogger blogger = new Blogger();
			blogger.setBloggerName(bloggerName);
			blogger.setUserId(userService.getIdByName(name));
			bloggerService.regist(blogger);
			blogger = bloggerService.getByUserId(blogger.getUserId());
			ArticleType articleType = new ArticleType();
			articleType.setBloggerId(blogger.getBloggerId());
			articleType.setTypeName("默认分类");
			articleType.setDescription("这是一个默认分类");
			articleType.setPublishTime(new Date());
			articleType.setUpdateTime(new Date());
			articleType.setIsDefault(1);
			articleTypeService.insertSelective(articleType);
			
		}
		out.print("<script type='text/javascript'>alert('注册成功');window.location = 'login.shtml';</script>");
	}

	
	
}
