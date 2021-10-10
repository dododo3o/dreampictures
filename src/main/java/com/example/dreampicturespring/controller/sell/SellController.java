package com.example.dreampicturespring.controller.sell;


import com.example.dreampicturespring.repository.PaintingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class SellController {
    @Autowired
    PaintingRepository paintingRepository;


    @RequestMapping("/sell")
    public String sell(Model model, HttpServletRequest req){
        String subject = req.getParameter("subject_txt");
        String style = req.getParameter("style_select");
        System.out.println(subject);
        System.out.println(style);

        return "view/sell/sell";
    }
}
