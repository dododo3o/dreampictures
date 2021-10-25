package com.example.dreampicturespring.vo;
import lombok.Data;

import java.util.Arrays;
import java.util.List;

@Data
public class CommentVO {
    private String avatarimg;
    private String author;
    private String date;
    private String comments;

    private Integer no_comment;

    private Integer no_membership;

    public CommentVO(){ }
}
