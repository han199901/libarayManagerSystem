package com.library.pojo;

import java.sql.Date;

public class BorrowHistory {
    private int id;
    private int user_account;
    private int book_index;
    private int overtime;
    private int status;
    private Date start_time;
    private Date end_time;
    public static String [] whatstatus= {"已归还","未归还"};
    public int getId() {
        return id;
    }

    public int getUser_account() {
        return user_account;
    }

    public int getBook_index() {
        return book_index;
    }

    public int getOvertime() {
        return overtime;
    }

    public String getStatus() {
        return whatstatus[status];
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

    public void setBook_index(int book_index) {
        this.book_index = book_index;
    }

    public void setOvertime(int overtime) {
        this.overtime = overtime;
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
        return "BorrowHistory{" +
                "id=" + id +
                ", user_account='" + user_account + '\'' +
                ", book_index='" + book_index + '\'' +
                ", overtime=" + overtime +
                ", status='" + status + '\'' +
                ", start_time=" + start_time +
                ", end_time=" + end_time +
                '}';
    }
}
