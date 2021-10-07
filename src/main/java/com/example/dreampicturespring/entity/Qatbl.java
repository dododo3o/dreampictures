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
    private Long no_qa;
    private Long no_membership;
    private String title;
    private String content;

    @Column(name="writedate")
    private LocalDateTime writedate;
    private Long hit;
    private Long status;
    private Long no_reply;

    public Qatbl(){
        if(StringUtils.isEmpty(writedate)){
            this.writedate = LocalDateTime.now();
        }
    }
}