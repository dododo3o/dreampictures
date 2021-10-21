package com.example.dreampicturespring.vo;

import lombok.Data;

@Data
public class MemberVO {
    private String avatarimg;
    private String nickname;
    private Integer reported;
    private String addr;
    private String tel;
    private Integer dreampay;
    private Integer input_total;
    private Integer output_total;

    public MemberVO() {}
}
