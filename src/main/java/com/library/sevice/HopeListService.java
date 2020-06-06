package com.library.sevice;

import com.library.dao.HopeListDao;
import com.library.pojo.HopeList;
import com.library.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class HopeListService {
    HopeListDao hopeListDao;
    @Autowired
    public void setHopeListDao(HopeListDao hopeListDao) {
        this.hopeListDao = hopeListDao;
    }

    public Map<String,Object> hopeListData(User user) {
        HashMap<String,Object> result = new HashMap<>();
        result.put("hopeList",hopeListDao.getHopeList(user.getUser_account()));
        return result;
    }

}
