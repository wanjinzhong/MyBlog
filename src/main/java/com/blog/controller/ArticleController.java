package com.blog.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.bean.Article;
import com.blog.bean.ArticleFull;
import com.blog.bean.Blogger;
import com.blog.bean.CommentFull;
import com.blog.service.ArticleService;
import com.blog.service.BloggerService;
import com.blog.service.CommentService;

@Controller
public class ArticleController {
	public static final int PAGE_SIZE = 8;
	@Resource
	private ArticleService articleService;
	@Resource
	private CommentService commentService;
	@Resource
	private BloggerService bloggerService;
	
	@RequestMapping(value = "index.do")
	public String index(HttpServletRequest request,Integer bloggerId,Model model) {
		bloggerId = initBloggerId(request, bloggerId);
		Blogger blogger = bloggerService.getBloggerById(bloggerId);
		request.getSession().setAttribute("bloggerName", blogger.getBloggerName());
		List<ArticleFull> list = articleService.getAll(bloggerId);
		List<String> picList = new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) {
			Document doc = Jsoup.parse(list.get(i).getContent());
			Element pic = doc.select("img").first();
			String url = null;
			if(pic != null){
				url = pic.toString();
				//提取封面图
				//正则表达式去除空格
				url = url.replace("\\s+", "");
				int start = url.indexOf("src=\"");
				int end = url.indexOf("\"", start + 5);
				url = url.substring(start + 5, end);
				picList.add(url);
			}
			doc.select("img").remove();
			String content = doc.toString().substring(0, 150);
			list.get(i).setContent(content);
		}
		model.addAttribute("list", list);
		model.addAttribute("picList", picList);
		getNewAndHot(bloggerId,model);
		return "front/index";
	}

	/**
	 * 初始化博主Id
	 * @param request 请求
	 * @param bloggerId 博主id 可为空
	 * @return 初始化的不为空的博主id
	 */
	public Integer initBloggerId(HttpServletRequest request, Integer bloggerId) {
		if (bloggerId == null || bloggerId <= 0){
			if (request.getSession().getAttribute("bloggerId") != null){
				bloggerId =  Integer.parseInt(request.getSession().getAttribute("bloggerId").toString());
			}
			else bloggerId = 1;
		}
		request.getSession().setAttribute("bloggerId", bloggerId);
		return bloggerId;
	}

	@RequestMapping(value = "article.do")
	public String getArticle(Integer id,Integer bloggerId, Integer curPage,HttpServletRequest request, Model model) {
		bloggerId = initBloggerId(request, bloggerId);
		if (id == null || id == 0)
			return "redirect:index.do";
		if (curPage == null || curPage <= 0)
			curPage = 1;
		model.addAttribute("curPage", curPage);
		request.getSession().setAttribute("articleId", id);
		// 获取文章内容
		ArticleFull article = articleService.getArticleFullById(id);
		int reading = article.getReading();
		model.addAttribute("article", article);
		getNewAndHot(bloggerId, model);
		prevAndNext(request,id, model);
		//获取评论数
		getCommentCount(id, model);
		//获取评论列表
		getComments(id,curPage, model);
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
	public void prevAndNext(HttpServletRequest request,Integer id, Model model) {
		// 获取上一篇和下一篇
		String prev;
		String next;
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("articleId", id);
		int bloggerId = Integer.parseInt(request.getSession().getAttribute("bloggerId").toString());
		map.put("bloggerId", bloggerId);
		Article prevArticle = articleService.getPrev(map);
		if (prevArticle == null)
			prev = "<span>没有了</span>";
		else
			prev = "<a href='article.do?id=" + prevArticle.getArticleId() + "'>" + prevArticle.getTitle() + "</a>";
		Article nextArticle = articleService.getNext(map);
		if (nextArticle == null)
			next = "<span>没有了</span>";
		else
			next = "<a href='article.do?id=" + nextArticle.getArticleId() + "'>" + nextArticle.getTitle() + "</a>";
		System.out.println(id);
		System.out.println(prev);
		System.out.println(next);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
	}

	/**
	 * 获取最新和最热的文章标题
	 * 
	 * @param model
	 *            要返回给视图的model
	 */
	public void getNewAndHot(Integer bloggerId,Model model) {
		// 获取最新文章标题
		List<Article> newest = articleService.getAritcleBaseOrderByUpdateTime(bloggerId);
		model.addAttribute("newest", newest);
		// 获取最热文章标题
		List<Article> hotest = articleService.getArticleBaseOrderByReading(bloggerId);
		model.addAttribute("hotest", hotest);
	}
	/**
	 * 获取文章评论数
	 * @param id 文章id
	 * @param model 要返回给视图的model
	 */
	public void getCommentCount(Integer id, Model model){
		int count = commentService.getCount(id);
		model.addAttribute("count", count);
	}
	/**
	 * 获取评论列表
	 * @param id 文章id
	 * @param model 要返回给视图的model
	 */
	private void getComments(Integer id, Integer curPage, Model model){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("id", id);
		int index = (curPage - 1) * PAGE_SIZE;
		map.put("index", index);
		map.put("pageSize", PAGE_SIZE);
		List<CommentFull> commentFulls = commentService.getByArticleIdOrderByTime(map);
		model.addAttribute("commentList", commentFulls);
	}
}
