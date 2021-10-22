package com.example.dreampicturespring.vo;

import lombok.Data;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.Map;

@Data
public class AdminVO {
    private Integer noticeNum;
    private Integer questionNum;
    private Integer registerNum;
    private Integer memberNum;
    private Integer newMemberPercent;
    private Integer oneWeekSaleVolumePercent;
    private Integer oneWeekRegisterPercent;
    private Integer popart;
    private Integer abstracts;
    private Integer animal;
    private Integer scenery;
    private Integer character;
    private Integer still;
    private Integer objet;
    private Integer water;
    private Integer oils;
    private Integer pastel;
    private Integer acrylic;
    private Integer pen;
    private Integer pencil;
    private Integer crayon;
    private Integer gouache;
    private String person1img;
    private String person1;
    private String person2img;
    private String person2;
    private String person3img;
    private String person3;
//    private String reply1img;
//    private String reply1nickname;
//    private String reply1date;
//    private String reply1content;
//    private String reply2img;
//    private String reply2nickname;
//    private String reply2date;
//    private String reply2content;
}
