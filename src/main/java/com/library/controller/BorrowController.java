package com.library.controller;

import com.library.dao.BookDao;
import com.library.dao.BorrowCardDao;
import com.library.dao.BorrowHistoryDao;
import com.library.pojo.BorrowCard;
import com.library.pojo.BorrowHistory;
import com.library.pojo.User;
import com.library.sevice.BorrowCardService;
import com.library.sevice.BorrowHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class BorrowController {
    BorrowHistoryDao borrowHistoryDao;
    BookDao bookDao;
    BorrowHistoryService borrowHistoryService;
    BorrowCardDao borrowCardDao;
    BorrowCardService borrowCardService;
    @Autowired
    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @Autowired
    public void setBorrowHistoryService(BorrowHistoryService borrowHistoryService) {
        this.borrowHistoryService = borrowHistoryService;
    }
    @Autowired
    public void setBorrowHistoryDao(BorrowHistoryDao borrowHistoryDao) {
        this.borrowHistoryDao = borrowHistoryDao;
    }
    @Autowired
    public void setBorrowCardDao(BorrowCardDao borrowCardDao) { this.borrowCardDao = borrowCardDao; }
    @Autowired
    public void setBorrowCardService(BorrowCardService borrowCardService) { this.borrowCardService = borrowCardService; }

    @RequestMapping("/user/borrowbook")
    @ResponseBody
    public Map<String, String> borrowBook(@RequestBody BorrowHistory borrowHistory) {
        Map<String,String> result = new HashMap<>();
        SimpleDateFormat format = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");//设置时间格式
        Date date = new Date();
        String strDate = format.format(date);
        try {
            borrowHistory.setStart_time(format.parse(strDate));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);
        calendar.add(calendar.DATE,30);
        strDate = format.format(calendar.getTime());
        try {
            borrowHistory.setEnd_time(format.parse(strDate));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println(borrowHistory.getBook_index());
        bookDao.updateStatusFalse(borrowHistory.getBook_index());
        result.put("result",String.valueOf(borrowHistoryDao.insert(borrowHistory)));
        return result;
    }

    @RequestMapping("/user/borrowhistory")
    public ModelAndView borrowhistory(HttpServletRequest request) {

        /*从session处获取user_account的值*/
        /*HttpSession session = request.getSession();
        session.getAttribute("user_account");
        int user_account=(int)session.getAttribute("user_account");*/

        /*设置登陆用户账号为1001*/
        User user = new User();
        user.setUser_account(1001);
        ModelAndView view = new ModelAndView("/user/borrowhistory");
        view.addObject("borrowHistory",borrowHistoryService.borrowHistoryData(user));
        return view;
    }
    @RequestMapping("/user/myborrowing")
    public ModelAndView myborrowing(HttpServletRequest request) {

        /*从session处获取user_account的值*/
        /*HttpSession session = request.getSession();
        session.getAttribute("user_account");
        int user_account=(int)session.getAttribute("user_account");*/

        /*设置登陆用户账号为1002*/
        User user = new User();
        user.setUser_account(1001);
        ModelAndView view = new ModelAndView("/user/myborrowing");
        view.addObject("myborrowing",borrowHistoryService.myBorrowingData(user));
        return view;
    }
    @RequestMapping("/user/myborrowing.do")
    public void del(@RequestParam int id, HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {
        borrowHistoryService.returnbook(id);
        response.sendRedirect("/user/myborrowing");
    }
    @RequestMapping("/user/myborrowing.update")
    public void update(@RequestParam int id, HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {
        borrowHistoryDao.update(id);
        response.sendRedirect("/user/myborrowing");
    }

    //以下为借阅中的借阅证部分
    @RequestMapping("/user/borrowcard")
    public ModelAndView borrowcard(HttpServletRequest request) {

        /*从session处获取user_account的值*/
        /*HttpSession session = request.getSession();
        session.getAttribute("user_account");
        int user_account=(int)session.getAttribute("user_account");*/

        /*设置登陆用户账号为1001*/
        User user = new User();
        user.setUser_account(1001);
        ModelAndView view = new ModelAndView("/user/borrowcard");
        view.addObject("borrowCard",borrowCardService.borrowCardData(user));
        view.addObject("status",borrowCardService.borrowCardIDData(user));
        view.addObject("user_account",user.getUser_account());
        return view;
    }

    @RequestMapping("/user/borrowcard.b1reg")
    public void status1register(@RequestParam int user_account,HttpServletRequest request, HttpServletResponse response) throws IOException {
        borrowCardDao.updatestatus(2,user_account,1);
        borrowCardDao.insert(user_account);
        response.sendRedirect("/user/borrowcard");
    }
    @RequestMapping("/user/borrowcard.b2reg")
    public void status2register(@RequestParam int user_account,HttpServletRequest request, HttpServletResponse response) throws IOException {
        borrowCardDao.insert(user_account);
        response.sendRedirect("/user/borrowcard");
    }
    @RequestMapping("/user/borrowcard.b0rpl")
    public void status0reportloss(@RequestParam int user_account,HttpServletRequest request, HttpServletResponse response) throws IOException {
        borrowCardDao.updatestatus(1,user_account,0);
        response.sendRedirect("/user/borrowcard");
    }
}
