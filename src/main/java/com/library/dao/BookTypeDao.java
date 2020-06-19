package com.library.dao;

import com.library.pojo.Announcement;
import com.library.pojo.BookType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.awt.print.Book;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Repository
public class BookTypeDao {



    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String UPDATE = "UPDATE `book_type` SET `name` = ?, `type_index` = ? WHERE `id` = ?";
    private static final String INSERT = "INSERT INTO `book_type`(`name`, `type_index`) VALUES (?, ?)";
    private static final String GET_BOOK_TYPE_BY_ID = "SELECT * FROM book_type WHERE `id` = ?";
    private static final String GET_ALL_BOOK_TYPE = "SELECT * FROM book_type";
    private static final String DELETE = "DELETE FROM `book_type` WHERE `id` = ?";
    public BookType getBookTypeById(int id) {return jdbcTemplate.queryForObject(GET_BOOK_TYPE_BY_ID,new Object[]{id},new BeanPropertyRowMapper<>(BookType.class)); }

    public int update(BookType bookType) {
        return jdbcTemplate.update(UPDATE,bookType.getName(),bookType.getType_index(),bookType.getId());
    }


    public List<BookType> getAllBookType() {
        return jdbcTemplate.query(GET_ALL_BOOK_TYPE,new BeanPropertyRowMapper<>(BookType.class));
    }
    public int insert(BookType bookType) {
        return jdbcTemplate.update(INSERT,bookType.getName(),bookType.getType_index());
    }

    public int delBookTypeById(int id) {
        return jdbcTemplate.update(DELETE,id);
    }
}
