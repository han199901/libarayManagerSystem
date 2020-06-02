package com.library.controller;

import com.library.pojo.User;
import com.library.sevice.CreditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    CreditService creditService;
    @Autowired
    public void setCreditService(CreditService creditService) {
        this.creditService = creditService;
    }
    @RequestMapping("/user/home")
    public ModelAndView home (HttpServletRequest request) {
        HttpSession session = request.getSession();
        /*假设已经登录*/
        User tuser = new User();
        tuser.setUser_account(123);
        session.setAttribute("user",tuser);
        session.setAttribute("credit",creditService.creditDaoData((User) session.getAttribute("user")).get("credit"));
        User user = (User) session.getAttribute("user");
        /*假设已经登录*/

        return new ModelAndView("/user/home");
    }
    @RequestMapping("/user/faq")
    public ModelAndView faq() { return new ModelAndView("/user/faq");}
    @RequestMapping("/blank")
    public ModelAndView blank () {
        return new ModelAndView("blank");
    }

}
