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
}