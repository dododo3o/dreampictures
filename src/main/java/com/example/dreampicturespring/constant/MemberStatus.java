package com.example.dreampicturespring.constant;


import lombok.Getter;

@Getter
public enum MemberStatus {
    IN("회원"),
    OUT("회원탈퇴");
    private MemberStatus(String msg) {}
}
