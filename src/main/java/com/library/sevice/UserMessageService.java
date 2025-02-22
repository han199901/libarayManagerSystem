package com.library.sevice;

import com.library.dao.UserMessageDao;
import com.library.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
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

    public List<Map<String, Object>> userNameData() {
        List<Map<String, Object>> result = userMessageDao.getUserName();
        return result;
    }
    public Map<String,Object> userDataForAdmin(String search) {
        HashMap<String,Object> result = new HashMap<>();
        if(search==null)
            result.put("useradmin",userMessageDao.getUserForAdmin());
        else
            result.put("useradmin",userMessageDao.getUserForAdmin(search));
        return result;
    }
}
