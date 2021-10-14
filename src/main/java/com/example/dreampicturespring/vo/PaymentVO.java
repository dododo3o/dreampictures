package com.example.dreampicturespring.vo;

import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Paintingtbl;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.Date;

@Data
public class PaymentVO {
    private Long no_painting;
    private String pname;
    private String paintingimg;
    private String avatarimg;
    private String nickname;
    private String email;
    private String tel;
    private String addr;
    private Integer price;
    private Date production;
    private int width;
    private int height;
    private String exp;

    public PaymentVO() {}
    public PaymentVO(Paintingtbl paintingtbl, Membershiptbl membershiptbl){
        this.no_painting = paintingtbl.getNo_painting();
        this.pname = paintingtbl.getPname();
        this.paintingimg = membershiptbl.getImg()+"/paintingimg/"+paintingtbl.getPname()+"/0.jpg";
        this.avatarimg = membershiptbl.getImg()+"/avatarimg/avatarimg.jpg";
        this.nickname = membershiptbl.getNickname();
        this.email = membershiptbl.getEmail();
        this.tel = membershiptbl.getTel();
        this.addr = membershiptbl.getAddr();
        this.price = paintingtbl.getPrice();
        this.production = paintingtbl.getProduction();
        this.width = paintingtbl.getWidth();
        this.height = paintingtbl.getHeight();
        this.exp = paintingtbl.getExp();
    }


}
