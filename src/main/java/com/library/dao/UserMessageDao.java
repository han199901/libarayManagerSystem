package com.library.dao;

import com.library.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class UserMessageDao {
    private JdbcTemplate jdbcTemplate;
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String GET_USER_MESSAGE = "SELECT * FROM user WHERE user_account = ?";
    private static final String UD_USER_INFO = "UPDATE user SET password = ?,name=?,phone_number=?,email=?,description=? WHERE user_account = ?";
    private static final String GET_USER_NAME = "SELECT name FROM user";
    private static final String AD_GET_USER_LIST = "SELECT * FROM user where status = 1 order by type asc";
    private static final String UD_USER_STS = "UPDATE user SET status = ? WHERE id = ?";

    public List<Map<String, Object>> getUserMessage(int userAccount) {
        return jdbcTemplate.queryForList(GET_USER_MESSAGE,new Object[]{userAccount});
    }
    public void ud(User user) {
        String sql = "UPDATE user SET password = ?,name=?,phone_number=?,email=?,description=? WHERE user_account = ?";
        this.jdbcTemplate.update(sql, user.getPassword(),user.getName(),user.getPhone_number(),user.getEmail(),user.getDescription(),user.getUser_account());
    }
    public List<Map<String, Object>> getUserName() {
        return jdbcTemplate.queryForList(GET_USER_NAME);
    }

    public int updateUserStatus(int newstatus,int id) {
        return jdbcTemplate.update(UD_USER_STS,new Object[]{newstatus,id});
    }

    public List<Map<String, Object>> getUserForAdmin() {
        return jdbcTemplate.queryForList(AD_GET_USER_LIST);
    }

    public void add(User user) {
        String sql = "INSERT INTO user (user_account,password,name,type,favoicon,phone_number,email,description,status,register_time) VALUES (?,?,?,?,?,?,?,?,?,?)";
        this.jdbcTemplate.update(sql, user.getUser_account(),user.getPassword(),user.getName(),user.getType(),user.getFavoicon(),user.getPhone_number(),user.getEmail(),user.getDescription(),user.getStatus(),user.getRegister_time());
    }
    public List<User> getAll() {
        List<User> user = this.jdbcTemplate.query("SELECT * FROM user", (rs, rownum) -> {
            return new User(rs.getInt("user_account"),rs.getString("password"),rs.getString("name"),rs.getInt("type"),rs.getString("favoicon"),rs.getInt("phone_number"),rs.getString("email"),rs.getString("description"),rs.getInt("status"),rs.getDate("register_time"));
        });
        return user;
    }
}
