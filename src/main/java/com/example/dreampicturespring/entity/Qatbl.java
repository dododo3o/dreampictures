package com.example.dreampicturespring.entity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.util.StringUtils;
import javax.persistence.*;
import java.time.LocalDate;
import java.time.ZoneId;

@Entity
@Table(name="Qatbl")
@Getter
@Setter
@ToString
public class Qatbl {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "QA_SEQ")
    @SequenceGenerator(sequenceName = "QASQ", allocationSize = 1, name = "QA_SEQ")
    private Integer no_qa;
    private Integer no_membership;
    private Integer category;
    private String content;

    @Column(name="writedate")
    private LocalDate writedate;
    private Integer status;
    private String answer;

    public Qatbl(){
        if(StringUtils.isEmpty(writedate)){
            this.writedate = LocalDate.now(ZoneId.of("Asia/Seoul"));
        }
    }
    public Qatbl(Membershiptbl membershiptbl,String content,Integer category, Integer status) {
        this.no_membership = membershiptbl.getNo_membership();
        this.category = category;
        this.content = content;
        this.status = status;
        if(StringUtils.isEmpty(writedate)){
            this.writedate = LocalDate.now(ZoneId.of("Asia/Seoul"));
        }
    }
}