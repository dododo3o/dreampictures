package com.example.dreampicturespring.controller.notice;
import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Noticetbl;
import com.example.dreampicturespring.entity.Qatbl;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.repository.NoticeRepository;
import com.example.dreampicturespring.repository.QaRepository;
import com.example.dreampicturespring.vo.NoticeVO;
import com.example.dreampicturespring.vo.QaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class NoticeController {
    @Autowired
    NoticeRepository noticeRepository;
    @Autowired
    MembershiptblRepository membershiptblRepository;
    @Autowired
    QaRepository qaRepository;

    @RequestMapping("/notice")
    public ModelAndView notice_notice() {
        final int CARDSPERPAGE = 15;
        Long cardNum,pageNum;;
        ModelAndView mv = new ModelAndView();
        List<Noticetbl> noticetblList = noticeRepository.findAll();
        List<NoticeVO> noticeVOList = new ArrayList<>();
        for (Noticetbl noticetbl : noticetblList) {
            NoticeVO noticeVO = new NoticeVO();
            noticeVO.setTitle(noticetbl.getTitle());
            noticeVO.setWritedate(noticetbl.getWritedate());
            noticeVO.setContent(noticetbl.getContent());
            noticeVOList.add(noticeVO);
        }
        cardNum = noticeRepository.count();
        pageNum = cardNum/CARDSPERPAGE;
        mv.setViewName("user/notice/notice");
        mv.addObject("noticeVOList", noticeVOList);
        mv.addObject("pageNum",pageNum);
        return mv;
    }
    @RequestMapping("/notice_question")
    public ModelAndView notice_question() {
        final int CARDSPERPAGE = 15;
        Long cardNum,pageNum;

        ModelAndView mv = new ModelAndView();
        List<Qatbl> qatblList = qaRepository.find_sort();
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
        cardNum = qaRepository.count();
        pageNum = cardNum / CARDSPERPAGE + 1;
        mv.setViewName("user/notice/notice_question");
        mv.addObject("QaVOlist", QaVOlist);
        mv.addObject("pageNum", pageNum);
        return mv;
    }
}