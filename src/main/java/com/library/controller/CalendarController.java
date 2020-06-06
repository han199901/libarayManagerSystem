package com.library.controller;


import com.library.pojo.User;
import com.library.sevice.CalendarService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class CalendarController {

    CalendarService calendarService;
    @Autowired
    public void setCalendarService(CalendarService calendarService) {
        this.calendarService = calendarService;
    }

    @RequestMapping("/user/calendar")
    public ModelAndView calender(HttpServletRequest request) {
        /*从session处获取user*/
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        ModelAndView view = new ModelAndView("/user/calendar");
        view.addObject("calendar",calendarService.calendarData(user));
        return view;
    }
}
