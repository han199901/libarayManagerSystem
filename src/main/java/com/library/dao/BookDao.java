package com.library.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BookDao {
    private JdbcTemplate jdbcTemplate;
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String GET_BY_NAME = "SELECT * FROM books WHERE name like concat('%',?,'%')";

    public List<Map<String, Object>> getByName(String name) {
        return jdbcTemplate.queryForList(GET_BY_NAME,name);
    }

}
