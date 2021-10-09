package com.example.dreampicturespring.constant;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public enum Path {
    PROFILE("D:\\dreampicture_spring\\src\\main\\resources\\user"),
    PHONE("중복된 번호 입니다. 다시확인해주세요.");
    private Path(String msg) {}
}
