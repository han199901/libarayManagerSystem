package com.library.dao;

import com.library.pojo.Announcement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Repository
public class AnnouncementDao {

    private JdbcTemplate jdbcTemplate;
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String GET_ALL_ANNOUNCEMENT = "SELECT * FROM announcement";
    private static final String INSERT = "INSERT INTO `lms`.`announcement`(`user_account`, `content`, `start_time`, `end_time`) VALUES (?, ?, ?, ?)";
    private static final String GET_ANNOUNCEMENT_NUM = "SELECT COUNT(*) from announcement WHERE end_time > ?";
    private static final String GET_ANNOUNCEMENT = "SELECT * FROM announcement WHERE start_time < NOW() AND end_time > NOW();";
    public int  getAnnouncementNum() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        return jdbcTemplate.queryForObject(GET_ANNOUNCEMENT_NUM,new Object[]{df.format(new Date())},Integer.class);
    }
    public List<Map<String, Object>> getAnnouncement() {
        return jdbcTemplate.queryForList(GET_ANNOUNCEMENT);
    }
    public List<Map<String, Object>> getAllAnnouncement() {return jdbcTemplate.queryForList(GET_ALL_ANNOUNCEMENT); }

    public int insert(Announcement announcement) {
        return jdbcTemplate.update(INSERT,new Object[]{announcement.getUser_account(),announcement.getContent(),announcement.getStart_time(),announcement.getEnd_time()});
    }
}
