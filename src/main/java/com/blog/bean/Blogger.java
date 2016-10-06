package com.blog.bean;

public class Blogger extends User{
    private Integer bloggerId;

    private String bloggerName;

    private Integer userId;

    public Integer getBloggerId() {
        return bloggerId;
    }

    public void setBloggerId(Integer bloggerId) {
        this.bloggerId = bloggerId;
    }

    public String getBloggerName() {
        return bloggerName;
    }

    public void setBloggerName(String bloggerName) {
        this.bloggerName = bloggerName == null ? null : bloggerName.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}