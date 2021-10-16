package com.example.dreampicturespring.controller.ajax;

import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Paintingtbl;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.repository.PaintingRepository;
import com.example.dreampicturespring.vo.CardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	public String picture_finder(Model model, String pname, String style, String theme, Integer width, Integer height, Integer price, Integer status){

		List<Paintingtbl> paintingtbls = paintingRepository.findPainting(makeNotNull(pname),makeNotNull(style),makeNotNull(theme),width,height,price);
		List<Membershiptbl> membershiptbls = new ArrayList<>();
		List<CardVO> cardVOList = new ArrayList<>();

		for(int i=0;i<paintingtbls.size();i++){ membershiptbls.add(membershiptblRepository.getById(paintingtbls.get(i).getNo_membership())); }
		for(int i=0;i<paintingtbls.size();i++){ CardVO vo = new CardVO(paintingtbls.get(i),membershiptbls.get(i));cardVOList.add(vo);}
		model.addAttribute("cardVOlist",cardVOList);
		return "user/viewAjax";
	}

	private String makeNotNull(String target){
		if(StringUtils.isEmpty(target)) return target = null;
		return target;
	}
}