package com.blog.dao;

import java.util.List;
import java.util.Map;

import com.blog.bean.Article;
import com.blog.bean.ArticleFull;

public interface ArticleMapper {
	int deleteByPrimaryKey(Integer articleId);

	int insert(Article record);

	int insertSelective(Article record);

	Article selectByPrimaryKey(Integer articleId);

	int updateByPrimaryKeySelective(Article record);

	int updateByPrimaryKeyWithBLOBs(Article record);

	int updateByPrimaryKey(Article record);

	List<ArticleFull> selectAllOrderByReading();

	ArticleFull selectFullByPrimaryKey(Integer id);

	int updateReadingByPrimaryKey(Map<String, Integer> map);

	List<Article> selectAllOrderByUpdateTime();
	
	List<Article> selectBaseOrderByReading();
	
	Article selectBaseByPrimaryKey(Integer id);
	
	/**
	 * 获取某个博主的文章总数
	 * @param id 博主id
	 * @return 该博主的文章总数
	 */
	int seclectCount(Integer id);
	
}