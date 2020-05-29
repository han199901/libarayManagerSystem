package com.library.sevice;

import com.library.dao.AnnouncementDao;
import com.library.dao.BorrowHistoryDao;
import com.library.dao.DashboardDao;
import com.library.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DashboardSevice {
    DashboardDao dashboardDao;
    AnnouncementDao announcementDao;
    BorrowHistoryDao borrowHistoryDao;
    @Autowired
    public void setDashboardDao(DashboardDao dashboardDao) {
        this.dashboardDao = dashboardDao;
    }
    @Autowired
    public void setAnnouncementDao(AnnouncementDao announcementDao) {
        this.announcementDao = announcementDao;
    }
    @Autowired
    public void setBorrowHistoryDao(BorrowHistoryDao borrowHistoryDao) {
        this.borrowHistoryDao = borrowHistoryDao;
    }

    public Map<String,Object> dashBoardData(User user) {
        HashMap<String,Object> result = new HashMap<>();
        result.put("login_times",dashboardDao.getLoginTimes(user.getUser_account()));
        result.put("borrow_times",dashboardDao.getBorrowTimes(user.getUser_account()));
        result.put("read_type",dashboardDao.getReadTypeNum(user.getUser_account()));
        result.put("hope_times",dashboardDao.getHopeTimes(user.getUser_account()));
        result.put("notice_num",announcementDao.getAnnouncementNum());
        result.put("months_read_num",borrowHistoryDao.getMonthReadNum(user.getUser_account()));
        return result;
    }
}
