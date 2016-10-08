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
import com.blog.bean.ArticleFull;
import com.blog.bean.ArticleType;
import com.blog.service.ArticleService;
import com.blog.service.ArticleTypeService;
@Controller
public class ArticleControllerBack {
	public static final int PAGE_SIZE = 10;
	@Resource
	private ArticleService articleService;
	@Resource
	private ArticleTypeService articleTypeService;
	@RequestMapping(value = "myarticles.do")
	public String articleList(Integer curPage, HttpServletRequest request, Model model) {
		if (curPage == null || curPage <= 0)
			curPage = 1;
		int index = (curPage - 1) * PAGE_SIZE;
		model.addAttribute("curPage", curPage);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("bloggerId", Integer.parseInt(request.getSession().getAttribute("bloggerId_back").toString()));
		map.put("index", index);
		map.put("pageSize", PAGE_SIZE);
		List<Article> list = articleService.getBaseOrderByTime(map);
		model.addAttribute("articles", list);
		return "articlelist";
	}

	@RequestMapping(value = "publisharticle.do")
	public String publicArticle() {

		return "publisharticle";
	}
	@RequestMapping(value="articledetail.do")
	public String artialedetail(Integer articleid, Model model){
		ArticleFull article = articleService.getArticleFullById(articleid);
		model.addAttribute("article", article);
		ArticleType articleType = articleTypeService.getById(article.getTypeId());
		model.addAttribute("articleType", articleType.getTypeName());
		return "articledetail";
	}
}
