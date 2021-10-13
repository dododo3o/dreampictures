package com.example.dreampicturespring.controller.mypage;


import com.example.dreampicturespring.entity.Membership;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.vo.RegisterVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MypageController {
    @Autowired
    MembershiptblRepository membershiptblRepository;

    @RequestMapping("/mypage/{user}")
    public String mypage(Model model){ return "user/mypage/mypage";
    }

    @RequestMapping("/changeInfo")
    public ModelAndView changeInfo(HttpServletRequest req) {

        ModelAndView mv = new ModelAndView();

        RegisterVO regVo = new RegisterVO();
        String user = (String) req.getSession().getAttribute("logEmail");
        Membership ms = membershiptblRepository.findByemail(user);
        mv.addObject("memberVO",ms);
        mv.setViewName("user/mypage/changeInfo");



        return mv;
    }

    @RequestMapping("/changeSuccess")
    public String changeSuccess() {
        return "user/mypage/mypage";
    }


}
