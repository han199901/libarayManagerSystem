package com.library.controller;

import com.library.dao.BookDao;
import com.library.dao.BorrowCardDao;
import com.library.dao.BorrowHistoryDao;
import com.library.pojo.*;
import com.library.sevice.*;
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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.*;


@Controller
public class BorrowController {
    BorrowHistoryDao borrowHistoryDao;
    BookDao bookDao;
    BookSevice bookSevice;
    BorrowHistoryService borrowHistoryService;
    BorrowCardDao borrowCardDao;
    BorrowCardService borrowCardService;
    UserMessageService userMessageService;
    BookTypeService bookTypeService;


    @Autowired
    public void setBookTypeService(BookTypeService bookTypeService) {
        this.bookTypeService = bookTypeService;
    }

    @Autowired
    public void setBookSevice(BookSevice bookSevice) {
        this.bookSevice = bookSevice;
    }
    @Autowired
    public void setUserMessageService(UserMessageService userMessageService) {
        this.userMessageService = userMessageService;
    }
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

        /*从session处获取user*/
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        ModelAndView view = new ModelAndView("/user/borrowhistory");
        view.addObject("borrowHistory",borrowHistoryService.borrowHistoryData(user));
        return view;
    }
    @RequestMapping("/user/myborrowing")
    public ModelAndView myborrowing(HttpServletRequest request) {

        /*从session处获取user*/
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        ModelAndView view = new ModelAndView("/user/myborrowing");
        int flag = 0;
        int result = borrowCardService.borrowCardIDData(user);
        if(result == 0) {
            flag = 1;
            view.addObject("flag", flag);
        }
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

        /*从session处获取user*/
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        ModelAndView view = new ModelAndView("/user/borrowcard");
        List<Map<String, Object>> list =  borrowCardService.borrowCardData(user);
        view.addObject("borrowCard",list);
        int flag=0;
        if(!list.isEmpty()) {
            int result = borrowCardService.borrowCardIDData(user);
            if(result != -1) {
                if(result == 1) {
                    flag = 2;
                } else {
                    flag = 1;
                }
                view.addObject("status", borrowCardService.borrowCardIDData(user));
                view.addObject("user_account", user.getUser_account());
            }
        }
        view.addObject("flag", flag);
        return view;
    }

    @RequestMapping("/user/borrowcard.del")
    public void deleteBorrowCard(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*从session处获取user*/
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        borrowCardService.deleteBorrowCard(user);
        response.sendRedirect("/user/borrowcard");
    }
    @RequestMapping("/user/borrowcard.b2reg")
    public void status2register(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*从session处获取user*/
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        borrowCardDao.insert(user.getUser_account());
        response.sendRedirect("/user/borrowcard");
    }
    @RequestMapping("/user/borrowcard.b0rpl")
    public void status0reportloss(@RequestParam int user_account,HttpServletRequest request, HttpServletResponse response) throws IOException {
        borrowCardDao.updatestatus(1,user_account,0);
        response.sendRedirect("/user/borrowcard");
    }
    @RequestMapping("/user/borrowcard.cancel")
    public void cancel(@RequestParam int user_account,HttpServletRequest request, HttpServletResponse response) throws IOException {
        borrowCardDao.updatestatus(0,user_account,1);
        response.sendRedirect("/user/borrowcard");
    }
    @RequestMapping("/admin/borrowinghistorymanagement")
    public ModelAndView borrowhistorymanagement(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("/admin/borrowinghistorymanagement");
        view.addObject("borrowHistory",borrowHistoryService.borrowHistoryAllData());
        return view;
    }
    @RequestMapping("/admin/borrowinghistorymanagement.del")
    @ResponseBody
    public Map<String,String> borrowhistorymanagementdel(@RequestParam int id) {
        Map<String,String> result = new HashMap<>();
        int a=1;
        if (a==1){
            result.put("code","0");
        } else {
            result.put("code","1");
        }
        borrowHistoryDao.delborrowhistory(id);
        return result;
    }

    @RequestMapping("/admin/changeborrowinghistory")
    @ResponseBody
    public ModelAndView changeborrowinghistory(@RequestParam int id,HttpServletRequest request) {
        ModelAndView view = new ModelAndView("/admin/changeborrowinghistory");
        view.addObject("id", id);
        view.addObject("username", userMessageService.userNameData());
        view.addObject("bookname", bookSevice.bookNameData());
        return view;
    }
    @RequestMapping("/admin/changeborrowinghistory.save")
    public ModelAndView changeborrowinghistorysave(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("/admin/changeborrowinghistory");
        String username = request.getParameter("username");
        int id = Integer.parseInt(request.getParameter("id"));
        String bookname = request.getParameter("bookname");
        int ifovertime = Integer.parseInt(request.getParameter("ifovertime"));
        int overtime = Integer.parseInt(request.getParameter("overtime"));
        if(ifovertime == 0) {
            overtime = 0;
        }
        borrowHistoryService.changeborrowHistoryData(username,bookname,ifovertime,overtime,id);
        return view;
    }
    @RequestMapping("/admin/borrowcardmanagement")
    public ModelAndView borrowcardmanagement(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("/admin/borrowcardmanagement");
        view.addObject("borrowCard",borrowCardService.borrowCardAllData());
        return view;
    }
    @RequestMapping("/admin/borrowcardmanagement.del")
    @ResponseBody
    public Map<String,String> borrowcardmanagementdel(@RequestParam int id) {
        Map<String,String> result = new HashMap<>();
        int a=1;
        if (a==1){
            result.put("code","0");
        } else {
            result.put("code","1");
        }
        borrowCardDao.logout(id);
        return result;
    }

    @RequestMapping("/admin/changeborrowcard")
    @ResponseBody
    public ModelAndView changeborrowcard(@RequestParam int id,HttpServletRequest request) {
        ModelAndView view = new ModelAndView("/admin/changeborrowcard");
        view.addObject("id", id);
        view.addObject("username",borrowCardService.borrowCardName(id));
        return view;
    }
    @RequestMapping("/admin/borrowcardmanagement.save")
    public ModelAndView borrowcardmanagementsave(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("/admin/borrowcardmanagement");
        int id = Integer.parseInt(request.getParameter("id"));
        int ifloss = Integer.parseInt(request.getParameter("ifloss"));
        int credit = Integer.parseInt(request.getParameter("credit"));
        borrowCardDao.updateborrowcard(id,ifloss,credit);
        return view;
    }
    @RequestMapping("/admin/addborrowcard")
    public ModelAndView addborrowcard(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("/admin/addborrowcard");
        view.addObject("user",borrowCardService.borrowCardWithoutData());
        return view;
    }
    @RequestMapping("/admin/addborrowcard.save")
    public ModelAndView addborrowcardsave(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("/admin/addborrowcard");
        String username = request.getParameter("user");
        borrowCardService.addBorrowCard(username);
        return view;
    }
    @RequestMapping("/admin/booksmanagement")
    public ModelAndView booksmanagement(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("/admin/booksmanagement");
        view.addObject("books",bookSevice.allBooksData());
        return view;
    }
    @RequestMapping("/admin/booksmanagement.del")
    @ResponseBody
    public Map<String,String> booksmanagementdel(@RequestParam int id) {
        Map<String,String> result = new HashMap<>();
        int a=1;
        if (a==1){
            result.put("code","0");
        } else {
            result.put("code","1");
        }
        bookDao.abandon(id);
        return result;
    }

    @RequestMapping("/admin/bookinfo")
    @ResponseBody
    public ModelAndView bookinfo(@RequestParam int id) {
        ModelAndView view = new ModelAndView("/admin/bookinfo");
        view.addObject("book",bookSevice.oneBooksData(id));
        return view;
    }
    @RequestMapping("/admin/addbook")
    @ResponseBody
    public ModelAndView addbook(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("/admin/addbook");
        view.addObject("booktypes",bookTypeService.getAllBookType());
        return view;
    }
    @RequestMapping("/admin/addbook.save")
    @ResponseBody
    public ModelAndView addbooksave(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("/admin/addbook");
        Books books = new Books();
        int index = Integer.parseInt(request.getParameter("index"));
        books.setIndex(index);
        String name = request.getParameter("name");
        books.setName(name);
        String description = request.getParameter("description");
        books.setDescription(description);
        String author = request.getParameter("author");
        books.setAuthor(author);
        String type_index = request.getParameter("type_index");
        books.setType_index(type_index);
        int ISBN = Integer.parseInt(request.getParameter("ISBN"));
        books.setISBN(ISBN);
        int status = Integer.parseInt(request.getParameter("status"));
        books.setStatus(status);
        String publish = request.getParameter("publish");
        books.setPublish(publish);
        String locate = request.getParameter("locate");
        books.setLocate(locate);
        int price = Integer.parseInt(request.getParameter("price"));
        books.setPrice(price);
        bookDao.addBook(books);
        return view;
    }
    @RequestMapping("/admin/changebooks")
    @ResponseBody
    public ModelAndView changebooks(@RequestParam int id,HttpServletRequest request) {
        ModelAndView view = new ModelAndView("/admin/changebooks");
        view.addObject("book",bookSevice.oneBooksData(id));
        view.addObject("booktypes",bookTypeService.getAllBookType());
        return view;
    }
    @RequestMapping("/admin/changebooks.save")
    @ResponseBody
    public ModelAndView changebookssave(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("/admin/addbook");
        Books books = new Books();
        int id = Integer.parseInt(request.getParameter("id"));
        int index = Integer.parseInt(request.getParameter("index"));
        books.setIndex(index);
        String name = request.getParameter("name");
        books.setName(name);
        String description = request.getParameter("description");
        books.setDescription(description);
        String author = request.getParameter("author");
        books.setAuthor(author);
        String type_index = request.getParameter("type_index");
        books.setType_index(type_index);
        int ISBN = Integer.parseInt(request.getParameter("ISBN"));
        books.setISBN(ISBN);
        int status = Integer.parseInt(request.getParameter("status"));
        books.setStatus(status);
        String publish = request.getParameter("publish");
        books.setPublish(publish);
        String locate = request.getParameter("locate");
        books.setLocate(locate);
        int price = Integer.parseInt(request.getParameter("price"));
        books.setPrice(price);
        bookDao.update(books,id);
        return view;
    }
}
