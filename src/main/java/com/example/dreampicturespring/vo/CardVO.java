package com.example.dreampicturespring.vo;
import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Paintingtbl;
import lombok.Data;

import java.time.LocalDate;
import java.util.List;

@Data
public class CardVO {
    private String no_painting;
    private String avatarimg;
    private String paintingmimg;
    private String nickname;
    private String pname;
    private LocalDate writedate;
    private Integer price;

    private Integer commentNumber;
    private List<CommentVO> commentVOList;

    public CardVO(){}
    public CardVO(String no_painting,String avatarimg,String paintingmimg,String nickname,String pname){
        this.no_painting = no_painting;
        this.avatarimg = avatarimg;
        this.paintingmimg = paintingmimg;
        this.nickname = nickname;
        this.pname = pname;
    }
    public CardVO(Paintingtbl paintingtbl, Membershiptbl membershiptbl){
        this.no_painting = Integer.toString(paintingtbl.getNo_painting());
        this.avatarimg = membershiptbl.getImg();
        this.paintingmimg = paintingtbl.getUrl();
        this.nickname = membershiptbl.getNickname();
        this.pname = paintingtbl.getPname();
    }

}
