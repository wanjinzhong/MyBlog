package com.blog.controller.back;

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
import com.blog.service.ArticleService;
import com.blog.service.BloggerService;
import com.blog.service.CommentService;
import com.blog.service.LeaveWordService;
import com.blog.service.UserService;

@Controller
public class BackController {
	@Resource
	private UserService userService;
	@Resource
	private BloggerService bloggerService;
	@Resource
	private CommentService commentService;
	@Resource
	private ArticleService articleService;
	@Resource
	private LeaveWordService leavewordService;
	@RequestMapping(value = "left.do")
	public String left(HttpServletRequest request,Model model) {
		int bloggerId = Integer.parseInt(request.getSession().getAttribute("bloggerId_back").toString());
		int unreadCommentCount = commentService.getCountbyBloggerIdWhichIsUnread(bloggerId);
		model.addAttribute("unread_comment_count", unreadCommentCount);
		return "left";
	}

	@RequestMapping(value = "header.do")
	public String header() {
		return "header";
	}

	@RequestMapping(value = "content.do")
	public String content() {
		return "content";
	}

	@RequestMapping(value = "index.do")
	public String back_index() {
		
		return "index";
	}
	@RequestMapping(value = "login_back.do")
	public void loginBack(HttpServletRequest request, HttpServletResponse response, String name, String password,
			Model model) {
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
		else if (userService.check(map) == null) {
			out.print("<script type='text/javascript'>alert('用户名或密码不正确');window.location = 'login.shtml';</script>");
		} else {
			int id = userService.getIdByName(name);
			Blogger blogger = bloggerService.getByUserId(id);
			if (blogger == null)
				out.print(
						"<script type='text/javascript'>alert('该用户还没有开通博客');window.location = 'login.shtml';</script>");
			else {
				request.getSession().setAttribute("bloggerId_back", blogger.getBloggerId());
				request.getSession().setAttribute("bloggerName_back", blogger.getBloggerName());
				out.print("<script type='text/javascript'>window.location = 'index.do';</script>");
			}
		}
	}
	@RequestMapping(value="logout_back.do")
	public String logout_back(HttpServletRequest request){
		request.getSession().removeAttribute("bloggerId_back");
		return "redirect:login.shtml";
	}

	@RequestMapping(value = "contentindex.do")
	public String content_index(HttpServletRequest request, Model model) {
		int bloggerId = Integer.parseInt(request.getSession().getAttribute("bloggerId_back").toString());
		int articleCount = articleService.getCount(bloggerId);
		int recycleCount = articleService.getDelectedCount(bloggerId);
		int leavewordCount = leavewordService.getCount(bloggerId);
		int leaveWordUnread = leavewordService.getCountUnread(bloggerId);
		int commentCount = commentService.getCountbyBloggerId(bloggerId);
		int commentUnread = commentService.getCountbyBloggerIdWhichIsUnread(bloggerId);
		model.addAttribute("articleCount", articleCount);
		model.addAttribute("leavewordCount", leavewordCount);
		model.addAttribute("leaveWordUnread", leaveWordUnread);
		model.addAttribute("commentCount", commentCount);
		model.addAttribute("commentUnread", commentUnread);
		model.addAttribute("recycleCount", recycleCount);
		return "contentindex";
	}
}
