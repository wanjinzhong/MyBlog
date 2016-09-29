package com.blog.dao;

import com.blog.bean.MoodType;

public interface MoodTypeMapper {
    int deleteByPrimaryKey(Integer moodTypeId);

    int insert(MoodType record);

    int insertSelective(MoodType record);

    MoodType selectByPrimaryKey(Integer moodTypeId);

    int updateByPrimaryKeySelective(MoodType record);

    int updateByPrimaryKey(MoodType record);
}