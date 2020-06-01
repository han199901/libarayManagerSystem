package com.library.controller;

import com.library.dao.BookDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
public class SearchController {

    private BookDao bookDao;
    @Autowired
    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @RequestMapping("/user/search")
    public ModelAndView search() {
        return new ModelAndView("/user/search");
    }

    @RequestMapping("/search")
    @ResponseBody
    public List<Map<String, Object>> searchBookByName(@RequestParam String bookName) {
        return bookDao.getByName(bookName);
    }
}
