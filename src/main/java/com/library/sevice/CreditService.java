package com.library.sevice;

import com.library.dao.CreditDao;
import com.library.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class CreditService {
    CreditDao creditDao;
    @Autowired
    public void setCreditDao(CreditDao creditDao) {
        this.creditDao = creditDao;
    }
    public Map<String,Object> creditDaoData(User user) {
        HashMap<String, Object> result = new HashMap<>();
        result.put("credit",creditDao.getCredit(user.getUser_account()));
        return result;
    }
    public Map<String,Object> creditDataForAdmin() {
        HashMap<String,Object> result = new HashMap<>();
        result.put("creditadmin",creditDao.getCreditForAdmin());
        return result;
    }
}
