package com.library.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BorrowHistoryDao {

    private JdbcTemplate jdbcTemplate;
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String GET_MONTH_READ_NUM = "SELECT DATE_FORMAT(start_time,'%m')months,COUNT(*) count FROM borrow_history WHERE user_account = ? AND YEAR(start_time) = YEAR(NOW()) GROUP BY months  ORDER BY months;";
    private static final String GET_BORROW_HISTORY = "SELECT name,start_time,end_time,overtime,borrow_history.status status from borrow_history,books WHERE user_account = ? and borrow_history.book_index=books.index";


    public  List<Map<String, Object>> getMonthReadNum(int userAccount) {
        return jdbcTemplate.queryForList(GET_MONTH_READ_NUM,new Object[]{userAccount});
    }
    public  List<Map<String, Object>> getBorrowHistory(int userAccount) {
        return jdbcTemplate.queryForList(GET_BORROW_HISTORY,new Object[]{userAccount});
    }

}
