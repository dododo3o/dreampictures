package com.example.dreampicturespring.controller.admin;


import com.example.dreampicturespring.entity.Admintbl;
import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Noticetbl;
import com.example.dreampicturespring.entity.Qatbl;
import com.example.dreampicturespring.repository.*;
import com.example.dreampicturespring.vo.*;
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
import java.util.Optional;

@Controller
public class AdminController {

    @Autowired
    AdminRepository adminRepository;

    @Autowired
    CommentRepository commentRepository;

    @Autowired
    NoticeRepository noticeRepository;

    @Autowired
    QaRepository qaRepository;

    @Autowired
    MembershiptblRepository membershiptblRepository;

    @Autowired
    PaintingRepository paintingRepository;

    @Autowired
    ReportRepository reportRepository;

    @RequestMapping("/admin/login")
    public String admin_login(Model model){ return "user/admin/login";}

    @RequestMapping("/admin/login_check")
    public ModelAndView admin_login_check(LoginAdminVO vo, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        String adminPwd = adminRepository.findByadminID(vo.getAdmin());
        if(adminPwd ==null){
            mv.setViewName("user/redirect/alert1");
            mv.addObject("msg","관리자 정보를 다시 확인해주세요.");
            mv.addObject("url","/admin/login");
            return mv;
        }
        else{
            if(!adminPwd.equals(vo.getAdminpwd())) return mv;
            else{
                HttpSession session =request.getSession();
                session.setAttribute("adminLogin",vo.getAdmin());
                session.setAttribute("adminLoginStatus","Y");
                mv.setViewName("user/admin/main");
                return mv;
            }
        }
    }

    @RequestMapping("/admin/logout")
    public String logout(HttpServletRequest request){
        HttpSession session =request.getSession();
        session.invalidate();
        return "user/admin/login";
    }

    @RequestMapping("/admin/main")
    public String admin_main(Model model){ return "user/admin/main";}

    @RequestMapping("/admin/notice")
    public ModelAndView admin_notice(Model model){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/admin/notice");
        List<Noticetbl> noticetblList =  noticeRepository.findAll();
        List<NoticeVO> noticeVOList = new ArrayList<>();
        for(Noticetbl noticetbl :noticetblList){
            NoticeVO noticeVO = new NoticeVO();
            noticeVO.setTitle(noticetbl.getTitle());
            noticeVO.setWritedate(noticetbl.getWritedate());
            noticeVO.setContent(noticetbl.getContent());
            noticeVOList.add(noticeVO);
        }
        mv.addObject("noticeVOList",noticeVOList);
        return mv;
    }

    @RequestMapping("/admin/qa")
    public ModelAndView admin_qa() {
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
        mv.setViewName("user/admin/qa");
        mv.addObject("QaVOlist", QaVOlist);
        mv.addObject("pageNum", pageNum);
        return mv;
    }


    @RequestMapping("/admin/blacklist")
    public ModelAndView admin_blacklist(Model model){

        ModelAndView mv = new ModelAndView();

        return mv;}

    @RequestMapping("/admin/salesHistory")
    public ModelAndView admin_salesHistory(Model model){
        final int CARDSPERPAGE = 15;
        int cardNum = 0,pageNum;
        ModelAndView mv = new ModelAndView();
        List<CardVO> cardVOList = new ArrayList<>();
        List<String> list = paintingRepository.findAllPainting_SoldOut();
        for(String card : list){
            List<String> obj = Arrays.asList(card.split(","));
            CardVO cardVO = new CardVO();
            cardVO.setNo_painting(obj.get(0));
            cardVO.setAvatarimg(obj.get(1)+"/avatarimg/avatarimg.jpg");
            cardVO.setPaintingmimg(obj.get(1)+"/paintingimg/"+obj.get(3)+"/0.jpg");
            cardVO.setNickname(obj.get(2));
            cardVO.setPname(obj.get(3));
            cardVO.setCommentNumber(commentRepository.countByno_painting(Integer.parseInt(obj.get(0))));

            List<String> comments = commentRepository.findCommenttbl(Integer.parseInt(obj.get(0)));
            List<CommentVO> commentVOlist = new ArrayList<>();
            for(String comment : comments){
                List<String> comment_member = Arrays.asList(comment.split(","));
                Membershiptbl membershiptbl = membershiptblRepository.getById(Integer.parseInt(comment_member.get(1)));
                CommentVO commentVO = new CommentVO();
                commentVO.setAvatarimg(membershiptbl.getImg()+"/avatarimg/avatarimg.jpg");
                commentVO.setAuthor(membershiptbl.getNickname());
                commentVO.setDate("1H");
                commentVO.setComments(comment_member.get(0));
                commentVO.setNo_membership(membershiptbl.getNo_membership());
                commentVOlist.add(commentVO);
            }
            cardVO.setCommentVOList(commentVOlist);
            cardVOList.add(cardVO);
            cardNum++;
        }
        pageNum = cardNum/CARDSPERPAGE+1;
        mv.setViewName("user/admin/salesHistory");
        mv.addObject("cardVOlist",cardVOList);
        mv.addObject("pageNum",pageNum);
        return mv;
    }

