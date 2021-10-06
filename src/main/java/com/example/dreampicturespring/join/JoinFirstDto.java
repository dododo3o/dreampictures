package com.example.dreampicturespring.join;


import lombok.Data;

@Data
public class JoinFirstDto {
    private String id;
    private String pw;
    private String pwCheck;
    private String email;
    private String phone;
}