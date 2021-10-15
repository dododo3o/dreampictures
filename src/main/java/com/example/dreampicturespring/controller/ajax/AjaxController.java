package com.example.dreampicturespring.controller.ajax;

import com.example.dreampicturespring.entity.Paintingtbl;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.repository.PaintingRepository;
import com.example.dreampicturespring.vo.CardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class AjaxController {

	@Autowired
	MembershiptblRepository membershiptblRepository;
	@Autowired
	PaintingRepository paintingRepository;

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
	@ResponseBody
	public String picture_finder(String pname,String style,String theme,Integer width,Integer height,Integer price,Integer status){
		List<Paintingtbl> paintingtbls = paintingRepository.findPainting(makeNotNull(pname),makeNotNull(style),makeNotNull(theme),width,height,price);
//
//		membershiptblRepository.findById()
//
//		List<CardVO> cardVOList = new ArrayList<>();
//		CardVO vo = new CardVO(paintingtbls);

		System.out.println(paintingtbls.get(0));




		return "Y";
	}

	private String makeNotNull(String target){
		if(StringUtils.isEmpty(target)) return target = null;
		return target;
	}
}