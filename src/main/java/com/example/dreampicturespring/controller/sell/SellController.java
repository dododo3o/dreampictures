package com.example.dreampicturespring.controller.sell;
import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Paintingtbl;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.repository.PaintingRepository;
import com.example.dreampicturespring.vo.SellVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;

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

    @RequestMapping(value = "/sell_success",method = RequestMethod.POST, produces ="application/text;charset=UTF-8")
    public String sell_success(SellVO vo, HttpServletRequest req) {
        String user = req.getSession().getAttribute("logEmail").toString();
        Membershiptbl ms = membershiptblRepository.findByemail(user);
        Paintingtbl paintingtbl = new Paintingtbl(vo,ms.getNo_membership());
        paintingRepository.save(paintingtbl);
        return "user/sell/sell";
    }
}