package com.example.dreampicturespring.controller.buy;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class BuyController {

    @RequestMapping("/buy")
    public ModelAndView buy(Model model, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        System.out.println(session.getAttribute("logEmail"));


        if(session.getAttribute("logEmail")==null){
            mv.setViewName("user/buy/buy");
            return mv;
        }
        else{
            mv.setViewName("user/buy/buy");
            mv.addObject("user",session.getAttribute("logEmail"));
            return mv;
        }
    }

}
