package com.example.dreampicturespring.vo;

import lombok.Data;

@Data
public class PaintingVO {
    private String subject;
    private String style;
    private String theme;
    private int width;
    private int height;
    private int price;
    private String writedate;//date로 해야하는지?!?!
    private String content;
}
