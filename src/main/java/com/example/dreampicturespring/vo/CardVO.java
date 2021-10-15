package com.example.dreampicturespring.vo;

import com.example.dreampicturespring.entity.Paintingtbl;
import lombok.Data;

@Data
public class CardVO {
    private String no_painting;
    private String avatarimg;
    private String paintingmimg;
    private String nickname;
    private String pname;

    public CardVO(){ }
    public CardVO(String no_painting,String avatarimg,String paintingmimg,String nickname,String pname){
        this.no_painting = no_painting;
        this.avatarimg = avatarimg;
        this.paintingmimg = paintingmimg;
        this.nickname = nickname;
        this.pname = pname;
    }
    public CardVO(Paintingtbl paintingtbl){
//        this.no_painting = Long.toString(paintingtbl.getNo_painting());
//        this.avatarimg = paintingtbl.get;
//        this.paintingmimg = paintingmimg;
//        this.nickname = nickname;
//        this.pname = pname;

    }

}
