package com.example.dreampicturespring.controller.sell;
import com.example.dreampicturespring.entity.Cartpaintingtbl;
import com.example.dreampicturespring.entity.Carttbl;
import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Paintingtbl;
import com.example.dreampicturespring.repository.*;
import com.example.dreampicturespring.vo.CardVO;
import com.example.dreampicturespring.vo.CommentVO;
import com.example.dreampicturespring.vo.SellVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
public class SellController {
    @Autowired
    PaintingRepository paintingRepository;
    @Autowired
    MembershiptblRepository membershiptblRepository;
    @Autowired
    CartRepository cartRepository;
    @Autowired
    CartpaintingRepository cartpaintingRepository;
    @Autowired
    CommentRepository commentRepository;

    @RequestMapping("/test")
    public String test() { return "user/test"; }

    @RequestMapping("/sell")
    public String sell() { return "user/sell/sell"; }

    @RequestMapping(value = "/sell_success",method = RequestMethod.POST, produces ="application/text;charset=UTF-8")
    public ModelAndView sell_success(SellVO vo, HttpServletRequest req) {
        String user = req.getSession().getAttribute("logEmail").toString();
        Membershiptbl ms = membershiptblRepository.findByemail(user);
        Paintingtbl paintingtbl_save = new Paintingtbl(vo,ms.getNo_membership());
        paintingRepository.save(paintingtbl_save);

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
        pageNum = cardNum/CARDSPERPAGE+1;
        mv.setViewName("user/buy/buy");
        mv.addObject("cardVOlist",cardVOList);
        mv.addObject("pageNum",pageNum);
        return mv;
    }

    @RequestMapping(value = "/painting_delete",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
    @ResponseBody
    public String painting_delete(Model model, HttpServletRequest request, Integer num) {

        HttpSession session = request.getSession();
        Membershiptbl membershipTBL = membershiptblRepository.findByemail((String) session.getAttribute("logEmail"));
        if(membershipTBL.getNo_membership()==null){ return "fail"; }
        paintingRepository.deleteById(num);
        return "success";
    }
}