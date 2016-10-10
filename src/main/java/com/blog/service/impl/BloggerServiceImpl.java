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
		return bloggerMapper.selectFullByPrimaryKey(id);
	}
	public int regist(Blogger blogger) {
		return bloggerMapper.insertSelective(blogger);
	}
	public Blogger getByUserId(Integer userId) {
		return bloggerMapper.selectBaseByUserId(userId);
	}
	public int updateSelective(Blogger blogger) {
		return bloggerMapper.updateByPrimaryKey(blogger);
	}

}
