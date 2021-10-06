package com.example.dreampicturespring.controller.register;


import com.example.dreampicturespring.constant.msg;
import com.example.dreampicturespring.dao.RegisterDAO;
import com.example.dreampicturespring.vo.Member;
import com.example.dreampicturespring.vo.MemberRepository;
import com.example.dreampicturespring.vo.RegisterVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegisterController {

    @Autowired
    private RegisterDAO dao;

    @Autowired
    MemberRepository memberRepository;


    @RequestMapping("/register1")
    public String register1(Model model){

        Member member = new Member();
        member.setName("asdasd");
        member.setEmail("zxc@zxc.com");
        memberRepository.save(member);

        return "view/register/register1";
    }

    @RequestMapping("/register2")
    public String register2(Model model, RegisterVO registerVO) {

        String page =  "view/register/register2";


        //email check
        if(registerVO.getEmail().equals("iuttn123@gmail.com")){
            model.addAttribute("msg", msg.EMAIL);
            model.addAttribute("url", "/register1");
            return "view/redirect/alert1";
        }



        return page;
    }

}
