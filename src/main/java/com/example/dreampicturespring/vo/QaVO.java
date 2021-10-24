package com.example.dreampicturespring.vo;
import lombok.Data;
@Data
public class QaVO {
    private String category;
    private String nickname;
    private String content;
    private String answer;
    private Integer no_qa;
    public QaVO(){ }

    public void parser(Integer category){
        switch(category){
            case 0: this.category = "운영정책"; break;
            case 1: this.category = "구매/판매"; break;
            case 2: this.category = "가격정책"; break;
            case 3: this.category = "계정인증"; break;
            case 4: this.category = "그 외 질문"; break;
            default: break;
        }
    }
}