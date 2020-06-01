package com.library.controller;

import com.library.dao.ReadRoomDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReadRoomController {

    private ReadRoomDao readRoomDao;
    @Autowired
    public void setReadRoomDao(ReadRoomDao readRoomDao) {
        this.readRoomDao = readRoomDao;
    }

    @RequestMapping("/user/readingroom")
    public ModelAndView readingroom () {
        ModelAndView view = new ModelAndView("/user/readingroom");
        view.addObject("seats",readRoomDao.getSeats());
        return view;
    }
}
