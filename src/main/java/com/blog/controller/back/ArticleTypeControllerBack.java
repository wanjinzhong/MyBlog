package com.blog.controller.back;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.bean.Article;
import com.blog.bean.ArticleType;
import com.blog.service.ArticleService;
import com.blog.service.ArticleTypeService;

@Controller
public class ArticleTypeControllerBack {
	public static final int PAGE_SIZE = 10;
	@Resource
	private ArticleService articleService;
	@Resource
	private ArticleTypeService articleTypeService;

	@RequestMapping(value = "articletypelist.do")
	public String articletypelist(Integer curPage, HttpServletRequest request, Model model) {
		if (curPage == null || curPage <= 0)
			curPage = 1;
		int index = (curPage - 1) * PAGE_SIZE;
		model.addAttribute("curPage", curPage);
		Map<String, Integer> map = new HashMap<String, Integer>();
		int bloggerId = Integer.parseInt((request.getSession().getAttribute("bloggerId_back").toString()));
		map.put("bloggerId", bloggerId);
		int count = articleTypeService.getByBloggerId(map).size();
		map.put("index", index);
		map.put("pageSize", PAGE_SIZE);
		List<ArticleType> list = articleTypeService.getByBloggerId(map);
		model.addAttribute("count", count);
		model.addAttribute("articleType", list);
		return "articletypelist";
	}
	
	@RequestMapping(value="articleTypeUpdate.do")
	public String articleTypeUpdate(Integer articleId, Model model){
		ArticleType articleType = articleTypeService.getById(articleId);
		model.addAttribute("type", articleType);
		return "articletypeupdate";
	}
	@RequestMapping(value="savearticletype.do")
	public String savearticletype(HttpServletRequest request){
		int bloggerId = Integer.parseInt((request.getSession().getAttribute("bloggerId_back").toString()));
		int typeId = Integer.parseInt(request.getParameter("typeId").toString());
		String typeName = request.getParameter("typeName");
		Date updateTime = new Date();
		String description = request.getParameter("description");
		String isDefault = request.getParameter("default");
		int isDefaultInt;
		if (isDefault.equals("true")){
			isDefaultInt = 1;
			ArticleType type = new ArticleType();
			type.setTypeId(articleTypeService.getByBloggerIdAndDefault(bloggerId).getTypeId());
			type.setIsDefault(0);
			articleTypeService.updateByIdSelective(type);
		}else{
			isDefaultInt = 0;
		}
		ArticleType articleType = new ArticleType();
		articleType.setTypeId(typeId);
		articleType.setTypeName(typeName);
		articleType.setUpdateTime(updateTime);
		articleType.setDescription(description);
		articleType.setIsDefault(isDefaultInt);
		articleTypeService.updateByIdSelective(articleType);
		return "redirect:articletypelist.do";
	}
	@RequestMapping(value="deletearticleType.do")
	public String deletearticleType(HttpServletRequest request, Integer typeId, Integer curPage){
		int bloggerId = Integer.parseInt(request.getSession().getAttribute("bloggerId_back").toString());
		//得到该分类下的所有文章
		List<Article> articleList = articleService.getByTypeId(typeId);
		//获得默认分类的id
		ArticleType defaultArticleType = articleTypeService.getByBloggerIdAndDefault(bloggerId);
		//移动文章到默认分类
		for (int i = 0; i < articleList.size(); i ++){
			articleList.get(i).setTypeId(defaultArticleType.getTypeId());
			articleService.updateByIdSelective(articleList.get(i));
		}
		//删除分类
		articleTypeService.deleteById(typeId);
		return "redirect:articletypelist.do?curPage=" + curPage;
	}
	
	@RequestMapping(value="addarticletype.do")
	public String addarticletype(HttpServletRequest request){
		int bloggerId = Integer.parseInt(request.getSession().getAttribute("bloggerId_back").toString());
		String typeName = request.getParameter("typeName");
		String descript = request.getParameter("descript");
		ArticleType type = new ArticleType();
		type.setBloggerId(bloggerId);
		type.setDescription(descript);
		type.setIsDefault(0);
		type.setPublishTime(new Date());
		type.setUpdateTime(new Date());
		type.setTypeName(typeName);
		articleTypeService.insertSelective(type);
		return "redirect:articletypelist.do";
	}
}
