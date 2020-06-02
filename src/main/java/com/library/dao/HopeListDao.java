package com.library.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class HopeListDao {

    private JdbcTemplate jdbcTemplate;
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String GET_HOPE_LIST = "SELECT * FROM hope WHERE user_account = ?";

    public List<Map<String, Object>> getHopList(int userAccount) {
        return jdbcTemplate.queryForList(GET_HOPE_LIST,new Object[]{userAccount});
    }
}
