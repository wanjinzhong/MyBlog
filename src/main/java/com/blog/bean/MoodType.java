package com.blog.bean;

public class MoodType {
    private Integer moodTypeId;

    private String name;

    private String picUrl;

    public Integer getMoodTypeId() {
        return moodTypeId;
    }

    public void setMoodTypeId(Integer moodTypeId) {
        this.moodTypeId = moodTypeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPicUrl() {
        return picUrl;
    }

    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl == null ? null : picUrl.trim();
    }
}