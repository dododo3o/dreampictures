package com.example.dreampicturespring.constant;


import lombok.Getter;

@Getter
public enum msg {
    EMAIL("중복된 이메일 입니다. 다시확인해주세요."),
    PHONE("중복된 번호 입니다. 다시확인해주세요.");
    private msg(String msg) {}
}
