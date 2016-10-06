package com.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.bean.CommentFull;
import com.blog.dao.CommentMapper;
import com.blog.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Resource
	private CommentMapper commentMapper;
	
	public List<CommentFull> getByArticleIdOrderByTime(Map<String,Integer> map) {
		return commentMapper.selectFullbyArticleId(map);
	}

	public int getCount(Integer id) {
		// TODO Auto-generated method stub
		return commentMapper.selectCount(id);
	}

}
