package com.blog.controller.back;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.bean.Article;
import com.blog.service.ArticleService;
@Controller
public class ArticleControllerBack {
	public static final int PAGE_SIZE = 10;
	@Resource
	private ArticleService articleService;
	@RequestMapping(value = "myarticles.do")
	public String articleList(Integer curPage, HttpServletRequest request, Model model) {
		if (curPage == null || curPage <= 0)
			curPage = 1;
		int index = (curPage - 1) * PAGE_SIZE;
		model.addAttribute("curPage", curPage);
		Map<String, Integer> map = new HashMap<String, Integer>();
		System.out.println(request.getSession().getAttribute("bloggerId_back").toString());
		map.put("bloggerId", Integer.parseInt(request.getSession().getAttribute("bloggerId_back").toString()));
		map.put("index", index);
		map.put("pageSize", PAGE_SIZE);
		List<Article> list = articleService.getBaseOrderByTime(map);
		System.out.println(list.size());
		model.addAttribute("articles", list);
		return "articlelist";
	}

	@RequestMapping(value = "publisharticle.do")
	public String publicArticle() {

		return "publisharticle";
	}
}
