package com.blog.service;

import java.util.List;
import java.util.Map;

import com.blog.bean.ArticleType;

public interface ArticleTypeService {
	ArticleType getById(Integer typeId);

	List<ArticleType> getByBloggerId(Map<String, Integer> map);

	int updateByIdSelective(ArticleType articleType);
	
	int insertSelective(ArticleType articleType);
	
	ArticleType getByBloggerIdAndDefault(Integer bloggerId);
	
	int deleteById(Integer typeId);
}
