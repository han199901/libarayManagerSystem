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
    public ModelAndView credit(HttpServletRequest request) {
        /*从session处获取user*/
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

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
