package com.example.dreampicturespring.controller.admin;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    @RequestMapping("/admin/login")
    public String admin_login(Model model){ return "view/admin/login";}

    @RequestMapping("/admin/report")
    public String admin_report(Model model){ return "view/admin/report";}

    @RequestMapping("/admin/qa")
    public String admin_qa(Model model){ return "view/admin/qa";}

    @RequestMapping("/admin/blacklist")
    public String admin_blacklist(Model model){ return "view/admin/blacklist";}

    @RequestMapping("/admin/notice")
    public String admin_notice(Model model){ return "view/admin/notice";}

}
