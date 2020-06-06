package com.library.dao;

import com.library.pojo.HopeList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class HopeListDao {

    private JdbcTemplate jdbcTemplate;
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String GET_HOPE_LIST = "SELECT * FROM hope WHERE user_account = ?";
    private static final String UD_HOPE_LIST_STS = "UPDATE hope SET status = ? WHERE id = ? AND status = ?";

    public List<Map<String, Object>> getHopeList(int userAccount) {
        return jdbcTemplate.queryForList(GET_HOPE_LIST,new Object[]{userAccount});
    }
    public void add(HopeList hope) {
        String sql = "INSERT INTO hope (name, publish,user_account,user_name,time,advice,status) VALUES (?,?,?,?,?,?,?)";
        this.jdbcTemplate.update(sql, hope.getName(),hope.getPublish(),hope.getUser_account(),hope.getUser_name(),hope.getTime(),hope.getAdvice(),hope.getStatus());
    }
    public List<HopeList> getAll() {
        List<HopeList> hope = this.jdbcTemplate.query("SELECT * FROM hope", (rs, rownum) -> {
            return new HopeList(rs.getString("name"),rs.getString("publish"),rs.getInt("user_account"),rs.getString("user_name"),rs.getDate("time"),rs.getString("advice"),rs.getInt("status"));
        });
        return hope;
    }
    public int updateHopeStatus(int newstatus,int id,int nowstatus) {
        return jdbcTemplate.update(UD_HOPE_LIST_STS,new Object[]{newstatus,id,nowstatus});
    }
}
