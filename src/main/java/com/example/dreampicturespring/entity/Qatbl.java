package com.example.dreampicturespring.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.util.StringUtils;

import javax.persistence.*;
import java.time.LocalDateTime;

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
    private String content;

    @Column(name="writedate")
    private LocalDateTime writedate;
    private Integer hit;
    private Integer status;

    public Qatbl(){
        if(StringUtils.isEmpty(writedate)){
            this.writedate = LocalDateTime.now();
        }
    }
    public Qatbl(Membershiptbl membershiptbl,String content,Integer status) {
        this.no_membership = membershiptbl.getNo_membership();
        this.content = content;
        this.hit = 0;
        this.status = status;
        if(StringUtils.isEmpty(writedate)){
            this.writedate = LocalDateTime.now();
        }
    }
}