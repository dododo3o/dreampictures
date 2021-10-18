package com.example.dreampicturespring.vo;

import lombok.Data;

@Data
public class CommentVO {
    private String avatarimg;
    private String author;
    private String date;
    private String comments;
    private String no_membership;


    public CommentVO(){ }

    public CommentVO(String avatarimg, String author, String date, String comments, String no_membership) {
        this.avatarimg = avatarimg;
        this.author = author;
        this.date = date;
        this.comments = comments;
        this.no_membership = no_membership;
    }
}
