package com.blog.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.bean.ArticleType;
import com.blog.dao.ArticleTypeMapper;
import com.blog.service.ArticleTypeService;
@Service
public class ArticleTypeServiceImpl implements ArticleTypeService {
	@Resource
	private ArticleTypeMapper articleTypeMapper;
	
	public ArticleType getById(Integer typeId) {
		return articleTypeMapper.selectByPrimaryKey(typeId);
	}

}
