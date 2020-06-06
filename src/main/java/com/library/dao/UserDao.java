package com.library.dao;

import com.library.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class UserDao {
    private JdbcTemplate jdbcTemplate;
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String GET_BY_USER_ACCOUNT = "SELECT * FROM user WHERE user_account = ?";

    public List<Map<String, Object>> getByUserAccount(int userAccount) {
        return jdbcTemplate.queryForList(GET_BY_USER_ACCOUNT,new Object[]{userAccount});
    }

    public User getUser(int user_account) {
        return jdbcTemplate.queryForObject(GET_BY_USER_ACCOUNT,new Object[]{user_account},new BeanPropertyRowMapper<>(User.class));
    }
}
