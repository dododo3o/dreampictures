package com.example.dreampicturespring.entity;
import com.example.dreampicturespring.vo.SellVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.util.StringUtils;
import javax.persistence.*;
import java.time.LocalDate;
import java.time.ZoneId;
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
    private Integer no_painting;
    private String pname;
    private String theme;
    private Integer width;
    private Integer height;
    private Integer price;
    private String style;
    @Column(name="writedate")
    private LocalDate writedate;
    private LocalDate production;
    private String exp;
    private Integer status;
    private Integer no_membership;
    private String url;

    public Paintingtbl(){
        if(StringUtils.isEmpty(writedate)){
            this.writedate = LocalDate.now(ZoneId.of("Asia/Seoul"));
        }
    }
    public Paintingtbl(SellVO vo,Integer no_membership,LocalDate production){
        this.pname = vo.getPname();
        this.theme = vo.getTheme();
        this.width = vo.getWidth();
        this.height = vo.getHeight();
        this.price = vo.getPrice();
        this.style = vo.getStyle();
        if(StringUtils.isEmpty(writedate)){
            this.writedate = LocalDate.now(ZoneId.of("Asia/Seoul"));
        }
        this.production = production;
        this.exp = vo.getExp();
        this.status = 0;
        this.no_membership = no_membership;
        this.url = vo.getUrl();
    }

}