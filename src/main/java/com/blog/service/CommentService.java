package com.blog.service;

import java.util.List;
import java.util.Map;

import com.blog.bean.Comment;
import com.blog.bean.CommentFull;

public interface CommentService {
	/**
	 * 根据文章ID获取评论，并按时间排序
	 * @param id 文章ID
	 * @return 评论列表
	 */
	public List<CommentFull> getByArticleIdOrderByTime(Map<String,Integer> map);
	
	/**
	 * 获取文章的所有评论数
	 * @param id 文章id
	 * @return 文章的所有评论数
	 */
	public int getCount(Integer id);
	
	/**
	 * 插入评论
	 * @param comment 一条评论
	 * @return 影响条数
	 */
	public int insertSelective(Comment comment);

	/**
	 * 删除指定文章的所有评论
	 * 
	 * @param articleId
	 *            文章id
	 * @return 影响行数
	 */
	public int deleteByArticleId(Integer articleId);
	/**
	 * 查找指定博主的未读评论
	 * @param map 包含博主id，起始数和页数
	 * @return 未读评论列表
	 */
	public List<CommentFull> gettFullbyBloggerIdUnread(Map<String, Integer> map);
	/**
	 * 查找指定博主的全部评论
	 * @param map 包含博主id，起始数和页数
	 * @return 全部评论列表
	 */
	public List<CommentFull> getFullbyBloggerId(Map<String, Integer> map);
	/**
	 * 查找指定博主的全部评论数
	 * @param bloggerId
	 * @return
	 */
	Integer getCountbyBloggerId(Integer bloggerId);
	/**
	 * 查找指定博主的未读评论数
	 * @param bloggerId
	 * @return
	 */
	Integer getCountbyBloggerIdWhichIsUnread(Integer blogger);
	/**
	 * 根据评论id返回评论详情
	 * @param commentId 评论id
	 * @return 评论详情
	 */
	public CommentFull getFullById(Integer commentId);
	
	public int updateSelective(Comment comment);
	
	public int deleteById(Integer commentId);
}
