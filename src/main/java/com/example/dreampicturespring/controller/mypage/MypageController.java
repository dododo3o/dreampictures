package com.example.dreampicturespring.controller.mypage;

import com.example.dreampicturespring.entity.*;
import com.example.dreampicturespring.repository.*;
import com.example.dreampicturespring.vo.CardVO;
import com.example.dreampicturespring.vo.CommentVO;
import com.example.dreampicturespring.vo.MypageVO;
import com.example.dreampicturespring.vo.RegisterVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
public class MypageController {
    @Autowired
    MembershiptblRepository membershiptblRepository;

    @Autowired
    CommentRepository commentRepository;

    @Autowired
    CartRepository cartRepository;

    @Autowired
    CartpaintingRepository cartpaintingRepository;

    @Autowired
    PaintingRepository paintingRepository;

    @Autowired
    PaymentRepository paymentRepository;

    @RequestMapping("/mypage/{user}")
    public ModelAndView mypage(HttpServletRequest req) {
        ModelAndView mv = new ModelAndView();
        String user = (String) req.getSession().getAttribute("logEmail");
        Membershiptbl membership = membershiptblRepository.findByemail(user);
        MypageVO vo = new MypageVO(membership);
        mv.addObject("mypageVO", vo);
        mv.setViewName("user/mypage/mypage");
        return mv;
    }

    @RequestMapping("/changeInfo")
    public ModelAndView changeInfo(HttpServletRequest req) {
        ModelAndView mv = new ModelAndView();
        String user = (String) req.getSession().getAttribute("logEmail");
        Membershiptbl membership = membershiptblRepository.findByemail(user);
        RegisterVO vo = new RegisterVO(membership);
        mv.addObject("memberVO", vo);
        mv.setViewName("user/mypage/changeInfo");
        return mv;
    }

    @RequestMapping("/charge")
    public String charge() {
        return "user/mypage/charge";
    }

    @RequestMapping("/charge_money")
    public String charge_money(Integer amount, HttpServletRequest request) {
        System.out.println(amount);
        HttpSession session = request.getSession();
        if (session.getAttribute("logStatus") == null) {
            return "user/login/login";
        }
        Membershiptbl membershipTBL = membershiptblRepository.findByemail((String) session.getAttribute("logEmail"));
        System.out.println(membershipTBL);
        membershiptblRepository.UpdateDreampayPlus(amount, membershipTBL.getNo_membership());
        return "user/mypage/charge";
    }

    @RequestMapping("/changeSuccess")
    public String changeSuccess() {
        return "user/mypage/mypage";
    }

    @RequestMapping("/cart")
    public ModelAndView cart(HttpServletRequest request) {
        final int CARDSPERPAGE = 15;
        int cardNum = 0, pageNum;
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/mypage/cart");
        HttpSession session = request.getSession();
        Membershiptbl membershipTBL = membershiptblRepository.findByemail((String) session.getAttribute("logEmail"));
        Carttbl carttbls = cartRepository.findByno_membership(membershipTBL.getNo_membership());
        List<Cartpaintingtbl> cartpaintingtblList = cartpaintingRepository.findByno_cart(carttbls.getNo_cart());

        List<Paintingtbl> paintingtblList = new ArrayList<>();
        for (Cartpaintingtbl cartpaintingtbl : cartpaintingtblList) {
            Optional<Paintingtbl> optional = paintingRepository.findById(cartpaintingtbl.getNo_painting());
            Paintingtbl paintingtbl = optional.get();
            paintingtblList.add(paintingtbl);
        }
        List<CardVO> cardVOList = new ArrayList<>();
        for (Paintingtbl paintingtbl : paintingtblList) {
            CardVO cardVO = new CardVO();
            cardVO.setNo_painting(paintingtbl.getNo_painting().toString());
            Membershiptbl membershiptbl = membershiptblRepository.getById(paintingtbl.getNo_membership());
            cardVO.setAvatarimg(membershiptbl.getImg() + "/avatarimg/avatarimg.jpg");
            cardVO.setPaintingmimg(membershiptbl.getImg() + "/paintingimg/" + paintingtbl.getPname() + "/0.jpg");
            cardVO.setNickname(membershiptbl.getNickname());
            cardVO.setPname(paintingtbl.getPname());
            cardVO.setCommentNumber(commentRepository.countByno_painting(paintingtbl.getNo_painting()));
            List<String> comments = commentRepository.findCommenttbl(paintingtbl.getNo_painting());
            List<CommentVO> commentVOlist = new ArrayList<>();
            for (String comment : comments) {
                List<String> comment_member = Arrays.asList(comment.split(","));
                Membershiptbl comment_membership = membershiptblRepository.getById(Integer.parseInt(comment_member.get(1)));
                CommentVO commentVO = new CommentVO();
                commentVO.setAvatarimg(comment_membership.getImg() + "/avatarimg/avatarimg.jpg");
                commentVO.setAuthor(comment_membership.getNickname());
                commentVO.setDate("1H");
                commentVO.setComments(comment_member.get(0));
                commentVO.setNo_membership(comment_membership.getNo_membership());
                commentVOlist.add(commentVO);
            }
            cardVO.setCommentVOList(commentVOlist);
            cardVOList.add(cardVO);
            cardNum++;
        }
        pageNum = cardNum / CARDSPERPAGE + 1;
        mv.setViewName("user/mypage/cart");
        mv.addObject("cardVOlist", cardVOList);
        mv.addObject("pageNum", pageNum);
        return mv;
    }

