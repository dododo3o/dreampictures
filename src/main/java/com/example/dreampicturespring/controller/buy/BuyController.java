package com.example.dreampicturespring.controller.buy;
import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Paintingtbl;
import com.example.dreampicturespring.repository.CommentRepository;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.repository.PaintingRepository;
import com.example.dreampicturespring.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
    @Autowired
    CommentRepository commentRepository;

    @RequestMapping("/buy")
    public ModelAndView buy(){
        final int CARDSPERPAGE = 15;
        Long cardNum,pageNum;
        ModelAndView mv = new ModelAndView();
        List<Paintingtbl> paintingtbls = paintingRepository.findpage(0);
        List<CardVO> cardVOList = new ArrayList<>();
        List<Membershiptbl> membershiptbls = new ArrayList<>();
        for(int i=0;i<paintingtbls.size();i++){ membershiptbls.add(membershiptblRepository.getById(paintingtbls.get(i).getNo_membership())); }
        int count = 0;
        for(Paintingtbl paintingtbl : paintingtbls){
            CardVO cardVO = new CardVO();
            cardVO.setNo_painting(paintingtbl.getNo_painting().toString());
            cardVO.setAvatarimg(membershiptbls.get(count).getImg());
            cardVO.setPaintingmimg(paintingtbl.getUrl());
            cardVO.setNickname(membershiptbls.get(count).getNickname());
            cardVO.setPname(paintingtbl.getPname());
            cardVO.setCommentNumber(commentRepository.countByno_painting(paintingtbl.getNo_painting()));
            List<String> comments = commentRepository.findCommenttbl(paintingtbl.getNo_painting());
            List<CommentVO> commentVOlist = new ArrayList<>();
            for(String comment : comments){
                List<String> comment_member = Arrays.asList(comment.split(","));
                CommentVO commentVO = new CommentVO();
                Integer no_comment = commentRepository.findByNo_comment(Integer.parseInt(comment_member.get(1)),paintingtbl.getNo_painting());
                Membershiptbl membershiptbl = membershiptblRepository.getById(Integer.parseInt(comment_member.get(1)));
                commentVO.setNo_comment(no_comment);
                commentVO.setAvatarimg(membershiptbl.getImg());
                commentVO.setAuthor(membershiptbl.getNickname());
                commentVO.setDate("1H");
                commentVO.setComments(comment_member.get(0));
                commentVO.setNo_membership(membershiptbl.getNo_membership());
                commentVOlist.add(commentVO);
            }
            cardVO.setCommentVOList(commentVOlist);
            cardVOList.add(cardVO);
            count++;
        }
        cardNum = paintingRepository.count();
        pageNum = cardNum/CARDSPERPAGE;
        mv.setViewName("user/buy/buy");
        mv.addObject("cardVOlist",cardVOList);
        mv.addObject("pageNum",pageNum);
        return mv;
    }

    @RequestMapping("/buy_picture/{no_painting}")
    public ModelAndView buy_picture(HttpServletRequest request, @PathVariable String no_painting) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/buy/buy_picture");
        Optional<Paintingtbl> PTBL = paintingRepository.findById(Integer.parseInt(no_painting));
        Paintingtbl paintingTBL = PTBL.get();
        Optional<Membershiptbl> MTBL = membershiptblRepository.findById(paintingTBL.getNo_membership());
        Membershiptbl membershipTBL = MTBL.get();
        PaintingVO paintingVO = new PaintingVO(paintingTBL,membershipTBL);
        mv.addObject("paintingVO",paintingVO);
        return mv;
    }

    @RequestMapping("/buy_payment/{no_painting}")
    public ModelAndView buy_payment(HttpServletRequest request, @PathVariable String no_painting) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/buy/buy_payment");
        HttpSession session =request.getSession();
        if(session.getAttribute("logStatus") == null){
            session.setAttribute("location","/buy_picture/"+no_painting);
            mv.setViewName("user/login/login");
            return mv;
        }
        Optional<Paintingtbl> PTBL = paintingRepository.findById(Integer.parseInt(no_painting));
        Paintingtbl paintingTBL = PTBL.get();

        Optional<Membershiptbl> sellerMembershipTBL = membershiptblRepository.findById((paintingTBL.getNo_membership()));
        Membershiptbl sellerMembershiptbl = sellerMembershipTBL.get();
        Membershiptbl membershipTBL = membershiptblRepository.findByemail((String) session.getAttribute("logEmail"));

        PaymentVO paymentVO = new PaymentVO(paintingTBL,membershipTBL,sellerMembershiptbl);
        mv.addObject("paymentVO",paymentVO);
        return mv;
    }

    @RequestMapping("/buy_transaction/{no_painting}")
    public ModelAndView buy_transaction(HttpServletRequest request, @PathVariable String no_painting) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/buy/buy_transaction");
        HttpSession session =request.getSession();
        if(session.getAttribute("logStatus") == null){
            mv.setViewName("user/login/login");
            return mv;
        }
        Optional<Paintingtbl> PTBL = paintingRepository.findById(Integer.parseInt(no_painting));
        Paintingtbl paintingTBL = PTBL.get();

        Optional<Membershiptbl> sellerMembershipTBL = membershiptblRepository.findById((paintingTBL.getNo_membership()));
        Membershiptbl sellerMembershiptbl = sellerMembershipTBL.get();
        Membershiptbl buyerMembershipTBL = membershiptblRepository.findByemail((String) session.getAttribute("logEmail"));

        TransactionVO transactionVO = new TransactionVO(paintingTBL,sellerMembershiptbl,buyerMembershipTBL);
        mv.addObject("transactionVO",transactionVO);
        return mv;
    }

    @RequestMapping(value = "/buy_success",method = RequestMethod.POST, produces ="application/text;charset=UTF-8")
    @ResponseBody
    public ModelAndView buy_success(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/redirect/alert1");
        mv.addObject("msg","성공적으로 구매되었습니다.");
        mv.addObject("url","user/mypage/mypage");
        return mv;
    }
    @RequestMapping(value = "/reply_delete",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
    @ResponseBody
    public String reply_delete(Model model, HttpServletRequest request, Integer num) {

        HttpSession session = request.getSession();
        Membershiptbl membershipTBL = membershiptblRepository.findByemail((String) session.getAttribute("logEmail"));
        if(membershipTBL.getNo_membership()!=num){ return "fail"; }

        commentRepository.deleteById(num);

        List<Paintingtbl> paintingtbls = paintingRepository.findAll();
        List<Membershiptbl> membershiptbls = new ArrayList<>();
        List<CardVO> cardVOList = new ArrayList<>();

        for(int i=0;i<paintingtbls.size();i++){ membershiptbls.add(membershiptblRepository.getById(paintingtbls.get(i).getNo_membership())); }
        for(int i=0;i<paintingtbls.size();i++){ CardVO vo = new CardVO(paintingtbls.get(i),membershiptbls.get(i));cardVOList.add(vo);}
        model.addAttribute("cardVOlist",cardVOList);

        return "success";
    }
}