    @RequestMapping("/admin/allmembers")
    public ModelAndView admin_allmembers(Model model){
        ModelAndView mv = new ModelAndView();
        List<Membershiptbl> memberAllTBL = membershiptblRepository.findAll();
        List<MemberVO> memberVOList = new ArrayList<>();
        for(Membershiptbl members : memberAllTBL){
            MemberVO vo = new MemberVO();
            vo.setAvatarimg(members.getImg()+"/avatarimg/avatarimg.jpg");
            vo.setNickname(members.getNickname());
            vo.setAddr(members.getAddr());
            vo.setReported(members.getReported());
            vo.setTel(members.getTel());
            vo.setDreampay(members.getDreampay());
            vo.setInput_total(0);
            vo.setOutput_total(0);
            memberVOList.add(vo);
        }
        mv.addObject("memberVOList",memberVOList);
        mv.setViewName("user/admin/allmembers");
        return mv;
    }

    @RequestMapping("/admin/report")
    public ModelAndView admin_report(Model model){
        final int CARDSPERPAGE = 15;
        int cardNum = 0,pageNum;
        ModelAndView mv = new ModelAndView();
        List<CardVO> cardVOList = new ArrayList<>();

        List<Integer> reportedList = reportRepository.findAllpaint();

        for(Integer no : reportedList) {
            List<String> list = paintingRepository.findAllPainting_Reported(no);
            for (String card : list) {
                List<String> obj = Arrays.asList(card.split(","));
                CardVO cardVO = new CardVO();
                cardVO.setNo_painting(obj.get(0));
                cardVO.setAvatarimg(obj.get(1) + "/avatarimg/avatarimg.jpg");
                cardVO.setPaintingmimg(obj.get(1) + "/paintingimg/" + obj.get(3) + "/0.jpg");
                cardVO.setNickname(obj.get(2));
                cardVO.setPname(obj.get(3));
                cardVO.setCommentNumber(commentRepository.countByno_painting(Integer.parseInt(obj.get(0))));
                List<String> comments = commentRepository.findCommenttbl(Integer.parseInt(obj.get(0)));
                List<CommentVO> commentVOlist = new ArrayList<>();
                for (String comment : comments) {
                    List<String> comment_member = Arrays.asList(comment.split(","));
                    Membershiptbl membershiptbl = membershiptblRepository.getById(Integer.parseInt(comment_member.get(1)));
                    CommentVO commentVO = new CommentVO();
                    commentVO.setAvatarimg(membershiptbl.getImg() + "/avatarimg/avatarimg.jpg");
                    commentVO.setAuthor(membershiptbl.getNickname());
                    commentVO.setDate("1H");
                    commentVO.setComments(comment_member.get(0));
                    commentVO.setNo_membership(membershiptbl.getNo_membership());
                    commentVOlist.add(commentVO);
                }
                cardVO.setCommentVOList(commentVOlist);
                cardVOList.add(cardVO);
                cardNum++;
            }
        }
        pageNum = cardNum/CARDSPERPAGE+1;
        mv.setViewName("user/admin/report");
        mv.addObject("cardVOlist",cardVOList);
        mv.addObject("pageNum",pageNum);
        return mv;
    }

}
