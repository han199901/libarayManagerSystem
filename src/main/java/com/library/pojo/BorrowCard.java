package com.library.pojo;

import java.sql.Date;

public class BorrowCard {
    private int id;
    private int user_account;
    private int index;
    private int credit;
    private int status;
    private Date start_time;
    private Date end_time;

    public int getId() {
        return id;
    }

    public int getUser_account() {
        return user_account;
    }

    public int getIndex() {
        return index;
    }

    public int getCredit() {
        return credit;
    }

    public int getStatus() {
        return status;
    }

    public Date getStart_time() {
        return start_time;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUser_account(int user_account) {
        this.user_account = user_account;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public void setCredit(int credit) {
        this.credit = credit;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }

    @Override
    public String toString() {
        return "BorrowCard{" +
                "id=" + id +
                ", user_account=" + user_account +
                ", index=" + index +
                ", credit=" + credit +
                ", status=" + status +
                ", start_time=" + start_time +
                ", end_time=" + end_time +
                '}';
    }
}
