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
import java.util.ArrayList;
import java.util.List;


@Controller
public class RegisterController {


    @Autowired
    MembershiptblRepository membershiptblRepository;

    RegisterVO vo = new RegisterVO();

    @RequestMapping("/register1")
    public String register1() { return "view/register/register1"; }

    @RequestMapping("/register2")
    public String register2(RegisterVO1 vo1) {
        vo.setEmail(vo1.getEmail());
        vo.setPwd(vo1.getPwd());
        vo.setTel(vo1.getTel());
        return "view/register/register2";
    }

    @RequestMapping("/register_success")
    public String register_success(HttpServletRequest request) {
        String path = "D:\\dreampicture_spring\\src\\main\\resources\\user";
        MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
        List<MultipartFile> files = mr.getFiles("filename");
        List<String> fileList = new ArrayList<String>();
        if (files != null) {
            for (int i = 0; i < files.size(); i++) {
                MultipartFile mf = files.get(i);
                String filename = mf.getOriginalFilename();
                if (filename != null && !filename.equals("")) {
                    File newfile = new File(path+"\\"+vo.getEmail());
                    File fileObj = new File(path, filename);
                    File newFileObj = new File(path, filename);
                    if (fileObj.exists()) {
                        for (int num = 1; ; num++) {
                            int point = filename.lastIndexOf(".");
                            String orgFileName = filename.substring(0, point);
                            String orgFileExt = filename.substring(point + 1);
                            String newFileName = orgFileName + "(" + num + ")." + orgFileExt;
                            newFileObj = new File(path, newFileName);
                            if (!newFileObj.exists()) { break; }
                        }
                    }
                    try { mf.transferTo(newFileObj); } catch (Exception e) { }
                    fileList.add(newFileObj.getName());
                }
            }
        }
        return "view/login/login";
    }
}