package com.example.dreampicturespring.controller.register;

import com.example.dreampicturespring.entity.Membership;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.vo.PermissionVO;
import com.example.dreampicturespring.vo.RegisterVO;
import com.example.dreampicturespring.constant.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class RegisterController {


    @Autowired
    MembershiptblRepository membershiptblRepository;

    @RequestMapping("/register1")
    public String register1(){ return "view/register/register1"; }

    @RequestMapping("/register2")
    public String register2(){ return "view/register/register2";}

}
//
//        if(vo.getEmail().equals("iuttn123@gmail.com")){
//                model.addAttribute("msg", Msg.EMAIL);
//                model.addAttribute("url", "/register1");
//                return "view/redirect/alert1";
//                }