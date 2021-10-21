package com.example.dreampicturespring.vo;

import lombok.Data;

@Data
public class CommentVO {
    private String avatarimg;
    private String author;
    private String date;
    private String comments;

    private Integer no_membership;

    public CommentVO(){ }
}