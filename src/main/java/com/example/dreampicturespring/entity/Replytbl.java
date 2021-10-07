package com.example.dreampicturespring.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.util.StringUtils;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name="relytbl")
@Getter
@Setter
@ToString
public class Replytbl {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "REPLY_SEQ")
    @SequenceGenerator(sequenceName = "REPLYSQ", allocationSize = 1, name = "REPLY_SEQ")
    private long no_reply;
    private String reply;

    @Column(name="writedate")
    private LocalDateTime writedate;

    @Column(name="adminid")
    private String adminid;

    public Replytbl(){
        if(StringUtils.isEmpty(writedate)){
            this.writedate = LocalDateTime.now();
        }
    }
}
