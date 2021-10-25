package com.example.dreampicturespring.vo;
import lombok.Data;
import java.sql.Date;
@Data
public class SellVO {
    private String pname;
    private String style;
    private String theme;
    private Integer height;
    private Integer width;
    private Integer price;
    private String production;
    private String exp;
    private String url;

    public SellVO(){}
}
