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
    private static final String GET_POPULAR_BOOK = "SELECT * FROM books ORDER BY `like` LIMIT 8";

    public List<Map<String, Object>> getByName(String name) {
        return jdbcTemplate.queryForList(GET_BY_NAME,name);
    }

    public List<Map<String, Object>> getPopularBook() {
        return jdbcTemplate.queryForList(GET_POPULAR_BOOK);
    }

}
