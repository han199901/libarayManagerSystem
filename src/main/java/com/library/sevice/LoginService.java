package com.library.sevice;

import com.library.dao.LoginInfoDao;
import com.library.dao.UserDao;
import com.library.pojo.LoginInfo;
import com.library.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class LoginService {

    private UserDao userDao;
    private LoginInfoDao loginInfoDao;

    @Autowired
    public void setLoginInfoDao(LoginInfoDao loginInfoDao) {
        this.loginInfoDao = loginInfoDao;
    }

    @Autowired
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public boolean isRight(LoginInfo loginInfo) {
        List<Map<String, Object>> user = userDao.getByUserAccount(loginInfo.getUser_account());
        if(!user.isEmpty()&&(user.get(0).get("password").equals(loginInfo.getPassword()))) {
            SimpleDateFormat format = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");//设置时间格式
            Date currentTime = new Date();//获取当前时间
            String date=format.format(new Date());//对当前时间进行格式化
            try {
                currentTime=format.parse(date);//自定义格式的时间
            } catch (ParseException e) {
                e.printStackTrace();
            }
            loginInfo.setTime(currentTime);
            loginInfo.setSimpleAddress(loginInfo.getAddress().get("country")+loginInfo.getAddress().get("city"));
            log(loginInfo);
            return true;
        }
        else
            return false;
    }

    private int log(LoginInfo loginInfo) {
        System.out.println(loginInfo);
        return loginInfoDao.insert(loginInfo.getUser_account(),loginInfo.getAddress().get("query"),loginInfo.getTime(),loginInfo.getSimpleAddress());
    }

}
