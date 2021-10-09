package com.example.dreampicturespring.controller.ajax;

import com.example.dreampicturespring.constant.Path;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class AjaxController {

	@Autowired
	MembershiptblRepository membershiptblRepository;

	@RequestMapping(value="/ajax_email_check",method=RequestMethod.GET, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String email_check(String email) { return membershiptblRepository.existsByemail(email) ? "N" : "Y"; }

	@RequestMapping(value="/ajax_tel_check",method=RequestMethod.GET, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String tel_check(String tel) { return membershiptblRepository.existsBytel(tel) ? "N" : "Y"; }

	@RequestMapping(value = "/ajax_nickname_check",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
	@ResponseBody
	public String nickname_check(String nickname){return membershiptblRepository.existsBynickname(nickname) ? "N" : "Y"; }


	@RequestMapping(value = "/ajax_hello",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
	@ResponseBody
	public void hello(HttpServletRequest request){
		String path = Path.PROFILE.toString();
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
		List<MultipartFile> files = mr.getFiles("filename");
		List<String> fileList = new ArrayList<String>();
		if(files!=null) {
			for(int i=0;i<files.size();i++) {
				MultipartFile mf = files.get(i);
				String fname = mf.getOriginalFilename();
				if(fname!=null && !fname.equals("")) {
					File fileObj = new File(path,fname);
					File newFileObj = new File(path,fname);
					if(fileObj.exists()) {
						for(int num=1; ;num++) {
							int point = fname.lastIndexOf(".");
							String orgFileName = fname.substring(0,point);
							String orgFileExt = fname.substring(point+1);
							String newFileName = orgFileName+"("+num+")."+orgFileExt;
							newFileObj = new File(path,newFileName);
							if(!newFileObj.exists()) { break; }
						}
					}
					try { mf.transferTo(newFileObj); }catch(Exception e) {}
					fileList.add(newFileObj.getName());
				}
			}
		}
	}


}