package com.library.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CreditDao {
    private JdbcTemplate jdbcTemplate;
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String GET_USER_CREDIT = "SELECT credit from borrow_card WHERE user_account = ? and (status = 1 or status = 0 )";
    public int getCredit(int userAccount) {
        List<Map<String, Object>> t = jdbcTemplate.queryForList(GET_USER_CREDIT,new Object[]{userAccount});
        if(!t.isEmpty())
            return (int)t.get(0).get("credit");
        else
            return -1;
    }
}