    @RequestMapping("/buylist")
    public ModelAndView buylist(HttpServletRequest request) {
        final int CARDSPERPAGE = 15;
        int cardNum = 0, pageNum;
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        Membershiptbl membershiptbl = membershiptblRepository.findByemail((String) session.getAttribute("logEmail"));
        List<Paymenttbl> paymenttbls = paymentRepository.findByno_membership(membershiptbl.getNo_membership());

        List<Paintingtbl> paintingtblList = new ArrayList<>();
        for (Paymenttbl paymenttbl : paymenttbls) {
            Optional<Paintingtbl> optional = paintingRepository.findById(paymenttbl.getNo_painting());
            Paintingtbl paintingtbl = optional.get();
            paintingtblList.add(paintingtbl);
        }
        List<CardVO> cardVOList = new ArrayList<>();
        for (Paintingtbl paintingtbl : paintingtblList) {
            CardVO cardVO = new CardVO();
            cardVO.setNo_painting(paintingtbl.getNo_painting().toString());
            Membershiptbl mtbl = membershiptblRepository.getById(paintingtbl.getNo_membership());
            cardVO.setAvatarimg(mtbl.getImg() + "/avatarimg/avatarimg.jpg");
            cardVO.setPaintingmimg(mtbl.getImg() + "/paintingimg/" + paintingtbl.getPname() + "/0.jpg");
            cardVO.setNickname(mtbl.getNickname());
            cardVO.setPname(paintingtbl.getPname());
            cardVO.setCommentNumber(commentRepository.countByno_painting(paintingtbl.getNo_painting()));
            List<String> comments = commentRepository.findCommenttbl(paintingtbl.getNo_painting());
            List<CommentVO> commentVOlist = new ArrayList<>();
            for (String comment : comments) {
                List<String> comment_member = Arrays.asList(comment.split(","));
                Membershiptbl comment_membership = membershiptblRepository.getById(Integer.parseInt(comment_member.get(1)));
                CommentVO commentVO = new CommentVO();
                commentVO.setAvatarimg(comment_membership.getImg() + "/avatarimg/avatarimg.jpg");
                commentVO.setAuthor(comment_membership.getNickname());
                commentVO.setDate("1H");
                commentVO.setComments(comment_member.get(0));
                commentVO.setNo_membership(comment_membership.getNo_membership());
                commentVOlist.add(commentVO);
            }
            cardVO.setCommentVOList(commentVOlist);
            cardVOList.add(cardVO);
            cardNum++;
        }
        pageNum = cardNum / CARDSPERPAGE + 1;
        mv.setViewName("user/mypage/buylist");
        mv.addObject("cardVOlist", cardVOList);
        mv.addObject("pageNum", pageNum);
        return mv;
    }

    @RequestMapping("/selllist")
    public ModelAndView selllist(HttpServletRequest request) {
        final int CARDSPERPAGE = 15;
        int cardNum = 0, pageNum;
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        System.out.println((String) session.getAttribute("logEmail"));
        Membershiptbl membershiptbl = membershiptblRepository.findByemail((String) session.getAttribute("logEmail"));
        System.out.println(membershiptbl);
        List<Paintingtbl> paintingtblList = paintingRepository.findbyno_membership(membershiptbl.getNo_membership());
        System.out.println(paintingtblList);
        List<CardVO> cardVOList = new ArrayList<>();
        for (Paintingtbl paintingtbl : paintingtblList) {
            CardVO cardVO = new CardVO();
            cardVO.setNo_painting(paintingtbl.getNo_painting().toString());
            Membershiptbl mtbl = membershiptblRepository.getById(paintingtbl.getNo_membership());
            cardVO.setAvatarimg(mtbl.getImg() + "/avatarimg/avatarimg.jpg");
            cardVO.setPaintingmimg(mtbl.getImg() + "/paintingimg/" + paintingtbl.getPname() + "/0.jpg");
            cardVO.setNickname(mtbl.getNickname());
            cardVO.setPname(paintingtbl.getPname());
            cardVO.setCommentNumber(commentRepository.countByno_painting(paintingtbl.getNo_painting()));
            List<String> comments = commentRepository.findCommenttbl(paintingtbl.getNo_painting());
            List<CommentVO> commentVOlist = new ArrayList<>();
            for (String comment : comments) {
                List<String> comment_member = Arrays.asList(comment.split(","));
                Membershiptbl comment_membership = membershiptblRepository.getById(Integer.parseInt(comment_member.get(1)));
                CommentVO commentVO = new CommentVO();
                commentVO.setAvatarimg(comment_membership.getImg() + "/avatarimg/avatarimg.jpg");
                commentVO.setAuthor(comment_membership.getNickname());
                commentVO.setDate("1H");
                commentVO.setComments(comment_member.get(0));
                commentVO.setNo_membership(comment_membership.getNo_membership());
                commentVOlist.add(commentVO);
            }
            cardVO.setCommentVOList(commentVOlist);
            cardVOList.add(cardVO);
            cardNum++;
        }
        pageNum = cardNum / CARDSPERPAGE + 1;
        mv.setViewName("user/mypage/selllist");
        mv.addObject("cardVOlist", cardVOList);
        mv.addObject("pageNum", pageNum);
        return mv;
    }
    @RequestMapping("/qalist")
    public String qalist() {
        return "user/mypage/qalist";
    }
}
