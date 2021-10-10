package com.example.dreampicturespring.controller.notice;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

    @RequestMapping("/notice")
    public String notice(Model model){ return "user/notice/notice";}

}
