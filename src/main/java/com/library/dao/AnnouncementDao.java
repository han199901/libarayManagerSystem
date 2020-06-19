package com.library.dao;

import com.library.pojo.Announcement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
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
    private static final String DELETE = "DELETE FROM `announcement` WHERE `id` = ?";
    private static final String GET_ANNOUNCEMENT_BY_ID = "SELECT * FROM announcement WHERE `id` = ?";
    private static final String UPDATE = "UPDATE `announcement` SET `content` = ? WHERE `id` = ?";
    private static final String INSERT = "INSERT INTO `announcement`(`user_account`, `content`, `start_time`, `end_time`) VALUES (?, ?, ?, ?)";
    private static final String GET_ANNOUNCEMENT_NUM = "SELECT COUNT(*) from announcement WHERE end_time > ?";
    private static final String GET_ANNOUNCEMENT = "SELECT * FROM announcement WHERE start_time < NOW() AND end_time > NOW();";
    public int  getAnnouncementNum() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        return jdbcTemplate.queryForObject(GET_ANNOUNCEMENT_NUM,new Object[]{df.format(new Date())},Integer.class);
    }
    public List<Map<String, Object>> getAnnouncement() {
        return jdbcTemplate.queryForList(GET_ANNOUNCEMENT);
    }
    public List<Announcement> getAllAnnouncement() {return jdbcTemplate.query(GET_ALL_ANNOUNCEMENT,new BeanPropertyRowMapper<>(Announcement.class)); }
    public Announcement getAnnouncementByID(int id) {return jdbcTemplate.queryForObject(GET_ANNOUNCEMENT_BY_ID,new Object[]{id},new BeanPropertyRowMapper<>(Announcement.class)); }
    public int insert(Announcement announcement) {
        return jdbcTemplate.update(INSERT,new Object[]{announcement.getUser_account(),announcement.getContent(),announcement.getStart_time(),announcement.getEnd_time()});
    }

    public int update(Announcement announcement) {
        return jdbcTemplate.update(UPDATE,announcement.getContent(),announcement.getId());
    }

    public int delAnnouncementByID(int id) {
        return jdbcTemplate.update(DELETE,id);
    }
}
