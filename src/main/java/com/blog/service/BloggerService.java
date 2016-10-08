package com.blog.service;

import com.blog.bean.Blogger;

public interface BloggerService {
	public Blogger getBloggerById(Integer id);
	
	int regist(Blogger blogger);
	
	Blogger getByUserId(Integer userId);
}
