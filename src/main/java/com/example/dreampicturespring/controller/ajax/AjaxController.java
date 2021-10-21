package com.example.dreampicturespring.controller.ajax;


import com.example.dreampicturespring.entity.*;
import com.example.dreampicturespring.repository.CommentRepository;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.repository.PaintingRepository;
import com.example.dreampicturespring.repository.QaRepository;
import com.example.dreampicturespring.vo.CardVO;
import com.example.dreampicturespring.vo.CommentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
public class AjaxController {

	@Autowired
	MembershiptblRepository membershiptblRepository;
	@Autowired
	PaintingRepository paintingRepository;
	@Autowired
	QaRepository qaRepository;
	@Autowired
	CommentRepository commentRepository;


	@RequestMapping(value="/ajax_email_check",method=RequestMethod.GET, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String email_check(String email) { return membershiptblRepository.existsByemail(email) ? "N" : "Y"; }

	@RequestMapping(value="/ajax_tel_check",method=RequestMethod.GET, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String tel_check(String tel) { return membershiptblRepository.existsBytel(tel) ? "N" : "Y"; }

	@RequestMapping(value = "/ajax_nickname_check",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
	@ResponseBody
	public String nickname_check(String nickname){return membershiptblRepository.existsBynickname(nickname) ? "N" : "Y"; }

	@RequestMapping(value = "/ajax_picture_finder",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
	public String picture_find(Model model, String pname, String style, String theme, Integer width, Integer height, Integer price, Integer status){

		List<Paintingtbl> paintingtbls = paintingRepository.findPainting(makeNotNull(pname),makeNotNull(style),makeNotNull(theme),width,height,price);
		List<Membershiptbl> membershiptbls = new ArrayList<>();
		List<CardVO> cardVOList = new ArrayList<>();

		for(int i=0;i<paintingtbls.size();i++){ membershiptbls.add(membershiptblRepository.getById(paintingtbls.get(i).getNo_membership())); }
		for(int i=0;i<paintingtbls.size();i++){ CardVO vo = new CardVO(paintingtbls.get(i),membershiptbls.get(i));cardVOList.add(vo);}
		model.addAttribute("cardVOlist",cardVOList);
		return "user/ajax/picture_find";
	}

	@RequestMapping(value = "/ajax_pay",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
	@ResponseBody
	public String pay(Model model,Integer point,Integer buyer,Integer seller,Integer paint){

		System.out.println(point);
		System.out.println(buyer);
		System.out.println(seller);
		Optional<Membershiptbl> MTBL_buyer = membershiptblRepository.findById(buyer);
		Membershiptbl buyerTBL =MTBL_buyer.get();
		buyerTBL.dreampayCal(point,false);
		membershiptblRepository.save(buyerTBL);


		Optional<Membershiptbl> MTBL_seller = membershiptblRepository.findById(seller);
		Membershiptbl sellerTBL =MTBL_seller.get();
		sellerTBL.dreampayCal(point,true);
		membershiptblRepository.save(sellerTBL);

		Optional<Paintingtbl> PTBL = paintingRepository.findById(paint);
		Paintingtbl paintingtbl = PTBL.get();
		paintingtbl.setStatus(1);
		paintingRepository.save(paintingtbl);

		return "user/redirect/pay_success";
	}

	@RequestMapping(value = "/ajax_request_QA",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
	public String request_Integer(Model model,HttpServletRequest request, String question, Integer status){
		HttpSession session = request.getSession();
		Membershiptbl membershipTBL = membershiptblRepository.findByemail((String) session.getAttribute("logEmail"));
		if(membershipTBL == null){ return "user/redirect/not_login"; }
		Qatbl qatbl = new Qatbl(membershipTBL, question, status);
		qaRepository.save(qatbl);
		return "redirect:/notice";
	}

	@RequestMapping(value = "/ajax_comment_finder",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
	public String comment_finder(Model model, Integer no_painting){
		List<String> comments = commentRepository.findCommenttbl(no_painting);
		List<CommentVO> commentVOlist = new ArrayList<>();
		for(String comment : comments){
			List<String> obj = Arrays.asList(comment.split(","));
			Membershiptbl membershiptb = membershiptblRepository.getById(Integer.parseInt(obj.get(1)));
			CommentVO commentVO = new CommentVO();
			commentVO.setAvatarimg(membershiptb.getImg()+"/avatarimg/avatarimg.jpg");
			commentVO.setAuthor(membershiptb.getNickname());
			commentVO.setDate("1H");
			commentVO.setComments(obj.get(0));
			commentVOlist.add(commentVO);
		}
 		model.addAttribute("commentVOlist",commentVOlist);
		return "user/ajax/comment_find";
	}

	@RequestMapping(value = "/ajax_comment_add",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
	public String comment_add(Model model,HttpServletRequest request,String comment,Integer no_painting){
		HttpSession session =request.getSession();
		Membershiptbl membershipTBL = membershiptblRepository.findByemail((String) session.getAttribute("logEmail"));
		if(membershipTBL ==null){ return "user/redirect/not_login"; }
		Commentstbl commentstbl = new Commentstbl();
		commentstbl.setNo_membership(membershipTBL.getNo_membership());
		commentstbl.setComments(comment);
		commentstbl.setNo_painting(no_painting);
		commentRepository.save(commentstbl);
		return "redirect:/buy";
	}

	private String makeNotNull(String target){
		if(StringUtils.isEmpty(target)) return target = null;
		return target;
	}
}