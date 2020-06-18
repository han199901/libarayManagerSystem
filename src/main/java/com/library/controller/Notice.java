package com.library.controller;

import com.library.pojo.Announcement;
import com.library.sevice.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    @RequestMapping("/admin/noticeedit")
    public ModelAndView noticeEdit(@RequestParam int id) {
        ModelAndView view = new ModelAndView("/admin/noticeedit");
        view.addObject("info",noticeService.getAnnouncement(id));
        return view;
    }
    @RequestMapping("/admin/noticedel")
    @ResponseBody
    public Map<String, String> noticeDel(@RequestParam int id) {
        Map<String, String> map = new HashMap<>();
        if(noticeService.del(id))
            map.put("status","1");
        else
            map.put("status","0");
        return map;
    }
    @RequestMapping("/admin/noticeedit_r")
    @ResponseBody
    public Map<String, String> noticeEdit_r(@RequestBody Announcement announcement) {
        Map<String, String> map = new HashMap<>();
        if(noticeService.update(announcement))
            map.put("status","1");
        else
            map.put("status","0");
        return map;
    }

}
