package com.library.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public class LoginInfoDao {
    private JdbcTemplate jdbcTemplate;
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String INSERT = "INSERT INTO `login_log`(`user_account`, `ip`, `time`, `address`) VALUES (?, ?, ?, ?)";

    public int insert(int user_account, String ip, Date time, String address) {
        return jdbcTemplate.update(INSERT,new Object[]{user_account,ip,time,address});
    }
}
