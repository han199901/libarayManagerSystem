package com.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {

    @RequestMapping("/user/search")
    public ModelAndView search() {
        return new ModelAndView("/user/search");
    }
}
