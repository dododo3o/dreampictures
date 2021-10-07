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
@ToString//모든데이터타입을 스트링을 바꿔줌
public class Membershiptbl {
    @Id //바로아래있는 멤버를 프라이머리키지정해준다.
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "MEM_SEQ")//맴버테이블의 시퀀스를 만들어준다.
    @SequenceGenerator(sequenceName = "MEMBERSHIPSQ", allocationSize = 1, name = "MEM_SEQ")//시퀀스를 만들어주는데 오른쪽의 시퀀스 이름을 똑같이 맞춰야한다.
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