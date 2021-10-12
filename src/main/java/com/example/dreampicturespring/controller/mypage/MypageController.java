package com.example.dreampicturespring.controller.mypage;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

    @RequestMapping("/mypage/{user}")
    public String mypage(Model model){ return "user/mypage/mypage";}

}
