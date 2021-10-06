package com.example.dreampicturespring.controller.buy;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BuyController {

    @RequestMapping("/buy")
    public String buy(Model model){ return "view/buy/buy";}



}
