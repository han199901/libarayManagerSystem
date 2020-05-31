package com.library.controller;

import com.library.pojo.BorrowHistory;
import com.library.pojo.User;
import com.library.sevice.BorrowHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class BorrowController {

    BorrowHistoryService borrowHistoryService;
    @Autowired
    public void setBorrowHistoryService(BorrowHistoryService borrowHistoryService) {
        this.borrowHistoryService = borrowHistoryService;
    }

    @RequestMapping("/user/borrowhistory")
    public ModelAndView borrowhistory(HttpServletRequest request) {

        /*从session处获取user_account的值*/
        /*HttpSession session = request.getSession();
        session.getAttribute("user_account");
        int user_account=(int)session.getAttribute("user_account");*/

        /*设置登陆用户账号为1002*/
        User user = new User();
        user.setUser_account(1001);
        ModelAndView view = new ModelAndView("/user/borrowhistory");
        view.addObject("borrowHistory",borrowHistoryService.borrowHistoryData(user));
        return view;
    }
}
