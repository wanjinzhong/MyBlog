package com.blog.service;

import java.util.List;
import java.util.Map;

import com.blog.bean.Article;
import com.blog.bean.ArticleFull;

public interface ArticleService {
	/**
	 * 根据ID获取文章
	 * 
	 * @param id
	 *            文章ID
	 * @return 一篇基本文章
	 */
	public Article getArticleById(Integer id);

	/**
	 * 获取所有文章
	 * 
	 * @param bloggerId
	 *            博主Id
	 * @return 文章详细集合
	 */
	public List<ArticleFull> getTopFive(Integer bloggerId);

	/**
	 * 根据Id获取一篇文章
	 * 
	 * @param id
	 *            文章id
	 * @return 文章详细
	 */
	public ArticleFull getArticleFullById(Integer id);

	/**
	 * 更新文章的阅读量
	 * 
	 * @param map
	 *            （文章Id,阅读量）
	 * @return 更新条数
	 */
	public int updateReadingById(Map<String, Integer> map);

	/**
	 * 获取文章基本信息，以更新时间排序
	 * 
	 * @return 基本文章集合
	 */
	public List<Article> getAritcleBaseOrderByUpdateTime(Map<String, Integer> map);

	/**
	 * 获取文章基本信息，以阅读量排序
	 * 
	 * @return 基本文章集合
	 */
	public List<Article> getArticleBaseOrderByReading(Map<String, Integer> map);

	public Article getArticleBaseById(Integer id);

	/**
	 * 获取某个博主的文章总数
	 * 
	 * @param id
	 *            博主id
	 * @return 该博主的文章总数
	 */
	public int getCount(Integer id);

	/**
	 * 获取上一篇文章信息
	 * 
	 * @param map
	 *            包含本篇id的博主id
	 * @return 上一篇文章信息
	 */
	public Article getPrev(Map<String, Integer> map);

	/**
	 * 获取下一篇文章信息
	 * 
	 * @param map
	 *            包含本篇id的博主id
	 * @return 下一篇文章信息
	 */
	public Article getNext(Map<String, Integer> map);

	public List<ArticleFull> getAllOrderByTime(Map<String, Integer> map);

	/**
	 * 获取以时间排序的文章基本信息列表
	 * 
	 * @param map
	 *            包含博主id,起始条数，每页条数
	 * @return 文章列表
	 */
	public List<Article> getBaseOrderByTime(Map<String, Integer> map);

	/**
	 * 伪删除一篇文章（设置is_delete为1）
	 * 
	 * @param articleId
	 *            文章id
	 * @return 影响行数
	 */
	public int setDeleteById(Integer articleId);

	public int coverById(Integer articleId);

	/**
	 * 获取以时间排序的已删除的文章基本信息列表
	 * 
	 * @param map
	 *            包含博主id,起始条数，每页条数
	 * @return 文章列表
	 */
	public List<Article> gettBaseOrderByTimeDeleted(Map<String, Integer> map);

	/**
	 * 获取博主的回收站的文章总数
	 * 
	 * @param id
	 *            博主id
	 * @return 该博主的回收站的文章总数
	 */
	public int getDelectedCount(Integer id);
	/**
	 * 彻底删除文章
	 * @param articleId 文章Id
	 * @return 影响行数
	 */
	public int deleteById(Integer articleId);
	/**
	 * 根据类型id获取文章列表
	 * @param typeId 类型id
	 * @return 文章列表
	 */
	public List<Article> getByTypeId(Integer typeId);
	
	public int updateByIdSelective(Article article);
	
	public int insertSelective(Article article);
	
	public List<ArticleFull> getFullByTypeId(Map<String, Integer> map);
	/**
	 * 分页方式获取搜索结果
	 * @param map 包含博主id,搜索内容，起始条数，每页条数
	 * @return 文章列表
	 */
	List<Article> search(Map<String, Object> map);
}
