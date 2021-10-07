package com.example.dreampicturespring.controller.admin;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    @RequestMapping("/admin/login")
    public String admin(Model model){ return "view/admin/login";}

    @RequestMapping("/admin/main")
    public String admin_main(Model model){ return "view/admin/main";}

}
