package com.blog.dao;

import java.util.List;
import java.util.Map;

import com.blog.bean.Comment;
import com.blog.bean.CommentFull;

public interface CommentMapper {
	int deleteByPrimaryKey(Integer commentId);

	int insert(Comment record);

	int insertSelective(Comment record);

	Comment selectByPrimaryKey(Integer commentId);

	int updateByPrimaryKeySelective(Comment record);

	int updateByPrimaryKeyWithBLOBs(Comment record);

	int updateByPrimaryKey(Comment record);

	List<CommentFull> selectFullbyArticleId(Map<String, Integer> map);

	int selectCount(Integer id);

	/**
	 * 删除指定文章的所有评论
	 * 
	 * @param articleId
	 *            文章id
	 * @return 影响行数
	 */
	int deleteByArticleId(Integer articleId);
	/**
	 * 查找指定博主的未读评论
	 * @param map 包含博主id，起始数和页数
	 * @return 未读评论列表
	 */
	List<CommentFull> selectFullbyBloggerIdWhichIsUnread(Map<String, Integer> map);
	/**
	 * 查找指定博主的全部评论
	 * @param map 包含博主id，起始数和页数
	 * @return 未读评论列表
	 */
	List<CommentFull> selectFullbyBloggerId(Map<String, Integer> map);
	/**
	 * 查找指定博主的全部评论数
	 * @param bloggerId
	 * @return
	 */
	Integer selectCountbyBloggerId(Integer bloggerId);
	/**
	 * 查找指定博主的未读评论数
	 * @param bloggerId
	 * @return
	 */
	Integer selectCountbyBloggerIdWhichIsUnread(Integer blogger);
	/**
	 * 根据评论id返回评论详情
	 * @param commentId 评论id
	 * @return 评论详情
	 */
	CommentFull selectFullById(Integer commentId);
}