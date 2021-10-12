package com.example.dreampicturespring.controller.sell;


import com.example.dreampicturespring.repository.PaintingRepository;
import com.example.dreampicturespring.vo.PaintingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
public class SellController {
    @Autowired
    PaintingRepository paintingRepository;

    @RequestMapping("/sell")

    public String sell() { return "user/sell/sell"; }

    @RequestMapping("/sell_success")
    public String sell(Model model, HttpServletRequest req, PaintingVO paintingVO) throws IOException {
        //1.submit 해준 폼 데이터들을 vo에 넣어주는작업
        String subject = req.getParameter("subject_txt");
        System.out.println(subject);
        String style = req.getParameter("style_val");
        String theme =req.getParameter(paintingVO.getTheme());
        System.out.println(theme);

        return "user/buy/buy";

    }
}
