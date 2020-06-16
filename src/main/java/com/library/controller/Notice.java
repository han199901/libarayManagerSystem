package com.library.controller;

import com.library.pojo.Announcement;
import com.library.sevice.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
public class Notice {

    private NoticeService noticeService;
    @Autowired
    public void setNoticeService(NoticeService noticeService) {
        this.noticeService = noticeService;
    }

    @RequestMapping("/admin/noticelist")
    public ModelAndView search() {
        ModelAndView view = new ModelAndView("/admin/noticelist");
        view.addObject("notices",noticeService.getAllNotice());
        return view;
    }
    @RequestMapping("/admin/noticeadd")
    public ModelAndView noticeAdd() {
        ModelAndView view = new ModelAndView("/admin/noticeadd");
        return view;
    }
    @RequestMapping("/admin/noticeadd_r")
    @ResponseBody
    public Map<String, String> noticeAdd_r(@RequestBody Announcement announcement) {
        Map<String, String> map = new HashMap<>();
        if(noticeService.insert(announcement))
            map.put("status","1");
        else
            map.put("status","0");
        return map;
    }

}
