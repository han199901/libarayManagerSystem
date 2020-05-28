package com.library.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class DashboardDao {
    private JdbcTemplate jdbcTemplate;
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String GET_LOGIN_TIMES = "SELECT COUNT(*) from login_log WHERE user_account = ?";
    private static final String GET_BORROW_TIMES = "SELECT COUNT(*) from borrow_history WHERE user_account = ?";
    private static final String GET_READ_TYPE_NUM = "SELECT name,count from (SELECT type_index,COUNT(*) count from borrow_history,books WHERE user_account = ? and borrow_history.book_index=books.index GROUP BY type_index) a,book_type b WHERE a.type_index=b.type_index;";
    private static final String GET_HOPE_TIMES = "SELECT COUNT(*) from hope WHERE user_account = ?";
    public int getLoginTimes(int userAccount) {
        return jdbcTemplate.queryForObject(GET_LOGIN_TIMES,new Object[]{userAccount},Integer.class);
    }
    public int getBorrowTimes(int userAccount) {
        return jdbcTemplate.queryForObject(GET_BORROW_TIMES,new Object[]{userAccount},Integer.class);
    }
    public List<Map<String,Object>> getReadTypeNum(int userAccount) {
        return jdbcTemplate.queryForList(GET_READ_TYPE_NUM,new Object[]{userAccount});
    }
    public int getHopeTimes(int userAccount) {
        return jdbcTemplate.queryForObject(GET_HOPE_TIMES,new Object[]{userAccount},Integer.class);
    }
}
