package com.example.dreampicturespring.controller.mypage;


import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.vo.MypageVO;
import com.example.dreampicturespring.vo.RegisterVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class MypageController {
    @Autowired
    MembershiptblRepository membershiptblRepository;

    @RequestMapping("/mypage/{user}")
    public ModelAndView mypage(HttpServletRequest req){
        ModelAndView mv = new ModelAndView();
        String user = (String) req.getSession().getAttribute("logEmail");
        Membershiptbl membership = membershiptblRepository.findByemail(user);
        MypageVO vo = new MypageVO(membership);
        mv.addObject("mypageVO",vo);
        mv.setViewName("user/mypage/mypage");
        return mv;
    }

    @RequestMapping("/changeInfo")
    public ModelAndView changeInfo(HttpServletRequest req) {
        ModelAndView mv = new ModelAndView();
        String user = (String) req.getSession().getAttribute("logEmail");
        Membershiptbl membership = membershiptblRepository.findByemail(user);
        RegisterVO vo = new RegisterVO(membership);
        mv.addObject("memberVO",vo);
        mv.setViewName("user/mypage/changeInfo");
        return mv;
    }

    @RequestMapping("/charge")
    public String charge() { return "user/mypage/charge";}

    @RequestMapping("/charge_money")
    public String charge_money(Integer amount,HttpServletRequest request) {
        System.out.println(amount);
        HttpSession session =request.getSession();
        if(session.getAttribute("logStatus") == null){ return "user/login/login"; }
        Membershiptbl membershipTBL = membershiptblRepository.findByemail((String) session.getAttribute("logEmail"));
        System.out.println(membershipTBL);
        membershiptblRepository.UpdateDreampayPlus(amount,membershipTBL.getNo_membership());
        return "user/mypage/charge";}

    @RequestMapping("/changeSuccess")
    public String changeSuccess() {
        return "user/mypage/mypage";
    }

    @RequestMapping("/basket")
    public ModelAndView basket(HttpServletRequest req){
        ModelAndView mv = new ModelAndView();
        String user = (String) req.getSession().getAttribute("logEmail");
        mv.setViewName("user/mypage/basket");
        return mv;
    }

    @RequestMapping("/buylist")
    public String buylist() { return "user/mypage/buylist";}

    @RequestMapping("/selllist")
    public String selllist() { return "user/mypage/selllist";}

}
