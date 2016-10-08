package com.blog.controller.front;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.bean.Comment;
import com.blog.service.CommentService;

@Controller
public class CommentController {
	@Resource
	private CommentService commentService;
	@RequestMapping(value="addcomment.shtml")
	public String addComment(String comment_content,HttpServletRequest request){
		Integer articleId = Integer.parseInt(request.getSession().getAttribute("articleId").toString());
		Comment comment = new Comment();
		comment.setCommentContent(comment_content);
		comment.setArticleId(articleId);
		comment.setTime(new Date());
		comment.setUserId(Integer.parseInt(request.getSession().getAttribute("userId").toString()));
		commentService.insertSelective(comment);
		return "redirect:article.shtml?id=" + articleId;
	}

}
