package com.example.dreampicturespring.vo;

import lombok.Data;

@Data
public class RegisterVO {
    private String email;
    private String pwd;
    private String tel;
    private String addr;
    private String addrdetail;
    private String nickname;
    private String img;
}