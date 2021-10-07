package com.example.dreampicturespring.entity;

import com.example.dreampicturespring.constant.MemberStatus;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.util.StringUtils;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name="membershiptbl")
@Getter
@Setter
@ToString
public class Membershiptbl {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "MEM_SEQ")
    @SequenceGenerator(sequenceName = "MEMBERSHIPSQ", allocationSize = 1, name = "MEM_SEQ")
    private Long no_membership;
    private String email;
    private String pwd;
    private String tel;
    private String addr;
    private String detailAddr;
    private Integer zipcode;
    private String nickname;
    private String img;
    private LocalDateTime startDate;
    private Integer memberStatus;
    public Membershiptbl(){
        if(StringUtils.isEmpty(startDate)){
            this.startDate = LocalDateTime.now();
        }
    }
}
