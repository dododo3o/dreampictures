package com.example.dreampicturespring.controller.admin;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    @RequestMapping("/admin/login")
    public String admin_login(Model model){ return "user/admin/login";}

    @RequestMapping("/admin/report")
    public String admin_report(Model model){ return "user/admin/report";}

    @RequestMapping("/admin/qa")
    public String admin_qa(Model model){ return "user/admin/qa";}

    @RequestMapping("/admin/blacklist")
    public String admin_blacklist(Model model){ return "user/admin/blacklist";}

    @RequestMapping("/admin/notice")
    public String admin_notice(Model model){ return "user/admin/notice";}

    @RequestMapping("/admin/salesHistory")
    public String admin_salesHistory(Model model){ return "user/admin/salesHistory";}

}
