package com.library.sevice;

import com.library.dao.UserMessageDao;
import com.library.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class UserMessageService {
    UserMessageDao userMessageDao;
    @Autowired
    public void setDashboardDao(UserMessageDao userMessageDao) {
        this.userMessageDao = userMessageDao;
    }

    public Map<String,Object> userMessageData(User user) {
        HashMap<String,Object> result = new HashMap<>();
        result.put("userMessage",userMessageDao.getUserMessage(user.getUser_account()));
        return result;
    }

}
