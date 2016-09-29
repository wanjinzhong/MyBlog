package com.blog.dao;

import com.blog.bean.Blogger;

public interface BloggerMapper {
    int deleteByPrimaryKey(Integer bloggerId);

    int insert(Blogger record);

    int insertSelective(Blogger record);

    Blogger selectByPrimaryKey(Integer bloggerId);

    int updateByPrimaryKeySelective(Blogger record);

    int updateByPrimaryKey(Blogger record);
}