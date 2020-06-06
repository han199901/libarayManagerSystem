package com.library.controller;

import com.library.dao.HopeListDao;
import com.library.pojo.HopeList;
import com.library.pojo.User;
import com.library.sevice.HopeListService;
import org.springframework.beans.factory.annotation.Autowired;
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
import java.util.HashMap;
import java.util.List;

@Controller

public class HopeListController {
    HopeListService hopeListService;
    HopeListDao hopeListDao;
    @Autowired
    public void setHopeListDao(HopeListDao hopeListDao) {
        this.hopeListDao = hopeListDao;
    }

    @Autowired
    public void setHopeListService(HopeListService hopeListService) {
        this.hopeListService = hopeListService;
    }
    @RequestMapping("/user/myhopelist.s")
    public void hopeliststatus(@RequestParam int id, HttpServletResponse response) throws IOException {
        hopeListDao.updateHopeStatus(0,id,1);
        response.sendRedirect("myhopelist");
    }

    @RequestMapping(value = "/user/myhopelist/add", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public List<HopeList> addUser(@RequestBody HopeList hope) {
        hopeListDao.add(hope);
        List<HopeList> hopes = hopeListDao.getAll();
        return hopes;
    }
    @RequestMapping("/user/myhopelist")
    public ModelAndView userMessage(HttpServletRequest request) throws IOException {
        /*从session处获取user*/
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

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
