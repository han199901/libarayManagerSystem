package com.library.pojo;

import java.io.Serializable;
import java.util.Date;

public class HopeList{
    private int  id;
    private String name;
    private String publish;
    private int user_account;
    private String user_name;
    private Date time;
    private String advice;
    private int status;

    public HopeList() {
    }

    public HopeList(String name, String publish, int user_account, String user_name, Date time, String advice, int status) {
        this.name = name;
        this.publish = publish;
        this.user_account = user_account;
        this.user_name = user_name;
        this.time = time;
        this.advice = advice;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPublish() {
        return publish;
    }

    public void setPublish(String publish) {
        this.publish = publish;
    }

    public int getUser_account() {
        return user_account;
    }

    public void setUser_account(int user_account) {
        this.user_account = user_account;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getAdvice() {
        return advice;
    }

    public void setAdvice(String advice) {
        this.advice = advice;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
