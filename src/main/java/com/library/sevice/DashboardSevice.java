package com.library.sevice;

import com.library.dao.DashboardDao;
import com.library.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class DashboardSevice {
    DashboardDao dashboardDao;
    @Autowired
    public void setDashboardDao(DashboardDao dashboardDao) {
        this.dashboardDao = dashboardDao;
    }

    public Map<String,Object> dashBoardData(User user) {
        HashMap<String,Object> result = new HashMap<>();
        result.put("login_times",dashboardDao.getLoginTimes(user.getUser_account()));
        result.put("borrow_times",dashboardDao.getBorrowTimes(user.getUser_account()));
        result.put("read_type",dashboardDao.getReadTypeNum(user.getUser_account()));
        return result;
    }
}
