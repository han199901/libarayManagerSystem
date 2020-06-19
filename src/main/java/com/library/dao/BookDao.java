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
    private static final String UPDATE_STATUS_FALSE = "UPDATE `books` SET `status` = 0 WHERE `index` = ?";
    private static final String GET_BOOK_NAME = "SELECT name FROM books ";
    private static final String GET_BOOK_INDEX= "SELECT `index` FROM books WHERE `name` = ?";
    private static final String GET_ALL_BOOK = "SELECT books.id bid,`index`,books.`name` bname,description,book_type.`name` btname,author,ISBN,books.type_index typeindex,entry_time,`status`,publish,`like`,locate,price,ruin_time FROM books,book_type WHERE books.type_index = book_type.type_index ";
    private static final String DEL_BOOK= "UPDATE `books` SET `status` = 2 WHERE `index` = ?";

    public List<Map<String, Object>> getByName(String name) {
        return jdbcTemplate.queryForList(GET_BY_NAME,name);
    }

    public List<Map<String, Object>> getPopularBook() {
        return jdbcTemplate.queryForList(GET_POPULAR_BOOK);
    }

    public int updateStatusFalse(int index) {
        return jdbcTemplate.update(UPDATE_STATUS_FALSE,index);
    }

    public List<Map<String, Object>> getBookName() {
        return jdbcTemplate.queryForList(GET_BOOK_NAME);
    }

    public List<Map<String, Object>> getBookIndex(String name) {
        return  jdbcTemplate.queryForList(GET_BOOK_INDEX,new Object[]{name});
    }

    public List<Map<String, Object>> getAllBook() {
        return  jdbcTemplate.queryForList(GET_ALL_BOOK);
    }

    public int abandon(int index) {
        return  jdbcTemplate.update(DEL_BOOK,new Object[]{index});
    }
}
