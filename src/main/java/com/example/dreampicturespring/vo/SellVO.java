package com.example.dreampicturespring.vo;
import lombok.Data;
import java.sql.Date;
import java.time.LocalDate;

@Data
public class SellVO {
    private String pname;
    private String style;
    private String theme;
    private Integer height;
    private Integer width;
    private Integer price;
//    private LocalDate production;
    private String exp;
    private String url;

    public SellVO(){}
}
