package com.library.controller;

import com.library.pojo.User;
import com.library.sevice.HopeListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class HopeListController {
    HopeListService hopeListService;
    @Autowired
    public void setHopeListService(HopeListService hopeListService) {
        this.hopeListService = hopeListService;
    }
    @RequestMapping("/user/myhopelist")
    public ModelAndView userMessage(HttpServletRequest request) {
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
            view = new ModelAndView("/user/myhopelist");
            HashMap<String,Object> data = (HashMap<String, Object>) hopeListService.hopeListData(user);
            view.addObject("hopeList",data.get("hopeList"));
        }
        return view;
    }

}
