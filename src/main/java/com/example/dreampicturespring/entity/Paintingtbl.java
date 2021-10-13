package com.example.dreampicturespring.entity;

import com.example.dreampicturespring.vo.SellVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.util.StringUtils;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;

@Entity
@Table(name="paintingtbl")
@Getter
@Setter
@ToString
public class Paintingtbl {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PAINTING_SEQ")
    @SequenceGenerator(sequenceName = "PAINTINGSQ", allocationSize = 1, name = "PAINTING_SEQ")
    private Long no_painting;
    private String pname;
    private String theme;
    private int width;
    private int height;
    private int price;
    private String style;
    @Column(name="writedate")
    private LocalDateTime writedate;
    private Date production;
    private String exp;
    private Long no_membership;

    public Paintingtbl(){
        if(StringUtils.isEmpty(writedate)){
            this.writedate = LocalDateTime.now();
        }
    }
    public Paintingtbl(SellVO vo,Long no_membership){
        this.pname = vo.getPname();
        this.theme = vo.getTheme();
        this.width = vo.getWidth();
        this.height = vo.getHeight();
        this.price = vo.getPrice();
        this.style = vo.getStyle();
        if(StringUtils.isEmpty(writedate)){
            this.writedate = LocalDateTime.now();
        }
        this.production = vo.getProduction();
        this.exp = vo.getExp();
        this.no_membership = no_membership;
    }

}
