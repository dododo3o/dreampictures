package com.example.dreampicturespring.controller.notice;


import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.repository.QaRepository;
import com.example.dreampicturespring.vo.CardVO;
import com.example.dreampicturespring.vo.NoticeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class NoticeController {

    @Autowired
    MembershiptblRepository membershiptblRepository;
    @Autowired
    QaRepository qaRepository;

    @RequestMapping("/notice")
    public ModelAndView notice(){
        final int CARDSPERPAGE = 15;
        int cardNum = 0,pageNum;

        ModelAndView mv = new ModelAndView();
        List<NoticeVO> noticeVOList = new ArrayList<>();
        List<String> list = qaRepository.findAllNotice_Desc();

        for(String notice : list){
            List<String> obj = Arrays.asList(notice.split(","));
            Membershiptbl membershiptbl = membershiptblRepository.getById(Integer.parseInt(obj.get(1)));
            NoticeVO vo = new NoticeVO();
            vo.setContent(obj.get(2));
            vo.setAvatarimg(membershiptbl.getImg()+"/avatarimg/avatarimg.jpg");
            vo.setPaintingmimg("/resources/utility/photo/"+obj.get(5)+".jpg");
            noticeVOList.add(vo);
            cardNum++;
        }
        pageNum = cardNum/CARDSPERPAGE+1;
        mv.setViewName("user/notice/notice");
        mv.addObject("noticeVOList",noticeVOList);
        mv.addObject("pageNum",pageNum);
        return mv;
    }

}
