package com.example.dreampicturespring.controller.main;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;

@Controller
public class MainController {

    @RequestMapping("/")
    public String root(HttpServletRequest request) throws Exception{
        return "user/main/main";
    }
}
