package com.example.dreampicturespring.controller.register;

import com.example.dreampicturespring.entity.Membership;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.vo.PermissionVO;
import com.example.dreampicturespring.vo.RegisterVO;
import com.example.dreampicturespring.constant.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.List;


@Controller
public class RegisterController {


    @Autowired
    MembershiptblRepository membershiptblRepository;

    @RequestMapping("/register1")
    public String register1(){ return "view/register/register1"; }

    @RequestMapping("/register2")
    public String register2(HttpServletRequest request){
        String path = "D:\\dreampicture_spring\\src\\main\\resources\\user";
        MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
        List<MultipartFile> files = mr.getFiles("filename");
        List<String> fileList = new ArrayList<String>();//업로드된 파일명을 저장할 곳
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
                    try {
                        mf.transferTo(newFileObj);
                    }catch(Exception e) {}
                    fileList.add(newFileObj.getName());
                }
            }
        }
        return "view/register/register2";
    }

}


//
//        if(vo.getEmail().equals("iuttn123@gmail.com")){
//                model.addAttribute("msg", Msg.EMAIL);
//                model.addAttribute("url", "/register1");
//                return "view/redirect/alert1";
//                }