package com.blog.controller.back;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.bean.Comment;
import com.blog.bean.CommentFull;
import com.blog.service.CommentService;

@Controller
public class CommentControllerBack {
	public static final int PAGE_SIZE = 10;
	@Resource
	private CommentService commentService;

	@RequestMapping(value = "unreadcomment.do")
	public String unreadComment(Integer curPage, HttpServletRequest request, Model model) {
		curPage = getCurPage(curPage, model);
		int index = (curPage - 1) * PAGE_SIZE;
		Map<String, Integer> map = new HashMap<String, Integer>();
		int bloggerId = Integer.parseInt(request.getSession().getAttribute("bloggerId_back").toString());
		map.put("bloggerId", bloggerId);
		map.put("index", index);
		map.put("pageSize",PAGE_SIZE);
		int count = commentService.getCountbyBloggerIdWhichIsUnread(bloggerId);
		List<CommentFull> list = commentService.gettFullbyBloggerIdUnread(map);
		formatContent(list);
		model.addAttribute("curPage", curPage);
		model.addAttribute("comments", list);
		model.addAttribute("count", count);
		return "unreadcomment";
	}

	@RequestMapping(value = "allcomment.do")
	public String allcomment(Integer curPage, HttpServletRequest request, Model model) {
		curPage = getCurPage(curPage, model);
		int index = (curPage - 1) * PAGE_SIZE;
		Map<String, Integer> map = new HashMap<String, Integer>();
		int bloggerId = Integer.parseInt(request.getSession().getAttribute("bloggerId_back").toString());
		map.put("bloggerId", bloggerId);
		map.put("index", index);
		map.put("pageSize",PAGE_SIZE);
		int count = commentService.getCountbyBloggerId(bloggerId);
		List<CommentFull> list = commentService.getFullbyBloggerId(map);
		formatContent(list);
		model.addAttribute("curPage", curPage);
		model.addAttribute("comments", list);
		model.addAttribute("count", count);
		return "allcomment";
	}

	public void formatContent(List<CommentFull> list) {
		for (int i = 0; i < list.size(); i ++){
			if (list.get(i).getCommentContent().length() > 50)
				list.get(i).setCommentContent(list.get(i).getCommentContent().substring(0, 50));
		}
	}

	public Integer getCurPage(Integer curPage, Model model) {
		if (curPage == null || curPage <= 0)
			curPage = 1;
		model.addAttribute("curPage", curPage);
		return curPage;
	}
	@RequestMapping(value="commentdetail.do")
	public String commentdetail(Integer commentId, Model model){
		CommentFull comment = commentService.getFullById(commentId);
		model.addAttribute("comment", comment);
		readed(commentId);
		return "commentdetail";
	}
	@RequestMapping(value="commentignore.do")
	public String commentignore(Integer commentId, Model model){
		readed(commentId);
		return "redirect:unreadcomment.do";
	}
	public void readed(Integer commentId){
		Comment comment = new Comment();
		comment.setCommentId(commentId);
		comment.setIsNew(0);
		commentService.updateSelective(comment);
	}
	@RequestMapping(value="deletecomment.do")
	public String deletecomment(Integer commentId, Model model){
		System.out.println(commentId);
		commentService.deleteById(commentId);
		return "redirect:allcomment.do";
	}
}
