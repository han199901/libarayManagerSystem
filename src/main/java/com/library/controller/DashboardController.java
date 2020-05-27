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
        /*假设已经登录*/

        User user = (User) session.getAttribute("user");
        HashMap<String,Object> data = (HashMap<String, Object>) dashboardSevice.dashBoardData(user);
        ModelAndView view = new ModelAndView("/user/dashboard");
        view.addObject("login_times",data.get("login_times"));
        view.addObject("borrow_times",data.get("borrow_times"));
        view.addObject("read_type",data.get("read_type"));
        return view;
    }
}
