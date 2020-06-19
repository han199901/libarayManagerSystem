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
    private static final String GET_BORROW_CARD_BY_USERACCOUNT = "SELECT * FROM borrow_card WHERE user_account = ?";
    private static final String DEL_BORROW_CARD = "UPDATE borrow_card SET status = 2 WHERE user_account = ? ";
    private static final String UPDATE_BORROW_CARD_CREDIT = "UPDATE borrow_card SET credit = ? WHERE user_account = ? and `status` = 0";
    private static final String GET_BORROW_CARD_CREDIT = "SELECT credit FROM borrow_card WHERE user_account = ? AND `status` = 0";
    private static final String GET_BORROW_CARD_ALL_DATE = "SELECT borrow_card.id bcid,`index`,`user`.`name` uname,borrow_card.user_account uindex,start_time,end_time,borrow_card.`status` bstatus, credit FROM borrow_card,`user` WHERE borrow_card.user_account = `user`.user_account and (borrow_card.`status` = 0 or borrow_card.`status` = 1)";
    private static final String GET_BORROW_CARD_NAME = "SELECT `user`.`name` uname FROM `borrow_card`,`user` WHERE borrow_card.user_account=`user`.user_account AND borrow_card.id = ?";
    private static final String UPDATE_BORROW_CARD = "UPDATE borrow_card SET `status` = ?,credit = ? WHERE id = ?";
    private static final String GET_BORROW_CARD_WITHOUT_DATE = "SELECT * FROM `user` where user_account not in (select user_account from borrow_card where `status` =1 or `status`=0);";

    public List<Map<String, Object>> getborrowcardinfo(int userAccount) {
        return jdbcTemplate.queryForList(GET_BORROW_CARD,new Object[]{userAccount});
    }
    public  List<Map<String, Object>> getBorrowCardByUserAccount(int userAccount) {
        return jdbcTemplate.queryForList(GET_BORROW_CARD_BY_USERACCOUNT,new Object[]{userAccount});
    }
    public int getborrowcardus(int userAccount) {
        List<Map<String, Object>> list = jdbcTemplate.queryForList(GET_BORROW_CARD_US,new Object[]{userAccount});
        if(!list.isEmpty()) {
            return jdbcTemplate.queryForObject(GET_BORROW_CARD_US, new Object[]{userAccount}, Integer.class);
        } else {
            return -1;
        }
    }
    public int getborrowcardcredit(int userAccount) {
        List<Map<String, Object>> list = jdbcTemplate.queryForList(GET_BORROW_CARD_CREDIT,new Object[]{userAccount});
        if(!list.isEmpty()) {
            return jdbcTemplate.queryForObject(GET_BORROW_CARD_CREDIT, new Object[]{userAccount}, Integer.class);
        } else {
            return 55;
        }
    }
    public int updateborrowcardcredit(int credit,int userAccount) {
        return jdbcTemplate.update(UPDATE_BORROW_CARD_CREDIT,new Object[]{credit,userAccount});
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
    public int logout(int user_account) {
        return jdbcTemplate.update(DEL_BORROW_CARD,new Object[]{user_account});
    }
    public List<Map<String, Object>> getBorrowCardAllDate() {
        return jdbcTemplate.queryForList(GET_BORROW_CARD_ALL_DATE);
    }
    public String getborrowcardname(int id) {
        return jdbcTemplate.queryForObject(GET_BORROW_CARD_NAME, new Object[]{id}, String.class);
    }
    public int updateborrowcard(int id,int ifloss,int credit) {
        return jdbcTemplate.update(UPDATE_BORROW_CARD,new Object[]{ifloss,credit,id});
    }
    public List<Map<String, Object>> getBorrowCardWithoutDate() {
        return jdbcTemplate.queryForList(GET_BORROW_CARD_WITHOUT_DATE);
    }
}

