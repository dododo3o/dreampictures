package com.example.dreampicturespring.controller.register;

import com.example.dreampicturespring.entity.Membership;
import com.example.dreampicturespring.repository.MembershiptblRepository;
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
    public String register1(Model model){
        Membership member = new Membership();
        member.setEmail("tsets");
        member.setPwd("123132");
        member.setTel("12312313");
        member.setAddr("test");
        member.setDetailAddr("sektksdfsdkfj");
        member.setNickname("123213355");
        member.setZipcode(12345);
        member.setNickname("1235kjkdsaf");
        member.setImg("/.../.../");
        member.setMemberStatus(0);
        membershiptblRepository.save(member);

        System.out.println(membershiptblRepository.findById(45L));
        System.out.println("=======================");
        System.out.println(membershiptblRepository.findByemail("tsets"));

        return "view/register/register1";
    }

    @RequestMapping("/register2")
    public String register2(Model model, RegisterVO registerVO) {
        String page =  "view/register/register2";
        if(registerVO.getEmail().equals("iuttn123@gmail.com")){
            model.addAttribute("msg", Msg.EMAIL);
            model.addAttribute("url", "/register1");
            return "view/redirect/alert1";
        }
        return page;
    }

}