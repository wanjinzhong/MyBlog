package com.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.bean.CommentFull;
import com.blog.dao.CommentMapper;
import com.blog.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Resource
	private CommentMapper commentMapper;
	
	public List<CommentFull> getByArticleIdOrderByTime(Integer id) {
		return commentMapper.selectFullbyArticleIdOrderByTime(id);
	}

}
