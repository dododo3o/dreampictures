package com.example.dreampicturespring.controller.notice;

import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Qatbl;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.repository.QaRepository;
import com.example.dreampicturespring.vo.NoticeVO;
import com.example.dreampicturespring.vo.QaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
public class NoticeController {

    @Autowired
    MembershiptblRepository membershiptblRepository;
    @Autowired
    QaRepository qaRepository;

    @RequestMapping("/notice")
    public ModelAndView notice_notice() {
        final int CARDSPERPAGE = 15;
        int cardNum = 0, pageNum;

        ModelAndView mv = new ModelAndView();
//        List<NoticeVO> noticeVOList = new ArrayList<>();
//        List<String> list = qaRepository.findAllNotice_Desc();
//
//        for(String notice : list){
//            List<String> obj = Arrays.asList(notice.split(","));
//            Membershiptbl membershiptbl = membershiptblRepository.getById(Integer.parseInt(obj.get(1)));
//            NoticeVO vo = new NoticeVO();
//            vo.setContent(obj.get(2));
//            vo.setAvatarimg(membershiptbl.getImg()+"/avatarimg/avatarimg.jpg");
//            vo.setPaintingmimg("/resources/utility/photo/"+obj.get(5)+".jpg");
//            noticeVOList.add(vo);
//            cardNum++;
//        }
//        pageNum = cardNum/CARDSPERPAGE+1;
        mv.setViewName("user/notice/notice");
//        mv.addObject("noticeVOList",noticeVOList);
//        mv.addObject("pageNum",pageNum);
        return mv;
    }

    @RequestMapping("/notice_question")
    public ModelAndView notice_question() {
        final int CARDSPERPAGE = 15;
        int cardNum = 0, pageNum;

        ModelAndView mv = new ModelAndView();

        List<Qatbl> qatblList = qaRepository.findAll();
        List<QaVO> QaVOlist = new ArrayList<>();

        for (Qatbl qatbl : qatblList) {
            QaVO vo = new QaVO();
            vo.parser(qatbl.getCategory());
            Optional<Membershiptbl> membershiptbl = membershiptblRepository.findById(qatbl.getNo_membership());
            Membershiptbl writer = membershiptbl.get();
            vo.setNickname(writer.getNickname());
            vo.setContent(qatbl.getContent());
            vo.setAnswer(qatbl.getAnswer());
            QaVOlist.add(vo);
        }
        pageNum = cardNum / CARDSPERPAGE + 1;
        mv.setViewName("user/notice/notice_question");
        mv.addObject("QaVOlist", QaVOlist);
        mv.addObject("pageNum", pageNum);
        return mv;
    }
}