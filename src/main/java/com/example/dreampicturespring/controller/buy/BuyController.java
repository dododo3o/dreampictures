package com.example.dreampicturespring.controller.buy;


import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.repository.PaintingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class BuyController {

    @Autowired
    PaintingRepository paintingRepository;
    @Autowired
    MembershiptblRepository membershiptblRepository;


    @RequestMapping("/buy")
    public ModelAndView buy(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/buy/buy");
        System.out.println(paintingRepository.findbyno_painiting(1));



        return mv;
    }


}
