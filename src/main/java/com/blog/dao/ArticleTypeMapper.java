package com.blog.dao;

import java.util.List;
import java.util.Map;

import com.blog.bean.ArticleType;

public interface ArticleTypeMapper {
    int deleteByPrimaryKey(Integer typeId);

    int insert(ArticleType record);

    int insertSelective(ArticleType record);

    ArticleType selectByPrimaryKey(Integer typeId);

    int updateByPrimaryKeySelective(ArticleType record);

    int updateByPrimaryKey(ArticleType record);
    
    List<ArticleType> selectByBloggerId(Map<String, Integer> map);
    
    ArticleType selectByBloggerIdAndIsDefault(Integer bloggerId);
}