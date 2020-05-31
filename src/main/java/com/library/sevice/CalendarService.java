package com.library.sevice;

import com.library.dao.BorrowHistoryDao;
import com.library.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CalendarService {
    BorrowHistoryDao borrowHistoryDao;

    @Autowired
    public void setBorrowHistoryDao(BorrowHistoryDao borrowHistoryDao) {
        this.borrowHistoryDao = borrowHistoryDao;
    }

    public List<Map<String, Object>> calendarData(User user) {
        return borrowHistoryDao.getBorrowHistory(user.getUser_account());
    }
}
