package com.example.dreampicturespring.controller.sell;

import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Paintingtbl;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.repository.PaintingRepository;
import com.example.dreampicturespring.vo.SellVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class SellController {
    @Autowired
    PaintingRepository paintingRepository;
    @Autowired
    MembershiptblRepository membershiptblRepository;

    @RequestMapping("/test")
    public String test() { return "user/test"; }


    @RequestMapping("/sell")
    public String sell() { return "user/sell/sell"; }

    @RequestMapping("/sell_success")
    public ModelAndView sell_success(SellVO vo, HttpServletRequest req) throws IOException {
        String user = req.getSession().getAttribute("logEmail").toString();
        String path = "D:\\dreampicture_spring\\src\\main\\resources\\static\\user\\"+user+"\\paintingimg\\"+vo.getPname();
        File newPaintingFolder =  new File(path);
        newPaintingFolder.mkdir();
        MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
        List<MultipartFile> files = mr.getFiles("filename");
        for(int i=0;i<files.size();i++) {
            MultipartFile mf = files.get(i);
            String fname = mf.getOriginalFilename();
            if(fname==null || fname.equals("")) continue;
            int point = fname.lastIndexOf(".");//마지막 점의 위치를 구해라
            String orgFileExt = fname.substring(point+1);
            String fixedFileName = i+"."+orgFileExt;
            File newFileObj = new File(path,fixedFileName);
            try {mf.transferTo(newFileObj);}catch (Exception e){}
        }
        Membershiptbl ms = membershiptblRepository.findByemail(user);
        Paintingtbl paintingtbl = new Paintingtbl(vo,ms.getNo_membership());
        paintingRepository.save(paintingtbl);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/");

        return mv;
    }


}
