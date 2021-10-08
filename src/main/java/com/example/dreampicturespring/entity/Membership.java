package com.example.dreampicturespring.entity;

import com.example.dreampicturespring.constant.MemberStatus;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.util.StringUtils;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity//엔터티라고 선언해줘야함
@Table(name="membershiptbl")//sql의 테이블이름이기때문에 이름틀리면 나가리
@Getter
@Setter

@ToString
public class Membership {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "MEM_SEQ")
    @SequenceGenerator(sequenceName = "MEMBERSHIPSQ", allocationSize = 1, name = "MEM_SEQ")
    private Long no_membership;
    @Column
    private String email;
    @Column
    private String pwd;
    @Column
    private String tel;
    @Column
    private String addr;
    @Column(name = "detailaddr")
    private String detailAddr;
    @Column
    private Integer zipcode;
    @Column
    private String nickname;
    @Column
    private String img;
    @Column(name = "startdate")
    private LocalDateTime startDate;
    @Column(name = "memberstatus")
    private Integer memberStatus;
    @Column(name = "reported")
    private Integer reported;

    public Membership() { }

    public Membership(String email, String pwd, String tel, String addr, String detatilAddr, Integer zipcode, String img){
        this.email = email;
        this.pwd = pwd;
        this.tel = tel;
        this.addr = addr;
        this.detailAddr = detatilAddr;
        this.zipcode = zipcode;
        this.img = img;
        this.memberStatus = 0;
        this.reported = 0;
        if(StringUtils.isEmpty(startDate)){ this.startDate = LocalDateTime.now();}
    }
}