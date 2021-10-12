package com.example.dreampicturespring.controller.login;


import com.example.dreampicturespring.entity.Membership;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.vo.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {


    @Autowired
    MembershiptblRepository membershiptblRepository;

    @RequestMapping("/login")
    public String login(){ return "user/login/login";}

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session =request.getSession();
        session.invalidate();
        return "user/main/main";
    }


    @RequestMapping(value = "/login_check",method = RequestMethod.POST, produces ="application/text;charset=UTF-8")
    @ResponseBody
    public ModelAndView login_check(LoginVO vo, HttpServletRequest request){
        Membership membership = membershiptblRepository.findByemail(vo.getEmail());
        ModelAndView mv = new ModelAndView();
        mv.setViewName("guest/redirect/alert1");
        mv.addObject("msg","회원정보를 다시 확인해주세요.");
        mv.addObject("url","/login");
        if(membership==null) return mv;
        else{
            if(!membership.getPwd().equals(vo.getPwd())) return mv;
            else{
                mv.addObject("user",membership.getEmail());
                HttpSession session =request.getSession();
                session.setAttribute("logEmail",vo.getEmail());
                session.setAttribute("logStatus","Y");
                mv.setViewName("user/main/main");
                return mv;
            }
        }
    }
}
