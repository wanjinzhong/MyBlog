package com.blog.controller.back;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.bean.Article;
import com.blog.bean.ArticleFull;
import com.blog.bean.ArticleType;
import com.blog.dao.ArticleMapper;
import com.blog.service.ArticleService;
import com.blog.service.ArticleTypeService;
import com.blog.service.CommentService;

@Controller
public class ArticleControllerBack {
	public static final int PAGE_SIZE = 5;
	@Resource
	private ArticleService articleService;
	@Resource
	private ArticleTypeService articleTypeService;
	@Resource
	private CommentService commentService;
	@RequestMapping(value = "myarticles.do")
	public String articleList(Integer curPage, HttpServletRequest request, Model model) {
		if (curPage == null || curPage <= 0)
			curPage = 1;
		int index = (curPage - 1) * PAGE_SIZE;
		model.addAttribute("curPage", curPage);
		Map<String, Integer> map = new HashMap<String, Integer>();
		int bloggerId = Integer.parseInt(request.getSession().getAttribute("bloggerId_back").toString());
		int count = articleService.getCount(bloggerId);
		map.put("bloggerId", bloggerId);
		map.put("index", index);
		map.put("pageSize", PAGE_SIZE);
		List<Article> list = articleService.getBaseOrderByTime(map);
		model.addAttribute("articles", list);
		model.addAttribute("curPage", curPage);
		model.addAttribute("count", count);
		return "articlelist";
	}

	@RequestMapping(value = "publisharticle.do")
	public String publicArticle() {

		return "publisharticle";
	}

	@RequestMapping(value = "articledetail.do")
	public String artialedetail(Integer articleid, Model model) {
		getArticleFull(articleid, model);
		return "articledetail";
	}

	@RequestMapping(value = "articleupdate.do")
	public String artialeupdate(Integer articleid, Model model) {
		getArticleFull(articleid, model);
		return "articleupdate";
	}

	/**
	 * 获取文章的完整信息
	 * 
	 * @param articleid
	 *            文章id
	 * @param model
	 *            要返回的视图
	 */
	public void getArticleFull(Integer articleid, Model model) {
		ArticleFull article = articleService.getArticleFullById(articleid);
		model.addAttribute("article", article);
		ArticleType articleType = articleTypeService.getById(article.getTypeId());
		model.addAttribute("articleType", articleType.getTypeName());
	}

	@RequestMapping(value = "articledelete.do")
	public String articledelete(HttpServletRequest request, HttpServletResponse response, Integer articleId) {
		articleService.setDeleteById(articleId);
		return "redirect:myarticles.do";
	}
	
	@RequestMapping(value="recyclebin.do")
	public String recyclebin(Integer curPage, HttpServletRequest request, Model model) {
		if (curPage == null || curPage <= 0)
			curPage = 1;
		int index = (curPage - 1) * PAGE_SIZE;
		model.addAttribute("curPage", curPage);
		Map<String, Integer> map = new HashMap<String, Integer>();
		int bloggerId = Integer.parseInt(request.getSession().getAttribute("bloggerId_back").toString());
		int count = articleService.getDelectedCount(bloggerId);
		map.put("bloggerId", bloggerId);
		map.put("index", index);
		map.put("pageSize", PAGE_SIZE);
		List<Article> list = articleService.gettBaseOrderByTimeDeleted(map);
		model.addAttribute("articles", list);
		model.addAttribute("count", count);
		return "recyclebin";
	}
	@RequestMapping(value="recover.do")
	public String recover(HttpServletResponse response, Integer articleId){
		articleService.coverById(articleId);
		return "redirect:recyclebin.do";
	}
	@RequestMapping(value="deleteforever.do")
	public String deleteforever(HttpServletResponse response, Integer articleId){
		commentService.deleteByArticleId(articleId);
		articleService.deleteById(articleId);
		return "redirect:recyclebin.do";
	}
}
