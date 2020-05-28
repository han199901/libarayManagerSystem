package com.library.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.text.SimpleDateFormat;
import java.util.Date;

@Repository
public class AnnouncementDao {

    private JdbcTemplate jdbcTemplate;
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String GET_ANNOUNCEMENT_NUM = "SELECT COUNT(*) from announcement WHERE end_time > ?";

    public int  getAnnouncementNum() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        return jdbcTemplate.queryForObject(GET_ANNOUNCEMENT_NUM,new Object[]{df.format(new Date())},Integer.class);
    }
}
