package com.library.controller;

import com.library.pojo.Announcement;
import com.library.pojo.BookType;
import com.library.sevice.BookTypeService;
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
public class BookTypeController {
    private BookTypeService bookTypeService;
    @Autowired
    public void setBookTypeService(BookTypeService bookTypeService) {
        this.bookTypeService = bookTypeService;
    }

    @RequestMapping("/admin/booktypelist")
    public ModelAndView search() {
        ModelAndView view = new ModelAndView("/admin/booktypelist");
        view.addObject("booktypes",bookTypeService.getAllBookType());
        return view;
    }
    @RequestMapping("/admin/booktypeadd")
    public ModelAndView noticeAdd() {
        ModelAndView view = new ModelAndView("/admin/booktypeadd");
        return view;
    }
    @RequestMapping("/admin/booktypeadd_r")
    @ResponseBody
    public Map<String, String> noticeAdd_r(@RequestBody BookType bookType) {
        Map<String, String> map = new HashMap<>();
        if(bookTypeService.insert(bookType))
            map.put("status","1");
        else
            map.put("status","0");
        return map;
    }
    @RequestMapping("/admin/booktypeedit")
    public ModelAndView bookTypeEdir(@RequestParam int id) {
        ModelAndView view = new ModelAndView("/admin/booktypeedit");
        view.addObject("info",bookTypeService.getABookType(id));
        return view;
    }
    @RequestMapping("/admin/booktypeedit_r")
    @ResponseBody
    public Map<String, String> bookTypeEdit_r(@RequestBody BookType bookType) {
        Map<String, String> map = new HashMap<>();
        if(bookTypeService.update(bookType))
            map.put("status","1");
        else
            map.put("status","0");
        return map;
    }
    @RequestMapping("/admin/booktypedel")
    @ResponseBody
    public Map<String, String> bookTypeEdit_r(@RequestParam int id) {
        Map<String, String> map = new HashMap<>();
        if(bookTypeService.del(id))
            map.put("status","1");
        else
            map.put("status","0");
        return map;
    }
}
