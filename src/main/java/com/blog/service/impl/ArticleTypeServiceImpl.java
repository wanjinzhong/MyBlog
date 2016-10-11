package com.blog.service.impl;

import java.util.List;
import java.util.Map;

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

	public List<ArticleType> getByBloggerId(Map<String, Integer> map) {
		return articleTypeMapper.selectByBloggerId(map);
	}

	public int updateByIdSelective(ArticleType articleType) {
		return articleTypeMapper.updateByPrimaryKeySelective(articleType);
	}

	public int insertSelective(ArticleType articleType) {
		return articleTypeMapper.insertSelective(articleType);
	}

	public ArticleType getByBloggerIdAndDefault(Integer bloggerId) {
		return articleTypeMapper.selectByBloggerIdAndIsDefault(bloggerId);
	}

	public int deleteById(Integer typeId) {
		return articleTypeMapper.deleteByPrimaryKey(typeId);
	}
	
}
