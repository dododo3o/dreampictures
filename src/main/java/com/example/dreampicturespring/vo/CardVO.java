package com.example.dreampicturespring.vo;

import lombok.Data;

@Data
public class CardVO {
    private String avatarimg;
    private String paintingmimg;
    private String nickname;
    private String pname;

    public CardVO(){

    }

    public CardVO(String avatarimg,String paintingmimg,String nickname,String pname){
        this.avatarimg = avatarimg;
        this.paintingmimg = paintingmimg;
        this.nickname = nickname;
        this.pname = pname;
    }

}
