package com.library.sevice;

import com.library.dao.BorrowHistoryDao;
import com.library.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class BorrowHistoryService {
    BorrowHistoryDao borrowHistoryDao;

    @Autowired
    public void setBorrowHistoryDao(BorrowHistoryDao borrowHistoryDao) {
        this.borrowHistoryDao = borrowHistoryDao;
    }

    public List<Map<String, Object>> borrowHistoryData(User user) {
        List<Map<String, Object>> result = new ArrayList<>();
        result =  borrowHistoryDao.getBorrowHistory(user.getUser_account());
        for (Map<String, Object> i :result) {
             int a = (int) i.get("status");
             if(a == 1) {
                 i.put("statusname","已归还");
             } else {
                 i.put("statusname","未归还");
             }
             SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
             Date date1 = new Date();
             Date now = date1;
             Date date2 = (Date) i.get("end_time");
            /*SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            Date date1 = new Date();
            Date start_time = date1;*/
             if(date2.compareTo(now) < 0 && a == 0) {
                 long day = (now.getTime() - date2.getTime()) / (24 * 60 * 60 * 1000);
                 i.put("days", "已超时"+day+"天");
             } else if(date2.compareTo(now) < 0 && a == 1) {
                 int day = (int) i.get("overtime");
                 i.put("days", "超时"+day+"天");
             } else {
                 i.put("days", "未超时");
             }
        }
        return result;
    }
    public List<Map<String, Object>> myBorrowingData(User user) {
        return borrowHistoryDao.getMyBorrowing(user.getUser_account());
    }
    public Map<String, Object> rank(User user) {
        Map<String, Object> rank = new HashMap<>();
        int a;
        a =  borrowHistoryDao.rank(user.getUser_account());
        if(a <= 4) {
            rank.put("rank","英勇黄铜");
        } else if(a > 4 && a <= 8){
                rank.put("rank","不屈白银");
        } else if(a > 8 && a <= 12){
            rank.put("rank","荣耀黄金");
        } else if(a > 12 && a <= 16){
            rank.put("rank","华贵铂金");
        } else if(a > 16 && a <= 20){
            rank.put("rank","璀璨钻石");
        } else if(a > 20 && a <= 24){
            rank.put("rank","超凡大师");
        } else if(a > 24 && a <= 28){
            rank.put("rank","傲世宗师");
        } else {
            rank.put("rank","最强王者");
        }
        return rank;
    }
    public void returnbook(int id) {
        List<Map<String, Object>> result = new ArrayList<>();
        result =  borrowHistoryDao.getBorrowHistoryById(id);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date date1 = new Date();
        Date now = date1;
        for (Map<String, Object> i :result) {
            Date date2 = (Date) i.get("end_time");
            if(date2.compareTo(now) < 0) {
                long day = (now.getTime() - date2.getTime()) / (24 * 60 * 60 * 1000);
                int a = (int) day;
                borrowHistoryDao.updateOvertime(id,a);
            }
        }
        borrowHistoryDao.delete(id);
    }
}
