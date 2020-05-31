package com.library.sevice;

import com.library.dao.BorrowHistoryDao;
import com.library.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        }
        return result;
    }
}
