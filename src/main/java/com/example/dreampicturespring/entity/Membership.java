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

    public Membership(){
        if(StringUtils.isEmpty(startDate)){
            this.startDate = LocalDateTime.now();
        }
    }
}