package com.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

    @RequestMapping("/user/home")
    public ModelAndView home () {
        return new ModelAndView("/user/home");
    }
    @RequestMapping("/user/faq")
    public ModelAndView faq() { return new ModelAndView("/user/faq");}
    @RequestMapping("/blank")
    public ModelAndView blank () {
        return new ModelAndView("blank");
    }
}
