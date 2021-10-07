package com.example.dreampicturespring.controller.sell;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellController {
    @RequestMapping("/sell")
    public String sell(Model model){ return "view/sell/sell";}
}
