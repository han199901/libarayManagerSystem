package com.library.pojo;

import java.io.Serializable;
import java.sql.Date;

public class User implements Serializable {
    private int user_account;
    private String password;
    private String name;
    private int type;
    private String favoicon;
    private int phone_number;
    private String email;
    private String description;
    private int status;
    private Date register_time;

    public User() {
    }

    public User(String password, String name, int phone_number, String email, String description) {
        this.password = password;
        this.name = name;
        this.phone_number = phone_number;
        this.email = email;
        this.description = description;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getFavoicon() {
        return favoicon;
    }

    public void setFavoicon(String favoicon) {
        this.favoicon = favoicon;
    }

    public int getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(int phone_number) {
        this.phone_number = phone_number;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getRegister_time() {
        return register_time;
    }

    public void setRegister_time(Date register_time) {
        this.register_time = register_time;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_account=" + user_account +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", type=" + type +
                ", favoicon='" + favoicon + '\'' +
                ", phone_number=" + phone_number +
                ", email='" + email + '\'' +
                ", description='" + description + '\'' +
                ", status=" + status +
                ", register_time=" + register_time +
                '}';
    }
}
