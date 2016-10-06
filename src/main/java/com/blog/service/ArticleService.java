package com.blog.service;

import java.util.List;
import java.util.Map;

import com.blog.bean.Article;
import com.blog.bean.ArticleFull;

public interface ArticleService {
	/**
	 * 根据ID获取文章
	 * @param id 文章ID
	 * @return 一篇基本文章
	 */
	public Article getArticleById(Integer id);
	/**
	 * 获取所有文章
	 * @return 文章详细集合
	 */
	public List<ArticleFull> getAll();
	/**
	 * 根据Id获取一篇文章
	 * @param id 文章id
	 * @return 文章详细
	 */
	public ArticleFull getArticleFullById(Integer id);
	
	/**
	 * 更新文章的阅读量
	 * @param map （文章Id,阅读量）
	 * @return 更新条数
	 */
	public int updateReadingById(Map<String, Integer> map);
	/**
	 * 获取文章基本信息，以更新时间排序
	 * @return 基本文章集合
	 */
	public List<Article> getAritcleBaseOrderByUpdateTime();
	/**
	 * 获取文章基本信息，以阅读量排序
	 * @return 基本文章集合
	 */
	public List<Article> getArticleBaseOrderByReading();
	
	public Article getArticleBaseById(Integer id);
	
	/**
	 * 获取某个博主的文章总数
	 * @param id 博主id
	 * @return 该博主的文章总数
	 */
	public int getCount(Integer id);
}
