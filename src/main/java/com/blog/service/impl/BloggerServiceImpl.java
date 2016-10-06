package com.blog.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.bean.Blogger;
import com.blog.dao.BloggerMapper;
import com.blog.service.BloggerService;

@Service
public class BloggerServiceImpl implements BloggerService {
	@Resource
	private BloggerMapper bloggerMapper;
	public Blogger getBloggerById(Integer id) {
		// TODO Auto-generated method stub
		return bloggerMapper.selectFullByPrimaryKey(id);
	}

}
