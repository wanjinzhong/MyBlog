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
    
    List<ArticleFull> selectAllOrderByReading(Integer bloggerId);

	ArticleFull selectFullByPrimaryKey(Integer id);

	int updateReadingByPrimaryKey(Map<String, Integer> map);

	List<Article> selectAllOrderByUpdateTime(Map<String, Integer> map);
	
	List<Article> selectBaseOrderByReading(Map<String, Integer> map);
	
	Article selectBaseByPrimaryKey(Integer id);
	
	/**
	 * 获取某个博主的文章总数
	 * @param id 博主id
	 * @return 该博主的文章总数
	 */
	int seclectCount(Integer id);
	/**
	 * 获取上一篇文章信息
	 * @param map 包含本篇id的博主id
	 * @return 上一篇文章信息
	 */
	Article selectBasePrev(Map<String, Integer> map);
	
	/**
	 * 获取下一篇文章信息
	 * @param map 包含本篇id的博主id
	 * @return 下一篇文章信息
	 */
	Article selectBaseNext(Map<String, Integer> map);
	/**
	 * 获取以时间排序的博主文章
	 * @param bloggerId 博主id
	 * @return 文章列表
	 */
	List<ArticleFull> selectAllOrderByTime(Map<String, Integer> map);
}