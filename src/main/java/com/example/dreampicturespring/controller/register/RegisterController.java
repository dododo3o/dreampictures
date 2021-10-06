package com.example.dreampicturespring.controller.register;


import com.example.dreampicturespring.constant.msg;
import com.example.dreampicturespring.vo.RegisterVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegisterController {

    @RequestMapping("/register1")
    public String register1(Model model){ return "view/register/register1";}

    @RequestMapping("/register2")
    public String register2(Model model, RegisterVO registerVO) {

        String page =  "view/register/register2";


        //email check
        if(registerVO.getEmail().equals("iuttn123@gmail.com")){
            model.addAttribute("Msg", msg.EMAIL);
            model.addAttribute("url", "/register1");
            return "view/redirect/alert1";
        }



        return page;
    }

}
