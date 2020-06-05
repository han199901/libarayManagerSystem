package com.library.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CreditDao {
    private JdbcTemplate jdbcTemplate;
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String GET_USER_CREDIT = "SELECT credit from borrow_card WHERE user_account = ? and status = 0";
    public int getCredit(int userAccount) {
        return jdbcTemplate.queryForObject(GET_USER_CREDIT,new Object[]{userAccount},Integer.class);
    }
}
