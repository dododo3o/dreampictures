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

    @RequestMapping(value = "/sell_success", method = RequestMethod.POST)
    public ModelAndView sell_success(String pname, Integer height, Integer width, Integer price, String production, String exp,String style, String theme, HttpServletRequest req)  throws IOException {
        String user = req.getSession().getAttribute("logEmail").toString();
        System.out.println(pname);
        System.out.println(height);
        System.out.println(width);
        System.out.println(price);
        System.out.println(production);
        System.out.println(exp);
        System.out.println(style);
        System.out.println(theme);

        Membershiptbl ms = membershiptblRepository.findByemail(user);
        System.out.println(user);
//        Paintingtbl paintingtbl = new Paintingtbl(vo,ms.getNo_membership());
//        System.out.println("patingtbl"+paintingtbl);
//        paintingRepository.save(paintingtbl);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/");
        return mv;
    }
}
