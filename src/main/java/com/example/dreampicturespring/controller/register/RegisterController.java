package com.example.dreampicturespring.controller.register;
import com.example.dreampicturespring.entity.Carttbl;
import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.repository.CartRepository;
import com.example.dreampicturespring.repository.CartpaintingRepository;
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

@Controller
public class RegisterController {

    @Autowired
    MembershiptblRepository membershiptblRepository;
    @Autowired
    CartRepository cartRepository;
    @Autowired
    CartpaintingRepository cartpaintingRepository;

    RegisterVO vo = new RegisterVO();

    @RequestMapping("/register1")
    public String register1() { return "user/register/register1"; }

    @RequestMapping("/register2")
    public String register2(RegisterVO1 vo1) {
        vo.setEmail(vo1.getEmail());
        vo.setPwd(vo1.getPwd());
        vo.setTel(vo1.getTel());
        return "user/register/register2";
    }

    @RequestMapping("/register_success")
    public String register_success(HttpServletRequest request,RegisterVO2 vo2) throws IOException {

        vo.setAddr(vo2.getAddr());
        vo.setAddrdetail(vo2.getDetailAddr());
        vo.setNickname(vo2.getNickname());
        vo.setImg("/resources/user/"+vo.getEmail());

        String path = "D:\\dreampicture_spring\\src\\main\\resources\\static\\user";
        File newfolder = new File(path+"\\"+vo.getEmail());
        newfolder.mkdir();

        File avatarfolder = new File(path+"\\"+vo.getEmail()+"\\avatarimg");
        avatarfolder.mkdir();

        File paintingfolder = new File(path+"\\"+vo.getEmail()+"\\paintingimg");
        paintingfolder.mkdir();

        //사진 객체 가져오기
        MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
        MultipartFile avatarImg = mr.getFile("filename");

        //사진 이름 변경
        String fname = avatarImg.getOriginalFilename();
        int point = fname.lastIndexOf(".");//마지막 점의 위치를 구해라
        String orgFileExt = fname.substring(point+1);
        String fixedFileName = "avatarimg."+orgFileExt;

        //사진을 폴더로 옮기기
        path=path+"\\"+vo.getEmail()+"\\avatarimg";
        File newFileObj = new File(path,fixedFileName);
        try { avatarImg.transferTo(newFileObj); } catch (Exception e) { }

        Membershiptbl membershiptbl = new Membershiptbl(vo);
        membershiptblRepository.save(membershiptbl);

        Carttbl carttbl = new Carttbl();
        carttbl.setNo_membership(membershiptbl.getNo_membership());
        cartRepository.save(carttbl);

        return "user/login/login";
    }
}