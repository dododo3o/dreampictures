package com.example.dreampicturespring.vo;
import lombok.Data;
import java.util.Date;
@Data
public class CartVO {
    private Integer no_cart;
    private Integer no_membership;
    private Integer no_painting;
    private String writedate;
    private Integer totalprice;

    public CartVO(){ }
    public CartVO(Integer no_cart, Integer no_membership, Integer no_painting, Date writedate, Integer totalprice){
    }
}
