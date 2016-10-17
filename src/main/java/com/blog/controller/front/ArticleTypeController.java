package com.blog.controller.front;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.bean.ArticleFull;
import com.blog.bean.ArticleType;
import com.blog.bean.Blogger;
import com.blog.service.ArticleService;
import com.blog.service.ArticleTypeService;
import com.blog.service.BloggerService;
import com.blog.util.FrontUtil;

@Controller
public class ArticleTypeController {
	private static final int PAGE_SIZE = 5;
	private static final int TYPE_PAGESIZE = 10;
	@Resource
	private ArticleTypeService articleTypeService;
	@Resource
	private ArticleService articleService;
	@Resource
	private BloggerService bloggerService;
	@RequestMapping(value="articletypecontent.shtml")
	public String articletypecontent(HttpServletRequest request,Integer typeId, Integer curPage, Model model){
		int bloggerId;
		if (request.getSession().getAttribute("bloggerId") == null){
			bloggerId = 1;
		}else{
			bloggerId = Integer.parseInt(request.getSession().getAttribute("bloggerId").toString());
		}
		if (curPage == null || curPage <= 0)
			curPage = 1;
		ArticleType type = articleTypeService.getById(typeId);
		model.addAttribute("curPage", curPage);
		int index = (curPage - 1) * PAGE_SIZE;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("typeId", typeId);
		int count = articleService.getFullByTypeId(map).size();
		model.addAttribute("count", count);
		map.put("index", index);
		map.put("pageSize", PAGE_SIZE);
		List<ArticleFull> list = articleService.getFullByTypeId(map);
		FrontUtil.formatInfo(list);
		model.addAttribute("type", type);
		model.addAttribute("list", list);
		FrontUtil.getNewAndType(articleTypeService, articleService, bloggerId, model);
		return "articletypecontent";
	}
	@RequestMapping(value="articletypes.shtml")
	public String articletypes(HttpServletRequest request,Integer curPage,Model model){
		int bloggerId;
		if (request.getSession().getAttribute("bloggerId") == null){
			bloggerId = 1;
		}else{
			bloggerId = Integer.parseInt(request.getSession().getAttribute("bloggerId").toString());
		}
		if (curPage == null || curPage <= 0)
			curPage = 1;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("bloggerId", bloggerId);
		Blogger blogger = bloggerService.getBloggerById(bloggerId);
		model.addAttribute("blogger", blogger);
		int count = articleTypeService.getByBloggerId(map).size();
		model.addAttribute("count", count);
		List<ArticleType> types = articleTypeService.getByBloggerId(map);
		List<Integer> articleCount = new ArrayList<Integer>();
		for (int i = 0; i < types.size(); i ++){
			articleCount.add(articleService.getByTypeId(types.get(i).getTypeId()).size());
		}
		model.addAttribute("types", types);
		model.addAttribute("articleCount", articleCount);
		FrontUtil.getNewAndType(articleTypeService,articleService,bloggerId, model);
		return "articletypes";
	}
}
