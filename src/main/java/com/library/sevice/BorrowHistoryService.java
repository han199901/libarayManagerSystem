package com.library.sevice;

import com.library.dao.BookDao;
import com.library.dao.BorrowCardDao;
import com.library.dao.BorrowHistoryDao;
import com.library.dao.UserDao;
import com.library.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class BorrowHistoryService {
    BorrowHistoryDao borrowHistoryDao;
    BorrowCardDao borrowCardDao;
    UserDao userDao;
    BookDao bookDao;

    @Autowired
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Autowired
    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @Autowired
    public void setBorrowCardDao(BorrowCardDao borrowCardDao) {
        this.borrowCardDao = borrowCardDao;
    }

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
        List<Map<String, Object>> result = borrowHistoryDao.getBorrowHistoryById(id);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date now = new Date();
        for (Map<String, Object> i :result) {
            Date date2 = (Date) i.get("end_time");
            System.out.println(date2);

            int d = (int) i.get("user_account");
            int credit  = borrowCardDao.getborrowcardcredit(d);

            int a;
            if(date2.compareTo(now) < 0) {
                long day = (now.getTime() - date2.getTime()) / (24 * 60 * 60 * 1000);
                a = (int) day;
                credit = credit-a/10;
            } else {
                a=0;
                if(credit < 50) {
                    credit = credit+1;
                }
            }
            borrowCardDao.updateborrowcardcredit(credit,d);
            borrowHistoryDao.updateOvertime(id,a);
            borrowHistoryDao.updateendtime(id);
        }
        borrowHistoryDao.delete(id);
    }

    public List<Map<String, Object>> borrowHistoryAllData() {
        List<Map<String, Object>> result = borrowHistoryDao.getAllBorrowHistory();
        for (Map<String, Object> i :result) {
            int a = (int) i.get("bhstatus");
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

    public void changeborrowHistoryData(String username, String bookname, int ifovertime, int overtime, int id) {
        String username1 = "\'" + username + "\'";
        String bookname1 = "\'" + bookname + "\'";
        List<Map<String, Object>> result1 = bookDao.getBookIndex(bookname1);
        List<Map<String, Object>> result2 = userDao.getUserAccount(username1);
        int useraccount = 1 ,bookindex = 1 ;
        /*for(Map<String, Object> i : result2) {
            System.out.println("i.get(\"user_account\")"+i.get("user_account"));
            useraccount = (int) i.get("user_account");
        }*/
        if(result1.isEmpty())
            System.out.println("result1 is null");
        for (Map<String, Object> i :result1) {
            System.out.println("i.get(\"index\");"+i.get("index"));
            /*bookindex = (int) i.get("index");*/
        }
        if(overtime <= 0) {
            overtime = 0;
        }
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        System.out.println(useraccount+"  "+bookindex+"  "+ifovertime+"  "+overtime+"  "+id);
        /*borrowHistoryDao.updateBorrowingHistory(id,useraccount,bookindex,overtime,ifovertime);*/
    }
}
