package com.example.dreampicturespring.vo;
import com.example.dreampicturespring.entity.Membershiptbl;
import lombok.Data;
@Data
public class MypageVO {

    private String avatarimg;
    private String nickname;
    private String addr;
    private String email;
    private String tel;
    private Integer dreampay;

    public MypageVO() { }
    public MypageVO(Membershiptbl membershiptbl) {
        System.out.println(membershiptbl);
        this.avatarimg = membershiptbl.getImg();
        this.nickname = membershiptbl.getNickname();
        this.addr = membershiptbl.getAddr();
        this.email = membershiptbl.getEmail();
        this.tel = membershiptbl.getTel();
        this.dreampay = membershiptbl.getDreampay();
    }
}
