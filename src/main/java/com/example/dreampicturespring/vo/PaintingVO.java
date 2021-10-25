package com.example.dreampicturespring.vo;
import com.example.dreampicturespring.entity.Membershiptbl;
import com.example.dreampicturespring.entity.Paintingtbl;
import lombok.Data;
import java.time.LocalDate;
@Data
public class PaintingVO {
    private Integer no_painting;
    private String pname;
    private String paintingimg;
    private String avatarimg;
    private String nickname;
    private LocalDate writedate;
    private int width;
    private int height;
    private String exp;

    public PaintingVO() {}
    public PaintingVO(Paintingtbl paintingtbl, Membershiptbl membershiptbl){
        this.no_painting = paintingtbl.getNo_painting();
        this.pname = paintingtbl.getPname();
        this.paintingimg = paintingtbl.getUrl();
        this.avatarimg = membershiptbl.getImg();
        this.nickname = membershiptbl.getNickname();
        this.writedate = paintingtbl.getWritedate();
        this.width = paintingtbl.getWidth();
        this.height = paintingtbl.getHeight();
        this.exp = paintingtbl.getExp();
    }
}
