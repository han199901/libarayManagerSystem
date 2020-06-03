package com.library.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.text.SimpleDateFormat;
import java.util.*;

@Repository
public class BorrowCardDao {
    private JdbcTemplate jdbcTemplate;
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    private static final String GET_BORROW_CARD = "SELECT borrow_card.user_account uid,borrow_card.index bid,start_time,end_time,borrow_card.status bstatus,credit,user.name uname FROM borrow_card,user WHERE borrow_card.user_account = user.user_account and borrow_card.user_account = ?";
    private static final String IST_BORROW_CARD = "INSERT INTO borrow_card (`index`, `user_account`, `start_time`, `end_time`, `status`, `credit`) VALUES (?,?,?,?,0,50)";
    private static final String UD_BORROW_CARD_STS = "UPDATE borrow_card SET status = ? WHERE user_account = ? AND status = ?";
    private static final String GET_BORROW_CARD_US = "SELECT status from borrow_card WHERE user_account = ? and (`status` = 1 or `status` = 0)";
    public List<Map<String, Object>> getborrowcardinfo(int userAccount) {
        return jdbcTemplate.queryForList(GET_BORROW_CARD,new Object[]{userAccount});
    }
    public int getborrowcardus(int userAccount) {
        return jdbcTemplate.queryForObject(GET_BORROW_CARD_US,new Object[]{userAccount}, Integer.class);
    }
    public int insert(int user_account) {
        /*return jdbcTemplate.update(DEL_SB_MY_BORROWING,new Object[]{id});*/

        /*获取当前年份*/
        Calendar date = Calendar.getInstance();
        String year = String.valueOf(date.get(Calendar.YEAR));

        /*生成index值*/
        String index = year+user_account;

        /*获取当前时间*/
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date date1 = new Date();
        String start_time = dateFormat.format(date1);

        /*生成过期时间*/
        Calendar cal = Calendar.getInstance();
        cal.setTime(date1);//设置起时间
        cal.add(Calendar.YEAR, 3);//增加一年
        String end_time = dateFormat.format(cal.getTime());

        return jdbcTemplate.update(IST_BORROW_CARD,new Object[]{index,user_account,start_time,end_time});
    }
    public int updatestatus(int newstatus,int user_account,int nowstatus) {
        return jdbcTemplate.update(UD_BORROW_CARD_STS,new Object[]{newstatus,user_account,nowstatus});
    }
}

