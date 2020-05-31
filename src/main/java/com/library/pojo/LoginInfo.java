package com.library.pojo;

import java.util.Date;
import java.util.Map;

public class LoginInfo {
    private int user_account;
    private String password;
    private Date time;
    private String simpleAddress;
    private Map<String,String> address;

    @Override
    public String toString() {
        return "LoginInfo{" +
                "user_account=" + user_account +
                ", password='" + password + '\'' +
                ", time=" + time +
                ", simpleAddress='" + simpleAddress + '\'' +
                ", address=" + address +
                '}';
    }

    public int getUser_account() {
        return user_account;
    }

    public void setUser_account(int user_account) {
        this.user_account = user_account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getSimpleAddress() {
        return simpleAddress;
    }

    public void setSimpleAddress(String simpleAddress) {
        this.simpleAddress = simpleAddress;
    }

    public Map<String, String> getAddress() {
        return address;
    }

    public void setAddress(Map<String, String> address) {
        this.address = address;
    }
}
