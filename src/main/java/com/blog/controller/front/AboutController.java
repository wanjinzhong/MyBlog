package com.blog.controller.front;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.bean.Blogger;
import com.blog.service.ArticleService;
import com.blog.service.BloggerService;
import com.blog.service.LeaveWordService;

@Controller
public class AboutController {

	@Resource
	private BloggerService bloggerService;
	@Resource
	private ArticleService articleService;
	@Resource
	private LeaveWordService LeaveWordService;

	@RequestMapping(value = "aboutme.shtml")
	public String aboutme(HttpServletRequest request, Model model) {
		String bloggerIdStr = null;
		if (request.getSession().getAttribute("bloggerId") != null)
			bloggerIdStr = request.getSession().getAttribute("bloggerId").toString();
		int id;
		if (bloggerIdStr == null || bloggerIdStr.trim().equals(""))
			id = 1;
		else
			id = Integer.parseInt(bloggerIdStr);
		Blogger blogger = bloggerService.getBloggerById(id);
		model.addAttribute("blogger", blogger);
		// 获取文章总数
		int article_count = articleService.getCount(id);
		model.addAttribute("article_count", article_count);
		// 获取留言总数
		int leave_word_count = LeaveWordService.getCount(id);
		model.addAttribute("leave_word_count", leave_word_count);
		return "aboutme";
	}
	@RequestMapping(value="aboutwebsite.shtml")
	public String aboutWebSite(){
		return "aboutwebsite";
	}
}
