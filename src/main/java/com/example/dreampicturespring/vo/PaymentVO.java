package com.example.dreampicturespring.vo;

import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Paintingtbl;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.Date;

@Data
public class PaymentVO {
    private Integer no_painting;
    private String pname;
    private String paintingimg;
    private String avatarimg;
    private String nickname;
    private String nickname_artist;
    private String email;
    private String tel;
    private String addr;
    private Integer price;
    private Integer dreampay;
    private String sum;
    private Date production;
    private int width;
    private int height;
    private String exp;
    private Integer buyer_no_member;
    private Integer seller_no_member;

    public PaymentVO() {}
    public PaymentVO(Paintingtbl paintingtbl, Membershiptbl membershiptbl, Membershiptbl sellerMembershiptbl){
        this.no_painting = paintingtbl.getNo_painting();
        this.pname = paintingtbl.getPname();
        this.paintingimg = sellerMembershiptbl.getImg()+"/paintingimg/"+paintingtbl.getPname()+"/0.jpg";
        this.avatarimg = membershiptbl.getImg()+"/avatarimg/avatarimg.jpg";
        this.nickname = membershiptbl.getNickname();
        this.email = membershiptbl.getEmail();
        this.tel = membershiptbl.getTel();
        this.addr = membershiptbl.getAddr();
        this.price = paintingtbl.getPrice();
        this.dreampay = membershiptbl.getDreampay();
        this.sum = this.dreampay - this.price >= 0 ? Integer.toString(this.dreampay - this.price) : "포인트가 부족합니다.";
        this.production = paintingtbl.getProduction();
        this.width = paintingtbl.getWidth();
        this.height = paintingtbl.getHeight();
        this.exp = paintingtbl.getExp();
        this.buyer_no_member = membershiptbl.getNo_membership();
        this.seller_no_member = sellerMembershiptbl.getNo_membership();
    }


}
