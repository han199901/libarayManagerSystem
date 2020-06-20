package com.library.controller;

import com.library.dao.UserMessageDao;
import com.library.pojo.HopeList;
import com.library.pojo.User;
import com.library.sevice.UserMessageService;
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
import java.util.Map;


@Controller
public class UserMessageController {
    UserMessageDao userMessageDao;
    UserMessageService userMessageService;
    @Autowired
    public void setUserMessageDao(UserMessageDao userMessageDao) {
        this.userMessageDao = userMessageDao;
    }
    @Autowired
    public void setUserMessageService(UserMessageService userMessageService) {
        this.userMessageService = userMessageService;
    }
    @RequestMapping("/user/userMessage")
    public ModelAndView userMessage(HttpServletRequest request) {
        /*从session处获取user*/
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        ModelAndView view;
        if(user==null) {
            view = new ModelAndView("/login");
        }
        else {
            view = new ModelAndView("/user/userMessage");
            HashMap<String,Object> data = (HashMap<String, Object>) userMessageService.userMessageData(user);
            view.addObject("userMessage",data.get("userMessage"));
        }
        return view;
    }
    @RequestMapping(value = "/user/userMessage/ud", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Map<String,String> udUser(@RequestBody User user)  {
        Map<String,String> result = new HashMap<>();
        if (user.getName().isEmpty()||user.getPassword().isEmpty()){
            result.put("code","0");
        } else {
            userMessageDao.ud(user);
            result.put("code","1");
        }
        return result;
    }

    @RequestMapping("/admin/useradmin")
    public ModelAndView hopelsitforadmin(HttpServletRequest request) throws IOException {
        /*从session处获取user*/
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        ModelAndView view;
        if(user==null) {
            view = new ModelAndView("/login");
        }
        else {

            view = new ModelAndView("/admin/useradmin");
            HashMap<String,Object> data = (HashMap<String, Object>) userMessageService.userDataForAdmin();
            view.addObject("useradmin",data.get("useradmin"));
        }
        return view;
    }
    @RequestMapping("/admin/useradmin.s")
    public void hopeliststatusad(@RequestParam int id, HttpServletResponse response) throws IOException {
        userMessageDao.updateUserStatus(0,id);
        response.sendRedirect("useradmin");
    }

    @RequestMapping(value = "/admin/useradmin/add", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public List<User> addUser(@RequestBody User user) {
        userMessageDao.add(user);
        List<User> users = userMessageDao.getAll();
        return users;
    }

    @RequestMapping(value = "/admin/useradmin/ud", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Map<String,String> udadminUser(@RequestBody User user)  {
        Map<String,String> result1 = new HashMap<>();
        if (user.getName().isEmpty()||user.getPassword().isEmpty()){
            result1.put("code","0");
        } else {
            userMessageDao.udadmin(user);
            result1.put("code","1");
        }
        return result1;
    }
}
