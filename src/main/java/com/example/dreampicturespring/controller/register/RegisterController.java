package com.example.dreampicturespring.controller.register;

import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.vo.RegisterVO;
import com.example.dreampicturespring.vo.RegisterVO1;
import com.example.dreampicturespring.vo.RegisterVO2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@Controller
public class RegisterController {


    @Autowired
    MembershiptblRepository membershiptblRepository;

    RegisterVO vo = new RegisterVO();

    @RequestMapping("/register1")
    public String register1() { return "view/register/register1"; }
//
//    @RequestMapping("/register2")
//    public String register2(RegisterVO1 vo1) {
//        vo.setEmail(vo1.getEmail());
//        vo.setPwd(vo1.getPwd());
//        vo.setTel(vo1.getTel());
//        return "view/register/register2";
//    }

    @RequestMapping("/register2")
    public String register2() {
        return "view/register/register2";
    }

    @RequestMapping("/register_success")
    public String register_success(HttpServletRequest request) throws IOException {
        String path = "D:\\dreampicture_spring\\src\\main\\resources\\user";
        File newfolder = new File(path+"\\"+"iuttn1234");
        newfolder.mkdir();

        File avatarfolder = new File(path+"\\"+"iuttn1234"+"\\avatarimg");
        avatarfolder.mkdir();

        File paintingfolder = new File(path+"\\"+"iuttn1234"+"\\paintingimg");
        paintingfolder.mkdir();


        MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
        MultipartFile avatarImg = mr.getFile("filename");


        String fname = avatarImg.getOriginalFilename();
        int point = fname.lastIndexOf(".");//마지막 점의 위치를 구해라
        String orgFileExt = fname.substring(point+1);
        String fixedFileName = "avatarimg."+orgFileExt;

        path=path+"\\"+"iuttn1234"+"\\avatarimg";
        File newFileObj = new File(path,fixedFileName);

        try { avatarImg.transferTo(newFileObj); } catch (Exception e) { }

        return "view/login/login";
    }
}