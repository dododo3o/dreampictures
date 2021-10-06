package com.example.dreampicturespring.validator;

import com.example.dreampicturespring.join.JoinFirstDto;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class JoinFirstValidator implements Validator {

    String id,pw,pwCheck,email,phone;


    @Override
    public boolean supports(Class<?> clazz) {
        return JoinFirstValidator.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        JoinFirstDto joinFirstDto = new JoinFirstDto();

        id = joinFirstDto.getId();
        if(id.length()<3 || id.length()>16){ errors.rejectValue("id","id is wrong");}

        pw = joinFirstDto.getPw();
        pwCheck = joinFirstDto.getPwCheck();
        if(pw != pwCheck){errors.rejectValue("pw","pw does not match pwcheck");}

        email = joinFirstDto.getEmail();
        if(email == "123@naver.com"){ errors.rejectValue("email","email is "); }

        phone = joinFirstDto.getEmail();
        if(email == "123123"){ errors.rejectValue("phone","phone is "); }
    }
}
