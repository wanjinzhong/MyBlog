package com.blog.controller.front;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.bean.Article;
import com.blog.bean.ArticleFull;
import com.blog.bean.ArticleType;
import com.blog.bean.Blogger;
import com.blog.bean.CommentFull;
import com.blog.service.ArticleService;
import com.blog.service.ArticleTypeService;
import com.blog.service.BloggerService;
import com.blog.service.CommentService;
import com.blog.util.FrontUtil;

@Controller
public class ArticleController {
	public static final int PAGE_SIZE = 8;
	public static final int BACK_PAGE_SIZE = 10;
	@Resource
	private ArticleService articleService;
	@Resource
	private CommentService commentService;
	@Resource
	private BloggerService bloggerService;
	@Resource
	private ArticleTypeService articleTypeService;
	@RequestMapping(value = "index.shtml")
	public String index(HttpServletRequest request, Integer bloggerId, Model model) {
		bloggerId = FrontUtil.initBloggerId(request, bloggerId);
		Blogger blogger = bloggerService.getBloggerById(bloggerId);
		request.getSession().setAttribute("bloggerName", blogger.getBloggerName());
		List<ArticleFull> list = articleService.getTopFive(bloggerId);
		FrontUtil.formatInfo(list);
		model.addAttribute("blogger", blogger);
		model.addAttribute("list", list);
		FrontUtil.getNewAndType(articleTypeService,articleService,bloggerId, model);
		return "index";
	}

	@RequestMapping(value = "article.shtml")
	public String getArticle(Integer id, Integer bloggerId, Integer curPage, HttpServletRequest request, Model model) {
		bloggerId = FrontUtil.initBloggerId(request, bloggerId);
		if (id == null || id == 0)
			return "redirect:index.shtml";
		if (curPage == null || curPage <= 0)
			curPage = 1;
		model.addAttribute("curPage", curPage);
		request.getSession().setAttribute("articleId", id);
		// 获取文章内容
		ArticleFull article = articleService.getArticleFullById(id);
		int reading = article.getReading();
		model.addAttribute("article", article);
		FrontUtil.getNewAndType(articleTypeService,articleService,bloggerId, model);
		prevAndNext(request, id, model);
		// 获取评论数
		getCommentCount(id, model);
		// 获取评论列表
		getComments(id, curPage, model);
		// 更新阅读量
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("reading", reading + 1);
		map.put("articleId", article.getArticleId());
		articleService.updateReadingById(map);
		return "article";
	}

	@RequestMapping(value = "allarticles.shtml")
	public String getAllArticle(HttpServletRequest request, Integer curPage, Integer bloggerId, Model model) {
		bloggerId = FrontUtil.initBloggerId(request, bloggerId);
		int count = articleService.getCount(bloggerId);
		model.addAttribute("count", count);
		Blogger blogger = bloggerService.getFullById(bloggerId);
		request.getSession().setAttribute("bloggerName", blogger.getBloggerName());
		if (curPage == null || curPage <= 0)
			curPage = 1;
		model.addAttribute("curPage", curPage);
		int index = (curPage - 1) * PAGE_SIZE;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("bloggerId", bloggerId);
		map.put("index", index);
		map.put("pageSize", PAGE_SIZE);
		List<ArticleFull> list = articleService.getAllOrderByTime(map);
		FrontUtil.formatInfo(list);
		model.addAttribute("list", list);
		model.addAttribute("blogger", blogger);
		FrontUtil.getNewAndType(articleTypeService,articleService,bloggerId, model);
		return "allarticles";
	}

	/**
	 * 获取上一篇和下一篇的链接
	 * 
	 * @param id
	 *            本页文章id
	 * @param model
	 *            要返回给视图的model
	 */
	public void prevAndNext(HttpServletRequest request, Integer id, Model model) {
		// 获取上一篇和下一篇
		String prev;
		String next;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("articleId", id);
		int bloggerId = Integer.parseInt(request.getSession().getAttribute("bloggerId").toString());
		map.put("bloggerId", bloggerId);
		Article prevArticle = articleService.getPrev(map);
		if (prevArticle == null)
			prev = "<span>没有了</span>";
		else
			prev = "<a href='article.shtml?id=" + prevArticle.getArticleId() + "'>" + prevArticle.getTitle() + "</a>";
		Article nextArticle = articleService.getNext(map);
		if (nextArticle == null)
			next = "<span>没有了</span>";
		else
			next = "<a href='article.shtml?id=" + nextArticle.getArticleId() + "'>" + nextArticle.getTitle() + "</a>";
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
	}



	/**
	 * 获取文章评论数
	 * 
	 * @param id
	 *            文章id
	 * @param model
	 *            要返回给视图的model
	 */
	public void getCommentCount(Integer id, Model model) {
		int count = commentService.getCount(id);
		model.addAttribute("count", count);
	}

	/**
	 * 获取评论列表
	 * 
	 * @param id
	 *            文章id
	 * @param model
	 *            要返回给视图的model
	 */
	public void getComments(Integer id, Integer curPage, Model model) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("id", id);
		int index = (curPage - 1) * PAGE_SIZE;
		map.put("index", index);
		map.put("pageSize", PAGE_SIZE);
		System.out.println("id: " + id + ",index: " + index + ",pageSize: " + PAGE_SIZE);
		List<CommentFull> commentFulls = commentService.getByArticleIdOrderByTime(map);
		System.out.println("评论列表：" + commentFulls.size());
		model.addAttribute("commentList", commentFulls);
	}
	
	@RequestMapping(value="search.shtml")
	public String search(HttpServletRequest request,Integer curPage, String word, Model model){
		int bloggerId = Integer.parseInt(request.getSession().getAttribute("bloggerId").toString());
		model.addAttribute("word", word);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bloggerId", bloggerId);
		int count = articleService.search(map).size();
		model.addAttribute("count", count);
		model.addAttribute("word", word);
		if (curPage == null || curPage <= 0)
			curPage = 1;
		model.addAttribute("curPage", curPage);
		int index = (curPage - 1) * PAGE_SIZE;
		map.put("index", index);
		map.put("pageSize", PAGE_SIZE);
		map.put("word", word);
		List<Article> list = articleService.search(map);
		for(int i = 0; i < list.size(); i ++){
			String title = list.get(i).getTitle().replace(word, "<span style='color: red'>" + word + "</span>");
			list.get(i).setTitle(title);
			String content = list.get(i).getContent();
			int start = content.indexOf(word);
			Document doc = Jsoup.parse(list.get(i).getContent());
			doc.select("img").remove();
			if (start != -1){
				if (start > 70)
					content = content.substring(start - 70);
				System.out.println(content);
				if (start + word.length() + 70 < list.get(i).getContent().length())
					content = content.substring(0, word.length() + 140);
				content = content.replace(word, "<span style='color: red'>" + word + "</span>");
				list.get(i).setContent(content);
			}else{
				if (doc.toString().length() > 147) {
					content = doc.toString().substring(0, 147) + "...";
				}
				list.get(i).setContent(content);
			}
		}
		FrontUtil.getNewAndType(articleTypeService, articleService, bloggerId, model);
		model.addAttribute("list", list);
		return "searchresult";
	}
}
