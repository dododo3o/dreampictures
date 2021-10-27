package com.example.dreampicturespring.vo;
import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Paintingtbl;
import lombok.Data;

import java.time.LocalDate;
import java.util.Date;

@Data
public class PaymentVO {
    public Integer no_painting;
    public String pname;
    public String paintingimg;
    public String avatarimg;
    public String nickname;
    public String nickname_artist;
    public String email;
    public String tel;
    public String addr;
    public Integer price;
    public Integer dreampay;
    public String sum;
    public LocalDate production;
    public int width;
    public int height;
    public String exp;
    public Integer buyer_no_member;
    public Integer seller_no_member;

    public PaymentVO() {}
    public PaymentVO(Paintingtbl paintingtbl, Membershiptbl membershiptbl, Membershiptbl sellerMembershiptbl){
        this.no_painting = paintingtbl.getNo_painting();
        this.pname = paintingtbl.getPname();
        this.paintingimg = paintingtbl.getUrl();
        this.avatarimg = membershiptbl.getImg();
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
