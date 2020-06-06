package com.library.sevice;

import com.library.dao.BorrowCardDao;
import com.library.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BorrowCardService {
    BorrowCardDao borrowCardDao;

    @Autowired
    public void setBorrowCardDao(BorrowCardDao borrowCardDao) { this.borrowCardDao = borrowCardDao; }

    public List<Map<String, Object>> borrowCardData(User user) {
        List<Map<String, Object>> result = borrowCardDao.getborrowcardinfo(user.getUser_account());
        for (Map<String, Object> i :result) {
            int a = (int) i.get("bstatus");
            if(a == 0) {
                i.put("bstatusname","    ");
            } else if(a == 1) {
                i.put("bstatusname","已挂失");
            } else if(a == 2) {
                i.put("bstatusname","已注销");
            }
        }
        return result;
    }
    public int borrowCardIDData(User user) {
        int result = borrowCardDao.getborrowcardus(user.getUser_account());
        return result;
    }
    public void deleteBorrowCard(User user) {
        borrowCardDao.logout(user.getUser_account());
    }
}
