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
    private static final String AD_GET_USER_CREDIT = "SELECT * from borrow_card WHERE status = 1 or status = 0";
    private static final String UD_HOPE_LIST_STS = "UPDATE borrow_card SET status = ? WHERE id = ? ";

    public int getCredit(int userAccount) {
        List<Map<String, Object>> t = jdbcTemplate.queryForList(GET_USER_CREDIT,new Object[]{userAccount});
        if(!t.isEmpty())
            return (int)t.get(0).get("credit");
        else
            return -1;
    }
    public List<Map<String, Object>> getCreditForAdmin() {
        return jdbcTemplate.queryForList(AD_GET_USER_CREDIT);
    }
    public int updateUserStatus(int newstatus,int id) {
        return jdbcTemplate.update(UD_HOPE_LIST_STS,new Object[]{newstatus,id});
    }
}
