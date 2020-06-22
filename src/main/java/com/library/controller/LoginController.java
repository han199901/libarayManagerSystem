package com.library.controller;

import com.library.pojo.LoginInfo;
import com.library.pojo.User;
import com.library.sevice.CreditService;
import com.library.sevice.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {

    private LoginService loginService;
    private CreditService creditService;
    @Autowired
    public void setCreditService(CreditService creditService) {
        this.creditService = creditService;
    }
    @Autowired
    public void setLoginService(LoginService loginService) {
        this.loginService = loginService;
    }

    @RequestMapping("/")
    public ModelAndView login() {
        return new ModelAndView("login");
    }


    @RequestMapping("/check")
    @ResponseBody
    public Map<String,String> check(@RequestBody LoginInfo loginInfo, HttpServletRequest request) {
        Map<String,String> req = new HashMap<>();
        if(loginService.isRight(loginInfo)) {
            HttpSession session = request.getSession();
            session.setAttribute("user",loginService.getUser(loginInfo.getUser_account()));
            session.setAttribute("credit",creditService.creditDaoData((User) session.getAttribute("user")).get("credit"));
            
            req.put("code","1");
        }
        else
            req.put("code","0");
        return req;
    }
}
