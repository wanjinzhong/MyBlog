package com.blog.bean;

import java.util.Date;

public class Mood {
    private Integer moodId;

    private Integer bloggerId;

    private Date time;

    private String place;

    private Integer moodTypeId;

    private Integer isprivate;

    private String content;

    public Integer getMoodId() {
        return moodId;
    }

    public void setMoodId(Integer moodId) {
        this.moodId = moodId;
    }

    public Integer getBloggerId() {
        return bloggerId;
    }

    public void setBloggerId(Integer bloggerId) {
        this.bloggerId = bloggerId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place == null ? null : place.trim();
    }

    public Integer getMoodTypeId() {
        return moodTypeId;
    }

    public void setMoodTypeId(Integer moodTypeId) {
        this.moodTypeId = moodTypeId;
    }

    public Integer getIsprivate() {
        return isprivate;
    }

    public void setIsprivate(Integer isprivate) {
        this.isprivate = isprivate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}