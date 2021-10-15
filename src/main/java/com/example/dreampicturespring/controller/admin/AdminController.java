package com.example.dreampicturespring.controller.admin;


import com.example.dreampicturespring.entity.Admintbl;
import com.example.dreampicturespring.repository.AdminRepository;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.vo.LoginAdminVO;
import com.example.dreampicturespring.vo.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    AdminRepository adminRepository;



    @RequestMapping("/admin/login")
    public String admin_login(Model model){ return "user/admin/login";}

    @RequestMapping("/admin/login_check")
    public ModelAndView admin_login_check(LoginAdminVO vo, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        System.out.println(vo.getAdmin());
        System.out.println(vo.getAdminpwd());
        String adminPwd = adminRepository.findByadminID(vo.getAdmin());
        System.out.println(adminPwd);
        if(adminPwd ==null){
            mv.setViewName("user/redirect/alert1");
            mv.addObject("msg","관리자 정보를 다시 확인해주세요.");
            mv.addObject("url","/admin/login");
            return mv;
        }
        else{
            if(!adminPwd.equals(vo.getAdminpwd())) return mv;
            else{
                HttpSession session =request.getSession();
                session.setAttribute("adminLogin",vo.getAdmin());
                session.setAttribute("adminLoginStatus","Y");
                mv.setViewName("user/admin/salesHistory");
                return mv;
            }
        }
    }

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
