package com.example.dreampicturespring.vo;
import com.example.dreampicturespring.entity.Membershiptbl;
import lombok.Data;
@Data
public class RegisterVO {
    private String email;
    private String pwd;
    private String tel;
    private String addr;
    private String addrdetail;
    private String nickname;
    private String img;

    public RegisterVO(){}

    public RegisterVO(Membershiptbl ms){
        this.email=ms.getEmail();
        this.pwd = ms.getPwd();
        this.tel = ms.getTel();
        this.addr = ms.getAddr();
        this.addrdetail = ms.getDetailAddr();
        this.nickname = ms.getNickname();
        this.img = ms.getImg();
    }
}