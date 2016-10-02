package com.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.bean.Article;
import com.blog.bean.ArticleFull;
import com.blog.bean.CommentFull;
import com.blog.service.ArticleService;
import com.blog.service.CommentService;

@Controller
public class ArticleController {
	@Resource
	private ArticleService articleService;
	@Resource
	private CommentService commentService;
	@RequestMapping(value = "index.do")
	public String index(Model model) {
		List<ArticleFull> list = articleService.getAll();
		for (int i = 0; i < list.size(); i++) {
			Document doc = Jsoup.parse(list.get(i).getContent());
			doc.select("img").remove();
			String content = doc.toString().substring(0, 150);
			list.get(i).setContent(content);
		}
		model.addAttribute("list", list);
		getNewAndHot(model);
		return "front/index";
	}

	@RequestMapping(value = "article.do")
	public String getArticle(Integer id, Model model) {
		if (id == null || id == 0)
			return "redirect:index.do";
		// 获取文章内容
		ArticleFull article = articleService.getArticleFullById(id);
		int reading = article.getReading();
		model.addAttribute("article", article);
		getNewAndHot(model);
		prevAndNext(id, model);
		//获取评论列表
		getComments(id, model);
		// 更新阅读量
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("reading", reading + 1);
		map.put("articleId", article.getArticleId());
		articleService.updateReadingById(map);
		return "front/article";
	}

	/**
	 * 获取上一篇和下一篇的链接
	 * 
	 * @param id
	 *            本页文章id
	 * @param model
	 *            要返回给视图的model
	 */
	public void prevAndNext(Integer id, Model model) {
		// 获取上一篇和下一篇
		String prev;
		String next;
		Article prevArticle = articleService.getArticleBaseById(id - 1);
		if (prevArticle == null)
			prev = "<span>没有了</span>";
		else
			prev = "<a href='article.do?id=" + prevArticle.getArticleId() + "'>" + prevArticle.getTitle() + "</a>";
		Article nextArticle = articleService.getArticleBaseById(id + 1);
		if (nextArticle == null)
			next = "<span>没有了</span>";
		else
			next = "<a href='article.do?id=" + nextArticle.getArticleId() + "'>" + nextArticle.getTitle() + "</a>";
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
	}

	/**
	 * 获取最新和最热的文章标题
	 * 
	 * @param model
	 *            要返回给视图的model
	 */
	public void getNewAndHot(Model model) {
		// 获取最新文章标题
		List<Article> newest = articleService.getAritcleBaseOrderByUpdateTime();
		model.addAttribute("newest", newest);
		// 获取最热文章标题
		List<Article> hotest = articleService.getArticleBaseOrderByReading();
		model.addAttribute("hotest", hotest);
	}
	/**
	 * 获取评论列表
	 * @param id 文章id
	 * @param model 要返回给视图的model
	 */
	private void getComments(Integer id, Model model){
		List<CommentFull> commentFulls = commentService.getByArticleIdOrderByTime(id);
		model.addAttribute("commentList", commentFulls);
	}
}
