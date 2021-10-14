package com.example.dreampicturespring.controller.buy;


import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Paintingtbl;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.repository.PaintingRepository;
import com.example.dreampicturespring.vo.CardVO;
import com.example.dreampicturespring.vo.PaintingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
public class BuyController {

    @Autowired
    PaintingRepository paintingRepository;
    @Autowired
    MembershiptblRepository membershiptblRepository;

    @RequestMapping("/buy")
    public ModelAndView buy(HttpServletRequest request){
        final int CARDSPERPAGE = 16;
        int cardNum = 0,pageNum;
        ModelAndView mv = new ModelAndView();

        List<CardVO> cardVOList = new ArrayList<>();
        List<String> list = paintingRepository.findAllPainting_Desc();
        for(String card : list){
            List<String> obj = Arrays.asList(card.split(","));
            CardVO vo = new CardVO(obj.get(0),obj.get(1)+"/avatarimg/avatarimg.jpg",obj.get(1)+"/paintingimg/"+obj.get(3)+"/0.jpg",obj.get(2),obj.get(3));
            cardVOList.add(vo);
            cardNum++;
        }
        pageNum = cardNum%CARDSPERPAGE+1;

        mv.setViewName("user/buy/buy");
        mv.addObject("cardVOlist",cardVOList);
        mv.addObject("pageNum",pageNum);
        return mv;
    }

    @RequestMapping("/buy_picture/{no_painting}")
    public ModelAndView buy_picture(HttpServletRequest request, @PathVariable String no_painting) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/buy/buy_picture");
        Optional<Paintingtbl> PTBL = paintingRepository.findById(Long.parseLong(no_painting));
        Paintingtbl paintingTBL = PTBL.get();
        Optional<Membershiptbl> MTBL = membershiptblRepository.findById(paintingTBL.getNo_membership());
        Membershiptbl membershipTBL = MTBL.get();

        PaintingVO paintingVO = new PaintingVO(paintingTBL,membershipTBL);
        mv.addObject("paintingVO",paintingVO);

        return mv;
    }
}