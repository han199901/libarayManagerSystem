package com.library.dao;

import com.library.pojo.BorrowHistory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BorrowHistoryDao {

    private JdbcTemplate jdbcTemplate;
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String GET_MONTH_READ_NUM = "SELECT DATE_FORMAT(start_time,'%m')months,COUNT(*) count FROM borrow_history WHERE user_account = ? AND YEAR(start_time) = YEAR(NOW()) GROUP BY months  ORDER BY months;";
    private static final String GET_BORROW_HISTORY = "SELECT name,start_time,end_time,overtime,borrow_history.status status from borrow_history,books WHERE user_account = ? and borrow_history.book_index=books.index";
    private static final String GET_MY_BORROWING = "SELECT borrow_history.id id,borrow_history.user_account uid,borrow_history.book_index bid,name,start_time,end_time,overtime,borrow_history.status status from borrow_history,books WHERE user_account = ? and borrow_history.book_index=books.index and borrow_history.status=0";
    private static final String DEL_SB_MY_BORROWING = "UPDATE borrow_history SET status = 1 WHERE id = ?";
    private static final String UPDATE_SB_MY_BORROWING_OT = "UPDATE borrow_history SET overtime = ? WHERE id = ?";
    private static final String UPDATE_SB_MY_BORROWING_ETIME = "UPDATE borrow_history SET end_time=date_add(end_time,interval 1 MONTH) WHERE id = ?";
    private static final String GET_SB_BORROW_HISTORY_COUNT = "SELECT COUNT(*) `rank` from borrow_history WHERE user_account = ?";
    private static final String GET_BORROW_HISTORY_BY_ID = "SELECT * FROM borrow_history WHERE id = ?";
    private static final String INSERT = "INSERT INTO `borrow_history`(`user_account`, `start_time`, `end_time`, `book_index`, `overtime`, `status`) VALUES (?, ?, ?, ?, 0, 0)";
    private static final String UPDATE_BORROW_HISTORY_ENDTIME = "UPDATE borrow_history SET end_time = NOW() WHERE id = ?";
    private static final String GET_ALL_BORROW_HISTORY = "SELECT borrow_history.id bhid,user.name uname,books.name bname,start_time,end_time,overtime,borrow_history.status bhstatus from borrow_history,user,books where borrow_history.user_account=user.user_account and borrow_history.book_index=books.index and (borrow_history.status = 0 or borrow_history.status = 1)";
    private static final String DEL_BORROW_HISTORY_BY_ID = "UPDATE borrow_history SET status = 2 WHERE id = ?";
    private static final String DEL_BORROW_HISTORY = "UPDATE borrow_history SET user_account = ?,book_index = ?,overtime = ?,status = ? WHERE id = ?";

    public int insert(BorrowHistory borrowHistory) {
        return jdbcTemplate.update(INSERT,new Object[]{borrowHistory.getUser_account(),borrowHistory.getStart_time(),borrowHistory.getEnd_time(),borrowHistory.getBook_index()});
    }

    public  List<Map<String, Object>> getMonthReadNum(int userAccount) {
        return jdbcTemplate.queryForList(GET_MONTH_READ_NUM,new Object[]{userAccount});
    }
    public  List<Map<String, Object>> getBorrowHistory(int userAccount) {
        return jdbcTemplate.queryForList(GET_BORROW_HISTORY,new Object[]{userAccount});
    }

    public  List<Map<String, Object>> getMyBorrowing(int userAccount) {
        return jdbcTemplate.queryForList(GET_MY_BORROWING,new Object[]{userAccount});
    }

    /*归还书籍,即status=1*/
    public int delete(int id) {
        return jdbcTemplate.update(DEL_SB_MY_BORROWING,new Object[]{id});
    }

    public int updateOvertime(int id,int overtime) {
        return jdbcTemplate.update(UPDATE_SB_MY_BORROWING_OT,new Object[]{overtime,id});
    }

    public int update(int id) {
        return jdbcTemplate.update(UPDATE_SB_MY_BORROWING_ETIME,new Object[]{id});
    }

    public int  rank(int id) {
        List<Map<String, Object>> list = jdbcTemplate.queryForList(GET_SB_BORROW_HISTORY_COUNT,new Object[]{id});
        if(!list.isEmpty()) {
            return jdbcTemplate.queryForObject(GET_SB_BORROW_HISTORY_COUNT, new Object[]{id}, Integer.class);
        } else {
            return 0;
        }
    }
    public int  updateendtime(int id) {
        return jdbcTemplate.queryForObject(UPDATE_BORROW_HISTORY_ENDTIME,new Object[]{id},Integer.class);
    }
    public  List<Map<String, Object>> getBorrowHistoryById(int id) {
        return jdbcTemplate.queryForList(GET_BORROW_HISTORY_BY_ID,new Object[]{id});
    }

    public  List<Map<String, Object>> getAllBorrowHistory() {
        return jdbcTemplate.queryForList(GET_ALL_BORROW_HISTORY);
    }
    public int  delborrowhistory(int id) {
        return jdbcTemplate.update(DEL_BORROW_HISTORY_BY_ID,new Object[]{id});
    }

    public int updateBorrowingHistory(int id, int user_account, int book_index, int overtime, int status) {
        return jdbcTemplate.update(DEL_BORROW_HISTORY,new Object[]{user_account,book_index,overtime,status,id});
    }
}
