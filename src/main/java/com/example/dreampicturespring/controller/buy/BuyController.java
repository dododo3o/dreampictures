package com.example.dreampicturespring.controller.buy;


import com.example.dreampicturespring.entity.Membership;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.repository.PaintingRepository;
import com.example.dreampicturespring.vo.CardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class BuyController {

    @Autowired
    PaintingRepository paintingRepository;
    @Autowired
    MembershiptblRepository membershiptblRepository;


    @RequestMapping("/buy")
    public ModelAndView buy(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/buy/buy");
        List<CardVO> cardVOList = new ArrayList<>();
        System.out.println(membershiptblRepository.findByemail("iuttn1234@naver.comads"));
        Membership membership = membershiptblRepository.findByemail("iuttn1234@naver.comads");
        membershiptblRepository.save(membership);
        List<String> list = paintingRepository.findAllPainting_Desc();
        for(String card : list){
            List<String> obj = Arrays.asList(card.split(","));
            CardVO vo = new CardVO(obj.get(0)+"/avatarimg/avatarimg.jpg",obj.get(0)+"/paintingimg/"+obj.get(2)+"/0.jpg",obj.get(1),obj.get(2));
            cardVOList.add(vo);
        }
        mv.addObject("cardVOlist",cardVOList);
        return mv;
    }


}
