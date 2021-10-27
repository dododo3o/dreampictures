package com.example.dreampicturespring.controller.sell;
import com.example.dreampicturespring.entity.Cartpaintingtbl;
import com.example.dreampicturespring.entity.Carttbl;
import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Paintingtbl;
import com.example.dreampicturespring.repository.CartRepository;
import com.example.dreampicturespring.repository.CartpaintingRepository;
import com.example.dreampicturespring.repository.MembershiptblRepository;
import com.example.dreampicturespring.repository.PaintingRepository;
import com.example.dreampicturespring.vo.CardVO;
import com.example.dreampicturespring.vo.SellVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class SellController {
    @Autowired
    PaintingRepository paintingRepository;
    @Autowired
    MembershiptblRepository membershiptblRepository;
    @Autowired
    CartRepository cartRepository;
    @Autowired
    CartpaintingRepository cartpaintingRepository;

    @RequestMapping("/test")
    public String test() { return "user/test"; }

    @RequestMapping("/sell")
    public String sell() { return "user/sell/sell"; }

    @RequestMapping(value = "/sell_success",method = RequestMethod.POST, produces ="application/text;charset=UTF-8")
    public String sell_success(SellVO vo,String production, HttpServletRequest req) {
        String user = req.getSession().getAttribute("logEmail").toString();
        Membershiptbl ms = membershiptblRepository.findByemail(user);
        LocalDate productionLocalDate = LocalDate.parse(production);
        Paintingtbl paintingtbl = new Paintingtbl(vo,ms.getNo_membership(),productionLocalDate);
        paintingRepository.save(paintingtbl);

        return "redirect:/buy";
    }

    @RequestMapping(value = "/painting_delete",method = RequestMethod.GET, produces ="application/text;charset=UTF-8")
    @ResponseBody
    public String painting_delete(Model model, HttpServletRequest request, Integer num) {

        HttpSession session = request.getSession();
        Membershiptbl membershipTBL = membershiptblRepository.findByemail((String) session.getAttribute("logEmail"));
        if(membershipTBL.getNo_membership()==null){ return "fail"; }
        paintingRepository.deleteById(num);
        return "success";
    }
}