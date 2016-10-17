package com.blog.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.ui.Model;

import com.blog.bean.Article;
import com.blog.bean.ArticleFull;
import com.blog.bean.ArticleType;
import com.blog.service.ArticleService;
import com.blog.service.ArticleTypeService;

public class FrontUtil {
	/**
	 * 初始化博主Id
	 * 
	 * @param request
	 *            请求
	 * @param bloggerId
	 *            博主id 可为空
	 * @return 初始化的不为空的博主id
	 */
	public static Integer initBloggerId(HttpServletRequest request, Integer bloggerId) {
		if (bloggerId == null || bloggerId <= 0) {
			if (request.getSession().getAttribute("bloggerId") != null) {
				bloggerId = Integer.parseInt(request.getSession().getAttribute("bloggerId").toString());
			} else
				bloggerId = 1;
		}
		request.getSession().setAttribute("bloggerId", bloggerId);
		return bloggerId;
	}
	/**
	 * 将文章缩略信息格式化
	 * 
	 * @param list
	 *            文章信息
	 * @param picList
	 *            保存每篇文章的封面图
	 */
	public static void formatInfo(List<ArticleFull> list) {
		for (int i = 0; i < list.size(); i++) {
			Document doc = Jsoup.parse(list.get(i).getContent());
			doc.select("img").remove();
			String content = null;
			if (doc.toString().length() > 147) {
				content = doc.toString().substring(0, 147) + "...";
			}
			list.get(i).setContent(content);
		}
	}
	/**
	 * 获取最新的文章标题和分类
	 * 
	 * @param model
	 *            要返回给视图的model
	 */
	public static void getNewAndType(ArticleTypeService articleTypeService, ArticleService articleService, Integer bloggerId, Model model) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("bloggerId", bloggerId);
		// 获取文章分类总数
		int typeCount = articleTypeService.getByBloggerId(map).size();
		map.put("index", 0);
		map.put("pageSize", 5);
		// 获取最新文章标题
		List<Article> newest = articleService.getAritcleBaseOrderByUpdateTime(map);
		model.addAttribute("newest", newest);
		// 获取文章分类
		List<ArticleType> types = articleTypeService.getByBloggerId(map);
		model.addAttribute("types", types);
		model.addAttribute("typeCount", typeCount);
	}
}
