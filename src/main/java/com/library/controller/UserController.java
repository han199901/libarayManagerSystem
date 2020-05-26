package com.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

    @RequestMapping("/home")
    public ModelAndView home () {
        return new ModelAndView("home");
    }
    @RequestMapping("/blank")
    public ModelAndView blank () {
        return new ModelAndView("blank");
    }
}
