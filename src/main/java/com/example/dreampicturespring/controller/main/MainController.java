package com.example.dreampicturespring.controller.main;



import com.example.dreampicturespring.join.JoinFirstDto;
import com.example.dreampicturespring.validator.JoinFirstValidator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {

    @RequestMapping("/")
    public String root() throws Exception{
        return "view/main/main";
    }

    @RequestMapping("/test4")
    public String test4(@ModelAttribute("dto") JoinFirstDto dto, HttpServletRequest request, BindingResult result){

        String page =  "view/myView1";
        JoinFirstValidator validator = new JoinFirstValidator();
        validator.validate(dto, result);
        if(result.hasErrors()){ page = "/test3";}
        return page;
    }
}
