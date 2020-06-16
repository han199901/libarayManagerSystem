package com.library.pojo;

import java.util.Date;

public class Announcement {
    int id;
    int user_account;
    String content;
    Date start_time;
    Date end_time;

    @Override
    public String toString() {
        return "Announcement{" +
                "id=" + id +
                ", user_account=" + user_account +
                ", content='" + content + '\'' +
                ", start_time=" + start_time +
                ", end_time=" + end_time +
                '}';
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUser_account(int user_account) {
        this.user_account = user_account;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }

    public int getId() {
        return id;
    }

    public int getUser_account() {
        return user_account;
    }

    public String getContent() {
        return content;
    }

    public Date getStart_time() {
        return start_time;
    }

    public Date getEnd_time() {
        return end_time;
    }
}
