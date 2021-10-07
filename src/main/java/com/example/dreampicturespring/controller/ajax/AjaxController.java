package com.example.dreampicturespring.controller.ajax;

import com.example.dreampicturespring.repository.MembershiptblRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class AjaxController {

	@Autowired
	MembershiptblRepository membershiptblRepository;


	@RequestMapping(value="/ajaxStr",method=RequestMethod.GET, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String ajaxString() {
		int no = 1234;
		String username="홍길동";
		String tel = "010-1234-5678";
		String addr = "서울시 마포구 백범로";
		String jsonData = "{\"no\":\""+no+"\",\"username\":\""+username+"\"";
		jsonData +=",\"tel\":\""+tel+"\",\"addr\":\""+addr+"\"}";
		return jsonData;
	}
}