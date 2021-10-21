package com.example.dreampicturespring.controller.admin;


import com.example.dreampicturespring.entity.Admintbl;
import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Noticetbl;
import com.example.dreampicturespring.entity.Qatbl;
import com.example.dreampicturespring.repository.AdminRepository;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.repository.NoticeRepository;
import com.example.dreampicturespring.repository.QaRepository;
import com.example.dreampicturespring.vo.LoginAdminVO;
import com.example.dreampicturespring.vo.LoginVO;
import com.example.dreampicturespring.vo.NoticeVO;
import com.example.dreampicturespring.vo.QaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class AdminController {

    @Autowired
    AdminRepository adminRepository;

    @Autowired
    NoticeRepository noticeRepository;

    @Autowired
    QaRepository qaRepository;

    @Autowired
    MembershiptblRepository membershiptblRepository;



    @RequestMapping("/admin/login")
    public String admin_login(Model model){ return "user/admin/login";}

    @RequestMapping("/admin/login_check")
    public ModelAndView admin_login_check(LoginAdminVO vo, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        String adminPwd = adminRepository.findByadminID(vo.getAdmin());
        if(adminPwd ==null){
            mv.setViewName("user/redirect/alert1");
            mv.addObject("msg","관리자 정보를 다시 확인해주세요.");
            mv.addObject("url","/admin/login");
            return mv;
        }
        else{
            if(!adminPwd.equals(vo.getAdminpwd())) return mv;
            else{
                HttpSession session =request.getSession();
                session.setAttribute("adminLogin",vo.getAdmin());
                session.setAttribute("adminLoginStatus","Y");
                mv.setViewName("user/admin/main");
                return mv;
            }
        }
    }

    @RequestMapping("/admin/logout")
    public String logout(HttpServletRequest request){
        HttpSession session =request.getSession();
        session.invalidate();
        return "user/admin/login";
    }

    @RequestMapping("/admin/main")
    public String admin_main(Model model){ return "user/admin/main";}

    @RequestMapping("/admin/notice")
    public ModelAndView admin_notice(Model model){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/admin/notice");
        List<Noticetbl> noticetblList =  noticeRepository.findAll();
        List<NoticeVO> noticeVOList = new ArrayList<>();

        for(Noticetbl noticetbl :noticetblList){
            NoticeVO noticeVO = new NoticeVO();
            noticeVO.setTitle(noticetbl.getTitle());
            noticeVO.setWritedate(noticetbl.getWritedate());
            noticeVO.setContent(noticetbl.getContent());
            noticeVOList.add(noticeVO);
        }

        mv.addObject("noticeVOList",noticeVOList);
        return mv;
    }

//    @RequestMapping("/admin/qa")
//    public String admin_qa(Model model){ return "user/admin/qa";}

    @RequestMapping("/admin/qa")
    public ModelAndView admin_qa() {
        final int CARDSPERPAGE = 15;
        int cardNum = 0, pageNum;

        ModelAndView mv = new ModelAndView();

        List<Qatbl> qatblList = qaRepository.findAll();
        List<QaVO> QaVOlist = new ArrayList<>();

        for (Qatbl qatbl : qatblList) {
            QaVO vo = new QaVO();
            vo.parser(qatbl.getCategory());
            Optional<Membershiptbl> membershiptbl = membershiptblRepository.findById(qatbl.getNo_membership());
            Membershiptbl writer = membershiptbl.get();
            vo.setNickname(writer.getNickname());
            vo.setContent(qatbl.getContent());
            vo.setAnswer(qatbl.getAnswer());
            QaVOlist.add(vo);
        }
        pageNum = cardNum / CARDSPERPAGE + 1;
        mv.setViewName("user/admin/qa");
        mv.addObject("QaVOlist", QaVOlist);
        mv.addObject("pageNum", pageNum);
        return mv;
    }


    @RequestMapping("/admin/blacklist")
    public String admin_blacklist(Model model){ return "user/admin/blacklist";}

    @RequestMapping("/admin/salesHistory")
    public String admin_salesHistory(Model model){ return "user/admin/salesHistory";}

    @RequestMapping("/admin/allmembers")
    public String admin_allmembers(Model model){ return "user/admin/allmembers";}

    @RequestMapping("/admin/report")
    public String admin_report(Model model){ return "user/admin/report";}

}
