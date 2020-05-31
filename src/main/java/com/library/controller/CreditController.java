package com.library.controller;

import com.library.pojo.User;
import com.library.sevice.CreditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class CreditController {
     CreditService creditService;
    @Autowired
    public void setCreditService(CreditService creditService) {
        this.creditService = creditService;
    }

    @RequestMapping("/user/credit")
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
            view = new ModelAndView("/user/credit");
            HashMap<String,Object> data = (HashMap<String, Object>) creditService.creditDaoData(user);
            view.addObject("credit",data.get("credit"));
        }
        return view;
    }
}
