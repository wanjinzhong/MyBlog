package com.blog.dao;

import com.blog.bean.Mood;

public interface MoodMapper {
    int deleteByPrimaryKey(Integer moodId);

    int insert(Mood record);

    int insertSelective(Mood record);

    Mood selectByPrimaryKey(Integer moodId);

    int updateByPrimaryKeySelective(Mood record);

    int updateByPrimaryKeyWithBLOBs(Mood record);

    int updateByPrimaryKey(Mood record);
}