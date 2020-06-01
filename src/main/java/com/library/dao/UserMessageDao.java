package com.library.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class UserMessageDao {
    private JdbcTemplate jdbcTemplate;
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String GET_USER_MESSAGE = "SELECT * FROM user WHERE user_account = ?";

    public List<Map<String, Object>> getUserMessage(int userAccount) {
        return jdbcTemplate.queryForList(GET_USER_MESSAGE,new Object[]{userAccount});
    }
}
