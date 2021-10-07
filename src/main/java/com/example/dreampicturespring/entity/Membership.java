package com.example.dreampicturespring.vo;

import com.example.dreampicturespring.constant.MemberStatus;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.util.StringUtils;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@ToString
public class Membership {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "MEM_SEQ")
    @SequenceGenerator(sequenceName = "MEMBER_SEQ", allocationSize = 1, name = "MEM_SEQ")
    private Long no_membershiptbl;
    private String email;
    private String pwd;
    private String addr;
    private String detailAddr;
    private String zipcode;
    private String nickname;
    private String img;
    private LocalDateTime startDate;
    private String memberStatus = MemberStatus.IN.name();
    public Membership(){
        if(StringUtils.isEmpty(startDate)){
            this.startDate = LocalDateTime.now();
        }
    }
}
