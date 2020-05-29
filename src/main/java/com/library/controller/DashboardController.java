package com.library.controller;

import com.library.dao.DashboardDao;
import com.library.pojo.User;
import com.library.sevice.DashboardSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class DashboardController {

    DashboardSevice dashboardSevice;

    @Autowired
    public void setDashboardSevice(DashboardSevice dashboardSevice) {
        this.dashboardSevice = dashboardSevice;
    }

    @RequestMapping("/user/dashboard")
    public ModelAndView dashboard(HttpServletRequest request) {
        HttpSession session = request.getSession();
        /*假设已经登录*/
        User tuser = new User();
        tuser.setUser_account(123);
        session.setAttribute("user",tuser);
        User user = (User) session.getAttribute("user");
        /*假设已经登录*/
        ModelAndView view;
        if(user==null) {
            view = new ModelAndView("/login");
        }
        else {
            view = new ModelAndView("/user/dashboard");
            HashMap<String,Object> data = (HashMap<String, Object>) dashboardSevice.dashBoardData(user);
            view.addObject("login_times",data.get("login_times"));
            view.addObject("borrow_times",data.get("borrow_times"));
            view.addObject("read_type",data.get("read_type"));
            view.addObject("hope_times",data.get("hope_times"));
            view.addObject("notice_num",data.get("notice_num"));
            view.addObject("months_read_num",data.get("months_read_num"));
        }
        return view;
    }
}
